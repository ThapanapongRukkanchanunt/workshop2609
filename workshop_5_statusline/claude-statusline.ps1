#Requires -Version 7.0
# Claude Code statusLine script -- WINDOWS PORT of claude-statusline.sh.
#
# Same output, same Catppuccin Mocha palette, same 50/75/90 threshold bands
# as the bash original sitting next to this file. It exists because Windows
# boxes here have no `jq` and no Git Bash, and routing the .sh through
# `wsl.exe` costs ~280ms per render AND hands the script a Windows
# `current_dir` (G:\...) that its `${DIR##*/}` / `git -C` logic can't read.
#
# THIS FILE AND claude-statusline.sh ARE A MATCHED PAIR. Change one, change
# the other -- the format/color spec lives in AGENTS.md beside them, and the
# threshold bands mirror the ones in claude-statusline.sh (macOS/Linux), and are
# barColor()/pctColor() (mini_tv_claude_quota's UsageMode.cpp etc).
#
# Wiring (per-machine ~/.claude/settings.json, NOT synced):
#   "statusLine": {
#     "type": "command",
#     "command": "pwsh -NoProfile -NonInteractive -File C:/claude/claude-statusline.ps1"
#   }
# Forward slashes are fine and avoid JSON backslash-escaping pain.

$ErrorActionPreference = 'Stop'

# The branch glyph is U+E0A0 (Powerline private-use area). Built from its
# codepoint on purpose -- the bash original documents that literal PUA glyph
# pastes silently drop through editing pipelines, and that applies here too.
$BranchIcon = [char]0xE0A0

# Emit UTF-8 without a BOM so the glyph survives and no stray bytes lead the line.
[Console]::OutputEncoding = [Text.UTF8Encoding]::new($false)

$raw = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }

try { $j = $raw | ConvertFrom-Json } catch { exit 0 }

# ---------------------------------------------------------------- palette --
# Catppuccin Mocha, identical hex values to the .sh and to the ccstatusline
# config at ~/.config/ccstatusline/settings.json.
$MAUVE    = 'cba6f7'  # model
$GREEN    = 'a6e3a1'  # < 50%
$YELLOW   = 'f9e2af'  # 50-74%
$PEACH    = 'fab387'  # 75-89%
$RED      = 'f38ba8'  # 90%+
$SKY      = '89dceb'  # dir
$LAVENDER = 'b4befe'  # branch

$ESC = [char]27

function Get-Colored {
    param([string]$Hex, [string]$Text)
    $r = [Convert]::ToInt32($Hex.Substring(0, 2), 16)
    $g = [Convert]::ToInt32($Hex.Substring(2, 2), 16)
    $b = [Convert]::ToInt32($Hex.Substring(4, 2), 16)
    "$ESC[38;2;$r;$g;${b}m$Text$ESC[0m"
}

# Percentage -> palette hex for its threshold band. Mirrors hex_for() in the .sh.
function Get-ThresholdHex {
    param([int]$Pct)
    if     ($Pct -ge 90) { $RED }
    elseif ($Pct -ge 75) { $PEACH }
    elseif ($Pct -ge 50) { $YELLOW }
    else                 { $GREEN }
}

