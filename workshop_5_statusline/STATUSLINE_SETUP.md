# Claude Code Statusline — Workshop Setup

A statusline puts the numbers that matter at the bottom of every Claude Code
session: which model is running, the reasoning effort level, how full the
context window is, how much of your 5-hour and 7-day quota you have burned,
and the current git branch.

`ctx`, `5h`, and `7d` are **threshold-coloured** — green under 50%, yellow
50–74%, orange 75–89%, red 90%+. That is the whole point of this script and
the reason it is hand-rolled rather than an npm tool: the popular community
statuslines give each widget one fixed colour, so a context window at 12% and
one at 94% look identical.

Why we install it in this workshop: **context rot** and **model/effort cost**
only land as lessons if you can *see* the numbers move while you work.

All values come from the JSON Claude Code pipes into the script on stdin.
No API polling, no credential reading, no network call.

Files in this folder:

- `claude-statusline.sh` — macOS / Linux / WSL (needs `jq`)
- `claude-statusline.ps1` — Windows PowerShell 7 (no `jq` needed)

---

## Prerequisites

**0. Claude Code CLI installed and logged in.** Check:

```bash
claude --version
```

If "command not found", install first — one line for your system:

```bash
# macOS / Linux (bash)
curl -fsSL https://claude.ai/install.sh | bash

# Windows (PowerShell) — policy + no-profile flags matter on locked-down machines
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://claude.ai/install.ps1 | iex"
```

(or `npm install -g @anthropic-ai/claude-code` if Node.js is already set up),
then run `claude` once in a terminal and follow the login
prompt before continuing.

**Windows only:** the `.ps1` script needs **PowerShell 7** (`pwsh`) — Windows'
built-in PowerShell 5.1 cannot run it. Check `pwsh --version`; if missing:
`winget install Microsoft.PowerShell`.

**1. `jq` must be installed** (macOS/Linux script only — skip if using the
Windows `.ps1`). Check:

```bash
which jq || echo "NOT INSTALLED"
```

If it prints `NOT INSTALLED`: macOS → `brew install jq` · Ubuntu →
`sudo apt install jq`.

**2. Your terminal needs 24-bit truecolor.** Check:

```bash
echo -e "\033[38;2;255;0;0mIf this word is red, truecolor works.\033[0m"
```

Virtually every modern terminal qualifies. If the word is not red, use a
different terminal (iTerm2, Windows Terminal, VS Code's integrated terminal).

**3. Optional, cosmetic only:** a Nerd Font makes the git branch glyph render
as an icon instead of a small box. Works fine without it.

---

## Step 1 — get the script

Download `claude-statusline.sh` from this folder (it is on the shared Drive
link from the deck), then put it where Claude Code looks for it:

```bash
mkdir -p ~/.claude/scripts
cp ~/Desktop/demo_files/workshop_5_statusline/claude-statusline.sh ~/.claude/scripts/statusline.sh
chmod +x ~/.claude/scripts/statusline.sh
```

Check it landed and is executable:

```bash
ls -la ~/.claude/scripts/statusline.sh
```

Expect a real file with non-zero size and an `x` in the permissions
(`-rwxr-xr-x`). If there is no `x`, re-run the `chmod +x`.

**Windows:** copy `claude-statusline.ps1` anywhere instead (e.g.
`C:\claude\claude-statusline.ps1`) and use that path in Step 2 — no `chmod`,
no `jq`, no symlink needed.

---

## Step 2 — point Claude Code at it

First look at what you already have:

```bash
cat ~/.claude/settings.json 2>/dev/null || echo "FILE DOES NOT EXIST YET"
```

**If it printed `FILE DOES NOT EXIST YET`** — create it:

```bash
mkdir -p ~/.claude
cat > ~/.claude/settings.json <<'EOF'
{
  "statusLine": {
    "type": "command",
    "command": "~/.claude/scripts/statusline.sh"
  }
}
EOF
```

**If it printed actual JSON — do NOT overwrite it.** You would destroy
settings you already have. Open it in an editor and merge in only the
`statusLine` key, as a sibling of the keys already there:

```json
"statusLine": {
  "type": "command",
  "command": "~/.claude/scripts/statusline.sh"
}
```

Remember the comma between sibling keys. This is the step people break most
often, so validate before continuing:

```bash
jq . ~/.claude/settings.json > /dev/null && echo "VALID JSON" || echo "BROKEN JSON - FIX BEFORE CONTINUING"
```

Do not move on until it says `VALID JSON`. A broken `settings.json` stops
Claude Code from starting cleanly.

The `command` uses `~`, not an absolute path, so the same settings content
works under any username on any machine.

**Windows `settings.json`:** point the command at PowerShell 7 directly,
with forward slashes:

```json
"statusLine": {
  "type": "command",
  "command": "pwsh -NoProfile -NonInteractive -File C:/claude/claude-statusline.ps1"
}
```

---

## Step 3 — see it

`settings.json` is read **only at startup**, so a session that is already
running will not pick this up. Quit Claude Code and start a new session.
The statusline appears at the bottom straight away, but only `model | ctx` fill in
at first — `5h` and `7d` appear after your first message (they come from the first
API call). Send one message, restart-free, and the full line is there.

---

## Test the script directly (bypassing Claude Code)

```bash
echo '{"model":{"display_name":"Sonnet 5"},"workspace":{"current_dir":"'"$PWD"'"},"effort":{"level":"medium"},"context_window":{"used_percentage":15.0},"rate_limits":{"five_hour":{"used_percentage":75.3,"resets_at":'"$(( $(date +%s) + 2*3600 ))"'},"seven_day":{"used_percentage":41.2,"resets_at":'"$(( $(date +%s) + 2*86400 ))"'}}}' | ~/.claude/scripts/statusline.sh
```

Should print one colored line:

```
sonnet 5 md | ctx 15% | 5h 75% 2h00m | 7d 41% 2d00h00m | <folder> <branch>
```

with `ctx 15%`/`7d 41%` green, `5h 75%` orange. If this works but Claude Code
shows nothing, the problem is in `settings.json`, not the script.

---

## If it breaks

| Symptom | Cause and fix |
|---|---|
| No statusline at all | Session was already running when you edited settings — restart Claude Code |
| No statusline, and Claude Code complains at startup | `settings.json` is not valid JSON — run the `jq .` check above |
| Statusline shows raw escape codes / garbage colours | Terminal lacks truecolor — see prerequisite 2 |
| Blank or `null` values in the fields | `jq` is missing from PATH — see prerequisite 1 |
| `permission denied` in the statusline area | Missing `chmod +x ~/.claude/scripts/statusline.sh` |
| `5h` / `7d` never appear | Normal early in a session (quota fields appear after the first API call); also absent when routing through a non-Anthropic API endpoint |
| Branch shows a small box instead of an icon | Cosmetic only — install a Nerd Font, or ignore it |

---

## Reading the statusline

| Field | Meaning |
|---|---|
| `model` | The model serving this session |
| `effort` | Reasoning effort level (`lo`/`md`/`hi`) |
| `ctx` | Percentage of the context window used — the number `/compact` resets |
| `5h` | Percentage of the 5-hour rate limit used, with reset countdown |
| `7d` | Percentage of the 7-day rate limit used, with reset countdown |
| branch | Current git branch, read live |

When `ctx` goes orange, you are in the zone where answer quality starts to
degrade — that is context rot. When `5h` goes red, pace yourself: the window
resets on the countdown shown next to it.
