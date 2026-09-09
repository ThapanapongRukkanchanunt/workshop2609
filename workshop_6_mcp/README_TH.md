# Workshop 6 — MCP: ต่อเครื่องมือใหม่ให้ agent (Claude Code CLI)

`courses.db` = ฐานข้อมูล SQLite เล็ก ๆ 5 รายวิชา (รหัส · ชื่อ · ผู้สอน · จำนวนผู้ลงทะเบียน)
`.mcp.json` = บอก `claude` ว่าจะต่อ MCP server ตัวไหน (`sqlite` + `mermaid`)

## ขั้นตอน

1. เปิด terminal **ในโฟลเดอร์นี้** (ต้องไม่พลาด — path ใน `.mcp.json` เป็น relative path)
2. พิมพ์ `claude` — รอบแรกมันจะ**ขออนุมัติ** MCP server → ตอบ Yes ทั้ง `sqlite` และ `mermaid`
3. **Lab 1** — วางประโยคสั่ง: `List my active MCP servers and their capabilities`
   ต้องเห็น 2 server พร้อมหน้าที่ (เช็กซ้ำได้ด้วย `claude mcp list` — ถ้าขึ้น ⏸ แปลว่ายังไม่กดอนุมัติ)
4. **Lab 2** — วางประโยคสั่ง:
   `ดู schema ในฐานข้อมูล courses.db แล้ววาด ER diagram สรุปตารางกับความสัมพันธ์ เป็นไฟล์ er.mmd ด้วย mermaid แล้วสรุปตารางกับความสัมพันธ์เป็นข้อความสั้น ๆ ในแชทด้วย`

## ต้องมีในเครื่อง

- `claude` CLI (login แล้ว)
- `uvx` — ใช้รัน sqlite server · macOS: `curl -LsSf https://astral.sh/uv/install.sh | sh` ·
  **Windows (PowerShell):** `irm https://astral.sh/uv/install.ps1 | iex`
- `npx` (มากับ node) — ใช้รัน mermaid server (รอบแรกต้องมีเน็ต) ·
  **Windows:** `winget install OpenJS.NodeJS.LTS`

## กับดักที่เจอจริง

- **ไม่เห็นเครื่องมือ MCP** = ยังไม่กดอนุมัติ (เงียบ ไม่ error)
- **แก้ `.mcp.json` แล้วไม่เห็นผล** = มันอ่านตอนสตาร์ทเท่านั้น → ปิด-เปิด `claude` ใหม่
- **เปิด `claude` ผิดโฟลเดอร์** = sqlite สร้าง db เปล่าทับแบบเงียบ ๆ `list_tables` ตอบ `[]`
  → เช็กด้วย `pwd` แล้ว `ls courses.db` ก่อนเสมอ
- sqlite server ใช้ `uvx --with "mcp[cli]<2"` แบบตรึงเวอร์ชัน — **ห้ามแก้เป็น npx**
  (npx **sqlite** server ตัวเดิมตายแล้ว — ส่วน mermaid ยังใช้ npx ได้ปกติ; ยืนยัน 2026-08-16; config นี้ verified 2026-09-09)
