// Workshop 4 — Dijkstra Shortest Path: Step-by-Step Slides (7 pages, 16:9)
// Build: typst compile --root . --font-path f_fonts --ignore-system-fonts shortest_path.typ shortest_path.pdf

#set page(width: 33.87cm, height: 19.05cm,
  margin: (top: 0.9cm, bottom: 0.8cm, left: 1.3cm, right: 1.3cm),
  fill: white)
#set text(font: ("Noto Sans Thai",), size: 18pt, fill: rgb("#1A1830"))
#set par(justify: false)

// ── Colors ────────────────────────────────────────────────────────────────────
#let cg  = rgb("#9CA3AF")   // gray  : unvisited
#let cq  = rgb("#2563EB")   // blue  : queued (dist known, not final)
#let cur = rgb("#D97706")   // orange: currently processing
#let cv  = rgb("#16A34A")   // green : finalized
#let ceh = rgb("#EA580C")   // orange: highlighted edge
#let ced = rgb("#6B7280")   // gray  : normal edge
#let cwt = rgb("#DC2626")   // red   : weight label
#let cth = rgb("#0369A1")   // teal  : slide heading background
#let cup = rgb("#FBBF24")   // yellow: "updated" value highlight

// ── Node drawing ──────────────────────────────────────────────────────────────
#let nr = 0.50cm   // node radius

// A filled circle node with label (node label, fill color)
#let nd(lbl, col) = box(
  width: 2*nr, height: 2*nr, radius: nr,
  fill: col, stroke: 1.8pt + rgb("#111827"),
  align(center + horizon)[
    #text(weight: "bold", fill: white, size: 17pt)[#lbl]
  ]
)

// Place node with its CENTER at (x, y) inside parent block
#let pn(x, y, lbl, col) = place(dx: x - nr, dy: y - nr, nd(lbl, col))

// Draw edge line from (x1,y1) to (x2,y2)
#let pe(x1, y1, x2, y2, ec: ced, et: 1.5pt) = place(
  dx: x1, dy: y1,
  line(end: (x2 - x1, y2 - y1), stroke: et + ec)
)

// Weight label at edge midpoint
#let pw(x1, y1, x2, y2, w) = {
  let mx = x1 + (x2 - x1) / 2
  let my = y1 + (y2 - y1) / 2
  place(dx: mx - 0.28cm, dy: my - 0.28cm,
    box(fill: rgb("#FFFBEB"), stroke: 0.5pt + rgb("#F59E0B"),
        inset: (x: 3pt, y: 1pt), radius: 2pt)[
      #text(size: 13pt, fill: cwt, weight: "bold")[#w]
    ]
  )
}

// ── Node positions (centers, in canvas coordinates) ───────────────────────────
// Canvas is 16.5cm × 8.5cm
#let Ax = 1.7cm;  #let Ay = 4.3cm   // A — left
#let Bx = 8.2cm;  #let By = 1.4cm   // B — top center
#let Cx = 4.6cm;  #let Cy = 7.0cm   // C — bottom left
#let Dx = 12.5cm; #let Dy = 3.8cm   // D — right
#let Ex = 15.8cm; #let Ey = 1.8cm   // E — far right

// ── Graph canvas function ─────────────────────────────────────────────────────
// Edge IDs: 1=A-B  2=A-C  3=C-B  4=C-D  5=B-D  6=B-E  7=D-E
// hi = array of edge IDs to highlight in orange
#let graph(nA: cg, nB: cg, nC: cg, nD: cg, nE: cg, hi: ()) = {
  let hc(id) = if hi.contains(id) { ceh } else { ced }
  let ht(id) = if hi.contains(id) { 2.8pt } else { 1.5pt }

  // Block acts as canvas; place() anchors to block's top-left
  block(width: 16.5cm, height: 8.5cm)[
    // ── Edges (drawn first so nodes cover their ends) ──
    #pe(Ax, Ay, Bx, By, ec: hc(1), et: ht(1))
    #pe(Ax, Ay, Cx, Cy, ec: hc(2), et: ht(2))
    #pe(Cx, Cy, Bx, By, ec: hc(3), et: ht(3))
    #pe(Cx, Cy, Dx, Dy, ec: hc(4), et: ht(4))
    #pe(Bx, By, Dx, Dy, ec: hc(5), et: ht(5))
    #pe(Bx, By, Ex, Ey, ec: hc(6), et: ht(6))
    #pe(Dx, Dy, Ex, Ey, ec: hc(7), et: ht(7))
    // ── Weight labels ──
    #pw(Ax, Ay, Bx, By, "4")
    #pw(Ax, Ay, Cx, Cy, "2")
    #pw(Cx, Cy, Bx, By, "1")
    #pw(Cx, Cy, Dx, Dy, "8")
    #pw(Bx, By, Dx, Dy, "5")
    #pw(Bx, By, Ex, Ey, "3")
    #pw(Dx, Dy, Ex, Ey, "2")
    // ── Nodes (drawn last so they cover edge lines) ──
    #pn(Ax, Ay, "A", nA)
    #pn(Bx, By, "B", nB)
    #pn(Cx, Cy, "C", nC)
    #pn(Dx, Dy, "D", nD)
    #pn(Ex, Ey, "E", nE)
  ]
}

