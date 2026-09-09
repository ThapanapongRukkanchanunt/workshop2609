# Workshop 4 — ชุด Typst สำหรับ build สไลด์ในเครื่อง

ไฟล์ในโฟลเดอร์นี้ (ฟอนต์ + template + Makefile) = ทุกอย่างที่ต้องใช้ build สไลด์ Typst
ในเครื่องตัวเอง ไม่ต้องต่อเน็ต · ไม่ต้องติดตั้งแพ็กเกจเพิ่ม

| ไฟล์ | คืออะไร |
|---|---|
| `template.typ` | ไฟล์สไลด์ 3 หน้า (16:9) — แก้หัวข้อที่ `#let topic` บรรทัดเดียว |
| `f_fonts/` | ฟอนต์ไทย `Noto Sans Thai` ที่ build ต้องใช้ |
| `Makefile` | คำสั่ง build อยู่ในนี้ที่เดียว — สั่ง `make` แล้วได้ `template.pdf` |

## 1 · ติดตั้ง typst (ครั้งเดียว)

- **macOS (terminal):** `brew install typst`
- **Windows (PowerShell):** `winget install Typst.Typst`
- เช็กว่าได้แล้ว: `typst --version`

## 2 · build

เปิด terminal **ในโฟลเดอร์นี้** แล้วสั่ง:

```
make
```

ได้ `template.pdf` — เปิดดูได้เลย · แก้ `template.typ` แล้ว `make` ใหม่ = PDF ใหม่

`make` ไม่มี (Windows ไม่ได้ลง): สั่งตรงแทนได้ —

```
typst compile --root . --font-path f_fonts --ignore-system-fonts template.typ template.pdf
```

## ทำไมต้อง Typst (เทียบ Beamer / Marp)

- **เขียนง่ายกว่า Beamer** (LaTeX) — วงเล็บเดียวจบ ไม่ต้องติดตั้ง TeX ทั้งชุด (หลาย GB);
  typst ตัวเดียว ~30 MB · error อ่านเป็นภาษาคน บอกบรรทัดที่พัง
- **จัดหน้าแม่นกว่า Marp** (Markdown slides) — คุมตำแหน่ง/ตาราง/ตัวอักษรได้ระดับจุด
  เหมือน InDesign แต่เป็นโค้ด · Marp เอาอยู่แค่สไลด์โหนด ๆ
- **ฟอนต์ไทยไปได้สวย** — ชี้ `--font-path` ไปที่โฟลเดอร์ `f_fonts/` ก็จบ ไม่ต้องแตะระบบ
- **เร็วมาก** — compile ทั้งเวิร์กช็อปนี้เสร็จในไม่กี่ร้อยมิลลิวินาที แก้แล้วเห็นผลทันตา

## กติกา

- แก้ข้อความใน `template.typ` ได้อิสระ · ห้ามย้ายโฟลเดอร์ `f_fonts` (path ใน Makefile อ้างอิงแบบ relative)
- ได้ `slides.typ` กลับมาจาก claude.ai (เส้นทาง fallback)? วางไว้ในโฟลเดอร์นี้ (คงชื่อ
  `slides.typ` ตามเดิม) แล้วสั่ง build เป็น `slides.pdf` ตรง ๆ:
  `typst compile --root . --font-path f_fonts --ignore-system-fonts slides.typ slides.pdf`
  · หรือถ้าอยากใช้ `make`: เปลี่ยนชื่อไฟล์ทับ `template.typ` แล้ว `make` = ได้ `template.pdf`
  — ฟอนต์พร้อมอยู่แล้วทั้งสองทาง
