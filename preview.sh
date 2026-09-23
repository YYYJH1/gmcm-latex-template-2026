#!/usr/bin/env bash
# 把 PDF 的前几页渲染成 PNG，方便肉眼检查排版。
# 用法: ./preview.sh [页数，默认3]
set -euo pipefail
cd "$(dirname "$0")"
N="${1:-3}"
# 需要 PyMuPDF：pip install pymupdf
python3 - "$N" <<'PY'
import fitz, sys, os
n = int(sys.argv[1])
pdf = "build/main.pdf"
if not os.path.exists(pdf):
    sys.exit("先跑 ./build.sh")
d = fitz.open(pdf)
os.makedirs("build/preview", exist_ok=True)
for i in range(min(n, d.page_count)):
    out = f"build/preview/p{i+1}.png"
    d[i].get_pixmap(dpi=110).save(out)
    print("渲染:", out)
PY
