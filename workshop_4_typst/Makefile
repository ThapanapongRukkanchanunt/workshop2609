# Workshop 4 — Typst kit build
# ใช้ `make` สร้าง template.pdf เสมอ (คำสั่ง compile อยู่ในนี้ที่เดียว)

TYPST ?= typst
FLAGS  = --root . --font-path f_fonts --ignore-system-fonts

all: template.pdf

template.pdf: template.typ f_fonts/NotoSansThai-Regular.ttf f_fonts/NotoSansThai-Bold.ttf
	$(TYPST) compile $(FLAGS) template.typ template.pdf

check:
	$(TYPST) compile $(FLAGS) template.typ /tmp/w4_check.pdf
	@echo "check OK"

clean:
	rm -f template.pdf

.PHONY: all check clean
