// Workshop 4 — Shortest Path Algorithm on Graph (3 teaching slides, 16:9)
// Build: typst compile --root . --font-path f_fonts --ignore-system-fonts shortest_path.typ shortest_path.pdf

#let topic = "Shortest Path Algorithm"

#set page(width: 33.87cm, height: 19.05cm, margin: 1.8cm, fill: white)
#set text(font: ("Noto Sans Thai",), size: 22pt, fill: rgb("#1A1830"))
#set par(justify: false)

#show heading.where(level: 1): it => {
  set text(size: 38pt, fill: rgb("#0369A1"))
  it.body
  v(0.3em)
}

#show heading.where(level: 2): it => {
  set text(size: 26pt, fill: rgb("#0284C7"), weight: "bold")
  it.body
  v(0.2em)
}

#let step(n, body) = {
  grid(columns: (auto, 1fr), gutter: 0.6em,
    text(fill: rgb("#0EA5E9"), weight: "bold")[#n.], body)
}

#let note(body) = {
  rect(fill: rgb("#F0F9FF"), stroke: 1pt + rgb("#BAE6FD"), inset: 10pt, radius: 4pt, width: 100%)[
    #text(fill: rgb("#0369A1"), size: 19pt)[#body]
  ]
}

// ─── Slide 1: Problem & Concept ───────────────────────────────────────────────
= #topic

== Slide 1 — What problem does it solve?

*Given a weighted graph, find the path between two nodes with minimum total cost.*

- Real-world uses: GPS navigation, network routing, logistics planning
- Input: Graph G = (V, E) with edge weights w(u, v) ≥ 0
- Output: The path from source *s* to every vertex with minimum total weight
- Key algorithm: *Dijkstra's Algorithm* (single-source shortest path)

#v(0.4em)

#grid(columns: (1fr, 1fr), gutter: 1.2em,
  note[
    *Graph terms*\
    - *Vertex (node)*: a point in the graph\
    - *Edge*: a connection between two vertices\
    - *Weight*: the cost of traversing an edge
  ],
  note[
    *Why not BFS?*\
    BFS finds shortest path by *hops*, not by *cost*.\
    Dijkstra handles weighted edges correctly.
  ]
)

#pagebreak()

// ─── Slide 2: Dijkstra's Algorithm Step-by-Step ──────────────────────────────
= #topic

== Slide 2 — Dijkstra's Algorithm: Step-by-Step

*Key idea:* Greedily pick the unvisited vertex with the smallest known distance, then "relax" its neighbors.

#v(0.3em)

#step(1)[*Initialize* — Set dist[source] = 0; all others = ∞. Mark all vertices unvisited.]
#v(0.2em)
#step(2)[*Pick* — Select unvisited vertex *u* with the smallest dist[u]. (Use a min-heap for efficiency.)]
#v(0.2em)
#step(3)[*Relax neighbors* — For each neighbor *v* of *u*: if dist[u] + w(u,v) < dist[v], update dist[v] = dist[u] + w(u,v).]
#v(0.2em)
#step(4)[*Mark visited* — Mark *u* as visited. A visited vertex's shortest path is finalized.]
#v(0.2em)
#step(5)[*Repeat* — Go back to step 2 until all vertices are visited or the priority queue is empty.]

#v(0.4em)

#note[
  *Complexity:* Using a binary min-heap → *O((V + E) log V)*\
  Using a Fibonacci heap → *O(E + V log V)* — optimal for dense graphs
]

#pagebreak()

// ─── Slide 3: Trace Example ──────────────────────────────────────────────────
= #topic

== Slide 3 — Trace Example (source = A)

#v(0.2em)

#text(size: 19pt)[
  Graph edges: A→B(4), A→C(2), C→B(1), B→D(5), C→D(8), D→E(2), B→E(3)
]

#v(0.3em)

#align(center)[
  #table(
    columns: 6,
    align: center,
    stroke: 0.5pt + rgb("#9CA3AF"),
    inset: 9pt,
    fill: (col, row) => if row == 0 { rgb("#E0F2FE") } else { white },
    [*Step*], [*Visit*], [*dist\[A\]*], [*dist\[B\]*], [*dist\[C\]*], [*dist\[D\]*],
    [Init],    [—],      [`0`],          [`∞`],          [`∞`],          [`∞`],
    [1],       [A],      [`0`],          [`4`],          [`2`],          [`∞`],
    [2],       [C],      [`0`],          [`3`  #text(fill:rgb("#16A34A"),size:16pt)[(via C)]],  [`2`],  [`10`],
    [3],       [B],      [`0`],          [`3`],           [`2`],         [`8`  #text(fill:rgb("#16A34A"),size:16pt)[(via B)]],
    [4],       [D],      [`0`],          [`3`],           [`2`],         [`8`],
  )
]

#v(0.3em)

#grid(columns: (1fr, 1fr), gutter: 1.2em,
  note[
    *Shortest paths from A:*\
    - A → B: A→C→B (cost *3*)\
    - A → C: A→C (cost *2*)\
    - A → D: A→C→B→D (cost *8*)
  ],
  note[
    *Key insight:* Once a vertex is marked visited, its shortest distance is final — it will never decrease further.
  ]
)
