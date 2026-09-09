# CLAUDE.md — กติกาของโฟลเดอร์นี้

ไฟล์นี้คือ "ความจำ" ของ Cowork สำหรับโฟลเดอร์นี้
สิ่งที่เขียนไว้ในนี้ agent จะอ่านทุกครั้งที่เริ่มงานใหม่ และทำตามเอง

## Rules

- Respond in English

## Golden Rules

1. NEVER run: `git reset --hard`, `git checkout .`, `git restore .`, `git clean -fd`
2. ALWAYS ask permission before any destructive git operation
3. If you need to checkout/compare: clone to /tmp and do it there
4. If you need the original file: use `git show HEAD:filename`
5. IMPORTANT: Try to preserve original code and logic as much as possible.
6. If NOT a git repo: before editing ANY file, make a backup copy and append the date-time to the filename.

<!-- เพิ่มgolden ruleของเราต่อจากบรรทัดบน แล้วบันทึกไฟล์ -->
