#!/usr/bin/env bash
# 编译论文。用法: ./build.sh [-c 清理后重建]
set -uo pipefail
cd "$(dirname "$0")"

MAIN=main

if [ "${1:-}" = "-c" ]; then
  echo ">>> 清理中间文件"
  latexmk -C -outdir=build "$MAIN".tex >/dev/null 2>&1
  rm -rf build
  rm -f missfont.log
fi

# 陈旧的 .out / missfont.log 会造成假失败，先清掉
rm -f missfont.log

echo ">>> xelatex 编译中…"
latexmk -xelatex -interaction=nonstopmode -file-line-error \
        -outdir=build "$MAIN".tex
RC=$?

LOG=build/"$MAIN".log
echo
echo "========== 编译结果 =========="
if [ -f "$LOG" ]; then
  ERRS=$(grep -cE '^(! |.+\.(tex|cls|sty|bbl):[0-9]+: )' "$LOG" || true)
  UNDEF=$(grep -ci 'undefined' "$LOG" || true)
  echo "错误          : $ERRS    （latexmk 退出码 $RC）"
  echo "undefined 引用: $UNDEF"
  grep 'Output written' "$LOG" || echo "!! 未生成 PDF"
  if [ "$ERRS" -gt 0 ]; then
    echo
    echo "---- 错误详情（前 20 条） ----"
    grep -nE '^(! |.+\.(tex|cls|sty|bbl):[0-9]+: )' -A2 "$LOG" | head -60
  fi
else
  echo "!! 找不到日志 $LOG"
fi

if [ -f build/"$MAIN".pdf ]; then
  echo
  echo "PDF: $(pwd)/build/$MAIN.pdf"
  ls -lh build/"$MAIN".pdf | awk '{print "大小: "$5}'
  python3 - <<'PY' 2>/dev/null
import fitz
d = fitz.open("build/main.pdf")
print(f"页数: {d.page_count}")
PY
  echo
  echo "预览封面:  ./preview.sh"
fi
echo "=============================="
if [ "$RC" -ne 0 ] || [ "${ERRS:-0}" -gt 0 ]; then
  echo
  echo "!!!!!!!! 编译失败：build/main.pdf 是上一次成功编译的旧文件，不是当前源码的结果 !!!!!!!!"
  exit 1
fi