// ── Distance table ────────────────────────────────────────────────────────────
#let dtable(rows) = {
  set text(size: 15pt)
  table(
    columns: (0.5fr, 0.75fr, 0.5fr, 1.3fr),
    align: center,
    inset: 7pt,
    stroke: 0.5pt + rgb("#D1D5DB"),
    fill: (col, row) =>
      if row == 0 { rgb("#DBEAFE") }
      else if calc.even(row) { rgb("#F8FAFC") }
      else { white },
    [*V*], [*dist*], [*via*], [*status*],
    ..rows,
  )
}

// ── Color legend ──────────────────────────────────────────────────────────────
#let dot(col) = box(width: 0.9em, height: 0.9em, radius: 0.45em, fill: col)

#let legend = {
  set text(size: 13pt, fill: rgb("#374151"))
  box[
    #dot(cg) #h(0.2em)Unvisited
    #h(0.9em)#dot(cq) #h(0.2em)In queue
    #h(0.9em)#dot(cur) #h(0.2em)Current
    #h(0.9em)#dot(cv) #h(0.2em)Done
    #h(0.9em)#text(fill: ceh, weight: "bold")[━━] #h(0.2em)Active edge
  ]
}

// ── Slide shell: title bar + two-column body + optional note ─────────────────
#let slide(title, gfx, tbl, note: []) = [
  // Title bar
  #block(
    fill: cth, width: 100%, inset: (x: 12pt, y: 6pt),
    radius: 4pt, below: 0.45em,
  )[#text(fill: white, size: 25pt, weight: "bold")[#title]]
  // Body: graph | table+info
  #grid(columns: (16.8cm, 1fr), gutter: 0.7cm,
    gfx,
    tbl,
  )
  // Note callout (skipped when empty)
  #if note != [] {
    v(0.2em)
    block(
      fill: rgb("#F0FDF4"), stroke: 1pt + rgb("#86EFAC"),
      inset: (x: 10pt, y: 6pt), radius: 4pt, width: 100%, below: 0em,
    )[#text(fill: rgb("#166534"), size: 15pt)[#note]]
  }
  #v(1fr)
  #legend
  #pagebreak()
]

// ════════════════════════════════════════════════════════════════════════════════
// PAGE 1 — Graph & Problem Statement
// ════════════════════════════════════════════════════════════════════════════════

#block(fill: cth, width: 100%, inset: (x: 12pt, y: 6pt), radius: 4pt, below: 0.45em)[
  #text(fill: white, size: 25pt, weight: "bold")[Shortest Path on a Weighted Graph — Dijkstra's Algorithm]
]

#grid(columns: (16.8cm, 1fr), gutter: 0.7cm,
  // Left: bare graph (all nodes unvisited)
  stack(
    graph(),
    v(-0.2em),
    align(center)[#text(size: 14pt, fill: rgb("#6B7280"))[Undirected weighted graph G = (V, E)]],
  ),
  // Right: problem description + edge list
  [
    *Goal:* Find the minimum-cost path from source *A* to every other vertex.

    #v(0.4em)

    #set text(size: 16pt)
    #table(
      columns: (1fr, 1fr),
      align: center,
      inset: 6pt,
      stroke: 0.5pt + rgb("#D1D5DB"),
      fill: (c, r) => if r == 0 { rgb("#DBEAFE") } else { white },
      [*Edge*],  [*Weight*],
      [A — B], [4],
      [A — C], [2],
      [C — B], [1],
      [B — D], [5],
      [C — D], [8],
      [B — E], [3],
      [D — E], [2],
    )

    #v(0.4em)
    #set text(size: 18pt)
    *Source node:* A

    Dijkstra greedily expands the nearest unvisited vertex and *relaxes* its neighbors.
  ],
)