# resets_at (unix epoch seconds) -> "<d>d<h>h<mm>m" / "<h>h<mm>m" / "<m>m",
# shortest form that fits. Empty if missing or already past. Day rollover only
# when -AllowDays (the 7d window), matching countdown()'s second arg in the .sh.
function Get-Countdown {
    param($ResetsAt, [switch]$AllowDays)
    if ($null -eq $ResetsAt -or "$ResetsAt" -eq '') { return '' }
    $now   = [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
    $delta = [int64]$ResetsAt - $now
    if ($delta -le 0) { return '' }
    $d = 0
    $h = [int][math]::Floor($delta / 3600)
    $m = [int][math]::Floor(($delta % 3600) / 60)
    if ($AllowDays -and $h -ge 24) { $d = [int][math]::Floor($h / 24); $h = $h % 24 }
    if     ($d -gt 0) { '{0}d{1}h{2:d2}m' -f $d, $h, $m }
    elseif ($h -gt 0) { '{0}h{1:d2}m'     -f $h, $m }
    else              { '{0}m'            -f $m }
}

# ------------------------------------------------------------- extraction --
$model  = ([string]$j.model.display_name).ToLowerInvariant()
$dir    = [string]$j.workspace.current_dir
$effort = [string]$j.effort.level

# Round first, then band -- same order as the .sh, which printf '%.0f's before
# hex_for() truncates. Both use banker's rounding, so the two agree on .5 cases.
$ctx = [int][math]::Round([double]($j.context_window.used_percentage ?? 0))

$q5hRaw = $j.rate_limits.five_hour.used_percentage
$q7dRaw = $j.rate_limits.seven_day.used_percentage

# ----------------------------------------------------------------- render --
$segments = @()

# Effort is always two letters, and omitted entirely when the model doesn't
# report one (some models don't take the effort parameter at all).
$eff = ''
if ($effort) {
    $eff = ' ' + $(switch ($effort) {
        'low'    { 'lo' }
        'medium' { 'md' }
        'high'   { 'hi' }
        'xhigh'  { 'xh' }
        'max'    { 'mx' }
        default  { $effort }
    })
}
$segments += Get-Colored $MAUVE "$model$eff"

$segments += Get-Colored (Get-ThresholdHex $ctx) "ctx $ctx%"

# 5h/7d are absent from the JSON entirely unless Claude Code is talking to
# first-party Anthropic endpoints -- see AGENTS.md, an ANTHROPIC_BASE_URL
# pointed at a proxy means these headers never arrive. Omit, don't show zeros.
if ($null -ne $q5hRaw -and "$q5hRaw" -ne '') {
    $q5h = [int][math]::Round([double]$q5hRaw)
    $cd  = Get-Countdown $j.rate_limits.five_hour.resets_at
    if ($cd) { $cd = " $cd" }
    $segments += Get-Colored (Get-ThresholdHex $q5h) "5h $q5h%$cd"
}

if ($null -ne $q7dRaw -and "$q7dRaw" -ne '') {
    $q7d = [int][math]::Round([double]$q7dRaw)
    $cd  = Get-Countdown $j.rate_limits.seven_day.resets_at -AllowDays
    if ($cd) { $cd = " $cd" }
    $segments += Get-Colored (Get-ThresholdHex $q7d) "7d $q7d%$cd"
}

# Last path segment only. Split on both separators: current_dir arrives as a
# Windows path here (G:\...\02 Lab) but can be POSIX-style under WSL-hosted
# sessions, and Split-Path -Leaf alone mishandles the mixed case.
$dirName = ''
if ($dir) { $dirName = ($dir.TrimEnd('\', '/') -split '[\\/]')[-1] }
if ($dirName.Length -gt 20) { $dirName = $dirName.Substring(0, 18) + '..' }
if ($dirName) { $segments += Get-Colored $SKY $dirName }

$line = $segments -join ' | '

# Branch is read live from the local git, never from the JSON. Silently absent
# outside a repo, on a detached HEAD (--show-current prints nothing), and when
# there is no native git at all -- some Windows boxes here only have git inside
# WSL, and reaching for it through wsl.exe would cost ~280ms on every single
# render, which is the whole reason this port exists. Install Git for Windows
# if you want the branch segment. Never fatal: a broken statusline command
# means Claude Code shows no statusline at all.
if ($dir -and (Test-Path -LiteralPath $dir) -and (Get-Command git -ErrorAction SilentlyContinue)) {
    try {
        $branch = & git -C $dir branch --show-current 2>$null
        if ($LASTEXITCODE -eq 0 -and $branch) {
            $line += ' ' + (Get-Colored $LAVENDER "$BranchIcon $($branch.Trim())")
        }
    } catch { }
}

[Console]::Out.Write($line + "`n")
