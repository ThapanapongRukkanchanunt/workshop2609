// Workshop 4 — Typst starter template (3 teaching slides, 16:9)
// Build:  make   (หรือสั่งตรง: typst compile --root . --font-path f_fonts --ignore-system-fonts template.typ template.pdf)
// แก้หัวข้อได้ที่ #let topic บรรทัดเดียว

#let topic = "Stack (push/pop)"

#set page(width: 33.87cm, height: 19.05cm, margin: 1.8cm, fill: white)
#set text(font: ("Noto Sans Thai",), size: 24pt, fill: rgb("#1A1830"))
#set par(justify: false)

#show heading.where(level: 1): it => {
  set text(size: 40pt, fill: rgb("#4338CA"))
  it.body
  v(0.4em)
}

#let step(n, body) = {
  grid(columns: (auto, 1fr), gutter: 0.6em,
    text(fill: rgb("#6366F1"), weight: "bold")[#n.], body)
}

= #topic

== หน้า 1 — ปัญหาและแนวคิด

*#topic แก้ปัญหาอะไร*

- เก็บข้อมูลแบบ "เข้าทีหลัง ออกก่อน" (LIFO — Last In, First Out)
- เหมือนกองจาน: วางใหม่ทับบนสุด · หยิบก็หยิบจากบนสุด
- ใช้จริง: undo, call stack ของโปรแกรม, ตรวจวงเล็บสมดุล

#align(center)[#text(fill: rgb("#6B7280"), size: 18pt)[สไลด์นี้คือโค้ด — แก้ไฟล์นี้ แล้ว `make` ใหม่ = ได้ PDF ใหม่]]

#pagebreak()

= #topic

== หน้า 2 — ขั้นตอนการทำงานทีละขั้น

#step(1)[`push(x)` — เอา x วางบนยอดสแตก]
#step(2)[`pop()` — หยิบค่าที่ยอดออกมา แล้วคืนค่านั้น]
#step(3)[`peek()` — มองยอดโดยไม่หยิบออก]
#step(4)[`isEmpty()` — สแตกว่างไหม (pop บนสแตกว่าง = error)]

#v(0.6em)
*ตัวอย่าง:* `push(5) → push(3) → pop() → push(7)`\
สแตกเป็น `5, 7` — pop คืนค่า `3` ตาม LIFO

#pagebreak()

= #topic

== หน้า 3 — ตัวอย่างการไล่ข้อมูลตามขั้นตอน

#align(center)[
  #table(
    columns: 5,
    align: center,
    stroke: 0.5pt + rgb("#9CA3AF"),
    inset: 10pt,
    [*คำสั่ง*], [*push(5)*], [*push(3)*], [*pop()*], [*push(7)*],
    [สแตก], [`[5]`], [`[5,3]`], [`[5]`], [`[5,7]`],
    [ค่าที่ได้], [—], [—], [`3`], [—],
  )
]

#v(0.6em)
*ตรวจด้วยตัวเองเสมอ:* ไล่ตารางนี้ด้วยมือ 1 รอบ — ถ้า AI วาดไดอะแกรมมาผิดขั้น ตารางแบบนี้คือทางจับผิดเร็วสุด