#v(1fr)
#legend
#pagebreak()

// ════════════════════════════════════════════════════════════════════════════════
// PAGE 2 — Initialize (Step 0)
// ════════════════════════════════════════════════════════════════════════════════

#slide(
  "Step 0 — Initialize",
  graph(nA: cq),   // A is seeded into the queue
  [
    #dtable((
      [A], [*0*], [—], [#text(fill: cq)[queued]],
      [B], [∞],   [—], [#text(fill: cg)[unknown]],
      [C], [∞],   [—], [#text(fill: cg)[unknown]],
      [D], [∞],   [—], [#text(fill: cg)[unknown]],
      [E], [∞],   [—], [#text(fill: cg)[unknown]],
    ))
    #v(0.5em)
    *Queue:* { A : 0 }

    #v(0.3em)
    - dist\[A\] = 0 (source)
    - All other dist = ∞
    - Insert A into min-priority queue
  ],
  note: [Set dist[source] = 0, all others = ∞. Add source to the priority queue.],
)

// ════════════════════════════════════════════════════════════════════════════════
// PAGE 3 — Step 1: Visit A, relax A-B and A-C
// ════════════════════════════════════════════════════════════════════════════════

#slide(
  "Step 1 — Visit A (dist = 0) · Relax neighbors B and C",
  graph(nA: cur, hi: (1, 2)),
  [
    #dtable((
      [A], [#text(fill: cv)[0 ✓]], [—], [#text(fill: cv)[done]],
      [B], [#text(fill: cup)[4]],  [A], [#text(fill: cq)[queued]],
      [C], [#text(fill: cup)[2]],  [A], [#text(fill: cq)[queued]],
      [D], [∞], [—], [#text(fill: cg)[unknown]],
      [E], [∞], [—], [#text(fill: cg)[unknown]],
    ))
    #v(0.5em)
    *Queue:* { C : 2, B : 4 }

    #v(0.3em)
    Pop *A* (smallest dist). Relax:
    - A—B: 0 + 4 = *4* #text(fill: cup)[↓ new]
    - A—C: 0 + 2 = *2* #text(fill: cup)[↓ new]

    Mark A done. C is now closest.
  ],
  note: [Both neighbors of A are discovered. C gets the smaller distance so it leads the queue.],
)

// ════════════════════════════════════════════════════════════════════════════════
// PAGE 4 — Step 2: Visit C, relax C-B and C-D
// ════════════════════════════════════════════════════════════════════════════════

#slide(
  "Step 2 — Visit C (dist = 2) · Relax neighbors B and D",
  graph(nA: cv, nC: cur, hi: (3, 4)),
  [
    #dtable((
      [A], [#text(fill: cv)[0 ✓]], [—], [#text(fill: cv)[done]],
      [B], [#text(fill: cup)[3]],  [C], [#text(fill: cq)[updated!]],
      [C], [#text(fill: cv)[2 ✓]], [A], [#text(fill: cv)[done]],
      [D], [#text(fill: cup)[10]], [C], [#text(fill: cq)[queued]],
      [E], [∞], [—], [#text(fill: cg)[unknown]],
    ))
    #v(0.5em)
    *Queue:* { B : 3, D : 10 }

    #v(0.3em)
    Pop *C* (smallest dist = 2). Relax:
    - C—B: 2 + 1 = *3* < 4 #text(fill: cup)[↓ improved!]
    - C—D: 2 + 8 = *10* #text(fill: cup)[↓ new]

    Mark C done. B's path improved via C.
  ],
  note: [Key relaxation: B's distance drops from 4 to 3 by going through C. dist[B] = 3 beats the direct A—B edge (4).],
)

// ════════════════════════════════════════════════════════════════════════════════
// PAGE 5 — Step 3: Visit B, relax B-D and B-E
// ════════════════════════════════════════════════════════════════════════════════

#slide(
  "Step 3 — Visit B (dist = 3) · Relax neighbors D and E",
  graph(nA: cv, nC: cv, nB: cur, hi: (5, 6)),
  [
    #dtable((
      [A], [#text(fill: cv)[0 ✓]], [—], [#text(fill: cv)[done]],
      [B], [#text(fill: cv)[3 ✓]], [C], [#text(fill: cv)[done]],
      [C], [#text(fill: cv)[2 ✓]], [A], [#text(fill: cv)[done]],
      [D], [#text(fill: cup)[8]],  [B], [#text(fill: cq)[updated!]],
      [E], [#text(fill: cup)[6]],  [B], [#text(fill: cq)[queued]],
    ))
    #v(0.5em)
    *Queue:* { E : 6, D : 8 }

    #v(0.3em)
    Pop *B* (smallest dist = 3). Relax:
    - B—D: 3 + 5 = *8* < 10 #text(fill: cup)[↓ improved!]
    - B—E: 3 + 3 = *6* #text(fill: cup)[↓ new]

    Mark B done. D improved again; E discovered.
  ],
  note: [D's distance improves a second time (10 → 8). E is seen for the first time at cost 6.],
)

// ════════════════════════════════════════════════════════════════════════════════
// PAGE 6 — Steps 4-5: Visit E then D — no improvements, finalize
// ════════════════════════════════════════════════════════════════════════════════

#slide(
  "Steps 4 & 5 — Visit E (dist = 6), then D (dist = 8) — Finalize",
  graph(nA: cv, nB: cv, nC: cv, nD: cv, nE: cv),
  [
    #dtable((
      [A], [#text(fill: cv)[0 ✓]], [—], [#text(fill: cv)[done]],
      [B], [#text(fill: cv)[3 ✓]], [C], [#text(fill: cv)[done]],
      [C], [#text(fill: cv)[2 ✓]], [A], [#text(fill: cv)[done]],
      [D], [#text(fill: cv)[8 ✓]], [B], [#text(fill: cv)[done]],
      [E], [#text(fill: cv)[6 ✓]], [B], [#text(fill: cv)[done]],
    ))
    #v(0.5em)
    *Step 4 — Pop E (dist = 6):*
    - D: 6 + 2 = 8 = same → no update
    - B: already done → skip

    *Step 5 — Pop D (dist = 8):*
    - E: already done → skip

    Queue empty — *all vertices finalized!*
  ],
  note: [No further improvements are possible. Every vertex has its shortest distance from A confirmed.],
)

// ════════════════════════════════════════════════════════════════════════════════
// PAGE 7 — Final Result: Shortest Path Tree
// ════════════════════════════════════════════════════════════════════════════════

#block(fill: rgb("#166534"), width: 100%, inset: (x: 12pt, y: 6pt), radius: 4pt, below: 0.45em)[
  #text(fill: white, size: 25pt, weight: "bold")[Final Result — Shortest Path Tree from A]
]

#grid(columns: (16.8cm, 1fr), gutter: 0.7cm,
  // Left: graph with SPT edges highlighted
  // SPT edges: A-C(2), C-B(3), B-E(6), B-D(8) → edge IDs 2, 3, 5, 6
  stack(
    graph(nA: cv, nB: cv, nC: cv, nD: cv, nE: cv, hi: (2, 3, 5, 6)),
    v(-0.2em),
    align(center)[
      #text(size: 14pt, fill: ceh)[━━]
      #h(0.3em)
      #text(size: 14pt, fill: rgb("#374151"))[Highlighted edges form the Shortest Path Tree]
    ],
  ),
  // Right: result table
  [
    #set text(size: 16pt)
    #table(
      columns: (0.4fr, 0.6fr, 1.3fr),
      align: center,
      inset: 7pt,
      stroke: 0.5pt + rgb("#D1D5DB"),
      fill: (c, r) => if r == 0 { rgb("#DCFCE7") } else { white },
      [*To*], [*Cost*], [*Path*],
      [A],    [0],      [A],
      [C],    [*2*],    [A → C],
      [B],    [*3*],    [A → C → B],
      [E],    [*6*],    [A → C → B → E],
      [D],    [*8*],    [A → C → B → D],
    )

    #v(0.5em)

    #block(
      fill: rgb("#FEF3C7"), stroke: 1pt + rgb("#F59E0B"),
      inset: (x: 10pt, y: 7pt), radius: 4pt, width: 100%,
    )[
      #text(size: 15pt, fill: rgb("#92400E"))[
        *Key insight:* The direct A—B edge (cost 4) is NOT in the shortest path tree.
        The detour A→C→B costs only *3*.
      ]
    ]
  ],
)

#v(1fr)
#legend
