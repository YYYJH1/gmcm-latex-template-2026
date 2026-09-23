# 可选字体

官方 Word 模板的封面抬头用的是**华文新魏（STXinwei）**，属 Windows/Office 字体，
本机（Linux + TeX Live）没有，源码会自动退级到楷体，观感接近但不完全一样。

想 100% 还原官方封面：从任意装了 Office 的 Windows 机器上把

```
C:\Windows\Fonts\STXINWEI.TTF
```

拷到本目录（`fonts/STXINWEI.TTF`），重新编译即可。
`gmcmthesis.cls` 会自动优先使用它，换机器也能保持一致。

降级顺序：
`系统 STXinwei` → `fonts/STXINWEI.TTF` → `LiSu 隶书` → `AR PL KaitiM GB` → `Fandol 楷体`

> 这一项**不是合规要求**。通知只规定「4个logo图标不能替换」，没有规定封面字体。
> 字体降级不会导致违规，真正会出事的是届数写错、主办校徽用错。
