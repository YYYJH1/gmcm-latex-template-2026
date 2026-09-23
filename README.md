# GMCMthesis-2026

“华为杯”第二十三届中国研究生数学建模竞赛（2026）LaTeX 论文模板。**非官方**。

> 本模板按 2026 年官方 Word 论文模板（附件3）逐项标定了封面和摘要页。竞赛格式要求以当年官方通知及附件为准，
> 提交前请自行对照检查。

## 来源与致谢

本模板基于 [latexstudio/GMCMthesis](https://github.com/latexstudio/GMCMthesis)（v2.4，已合并
[andy123t/GMCMthesis](https://github.com/andy123t/GMCMthesis) 的更新）修改而来，适配第二十三届的格式。

- `gmcmthesis.cls`：原作者 latexstudio.net，andy123t 更新；字体自适应代码来自
  [OsbertWang/GMCMthesis](https://github.com/OsbertWang/GMCMthesis)。
- `gmcm.bst`：Zeping Lee 编写，按 [LPPL 1.3c](https://www.latex-project.org/lppl.txt) 发布，原样保留。
- 封面四枚 logo 取自竞赛官方 2026 年论文模板，版权归各自所有者，仅供参赛论文排版使用。

## 快速开始

需要 TeX Live（xelatex、latexmk、ctex）。预览脚本另需 PyMuPDF（`pip install pymupdf`）。

```bash
./build.sh        # 编译 → build/main.pdf
./build.sh -c     # 清理后完整重建
./preview.sh 3    # 把前 3 页渲染成 PNG 检查排版
```

封面信息（题目、参赛队号、学校、队员）在 `main.tex` 开头填写，只会出现在第 1 页。
默认 `fontset=fandol`（TeX Live 自带的开源字体），在 Linux/macOS/Windows 上都能编译；
装有 Windows 中文字体时可改为 `fontset=windows`。

## 许可说明

上游仓库没有附带许可证文件，原作者编写的部分版权归原作者所有；`gmcm.bst` 按 LPPL 1.3c 发布。
本仓库的改动与上游一样公开，供参赛者免费使用。
