%
% This is file `gmcmthesis.cls',
% created by latexstudio.net
% update by andy123t
%
% 2026 adaptation (the 23rd GMCM): cover/abstract page re-calibrated against the
% official 2026 Word template, bug fixes and other changes by YYYJH1.
% Upstream: https://github.com/latexstudio/GMCMthesis
%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gmcmthesis}[2026/09/22 v2.4-2026 (based on v2.4 by andy123t)]
%% Inital Code
\newif\if@gmcm@bwprint\@gmcm@bwprintfalse
\newif\if@gmcm@preface\@gmcm@prefacetrue
% tokens definition
%%%% 承诺书
\newcommand\gmcm@tokens@keywords{}
\newcommand*\gmcm@tokens@tihao{}
\newcommand*\gmcm@tokens@baominghao{}
\newcommand*\gmcm@tokens@schoolname{}
\newcommand*\gmcm@tokens@membera{}
\newcommand*\gmcm@tokens@memberb{}
\newcommand*\gmcm@tokens@memberc{}
\newcommand*\gmcm@tokens@supervisor{}
\newcommand*\gmcm@tokens@yearinput{}
\newcommand*\gmcm@tokens@monthinput{}
\newcommand*\gmcm@tokens@dayinput{}
%%%% 编号专用页
% 没有
%% Declaration of Options
\DeclareOption{colorprint}{\@gmcm@bwprintfalse}
\DeclareOption{bwprint}{\@gmcm@bwprinttrue}
\DeclareOption{withoutpreface}{\@gmcm@prefacefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
%% Executing of Options
\ExecuteOptions{colorprint}
\ProcessOptions\relax
%% Loading Class
\LoadClass[a4paper,zihao=-4]{ctexart}
%% Loading Package
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
% 设置颜色
\RequirePackage{color,xcolor}
% 插入图片
\RequirePackage{graphicx}
% 表格
\RequirePackage{tabularx,array}
% 调整单元格格式
\RequirePackage{makecell}
%% 长表格
\RequirePackage{longtable}
%% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs}
%% multirow 支持在表格中跨行
\RequirePackage{multirow}
%% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut}
%% 在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 保护脆落命令
\RequirePackage{cprotect}
% 设置代码环境
\RequirePackage{listings,xcolor}

% Matlab highlight color settings
%\definecolor{mBasic}{RGB}{248,248,242}       % default
\definecolor{mKeyword}{RGB}{0,0,255}          % bule
\definecolor{mString}{RGB}{160,32,240}        % purple
\definecolor{mComment}{RGB}{34,139,34}        % green
\definecolor{mBackground}{RGB}{245,245,245}   % lightgrey
\definecolor{mNumber}{RGB}{128,128,128}       % gray

% Python highlight color settings
%\definecolor{pBasic}{RGB}{248, 248, 242}     % default
\definecolor{pKeyword}{RGB}{228,0,128}        % magenta
\definecolor{pString}{RGB}{148,0,209}         % purple
\definecolor{pComment}{RGB}{117,113,94}       % gray
\definecolor{pIdentifier}{RGB}{166, 226, 46}  %
\definecolor{pBackground}{RGB}{245,245,245}   % lightgrey
\definecolor{pNumber}{RGB}{128,128,128}       % gray

\lstnewenvironment{Matlab}[1]{
\lstset{language=matlab,               % choose the language of the code
  xleftmargin=20pt,
  xrightmargin=20pt,
  frame=tlbr,framesep=4pt,framerule=0.5pt, % sets the frame style
  %frame=shadowbox,rulesepcolor=\color{red!20!green!20!blue!20},
  basicstyle=\small\fontspec{Courier New},
  keywordstyle={\color{mKeyword}},     % sets color for keywords
  stringstyle={\color{mString}},       % sets color for strings
  commentstyle={\color{mComment}},     % sets color for comments
  backgroundcolor=\color{gray!5},%\color{pBackground}, % choose the background color
  rulecolor=\color{gray!50},
  title=#1,                            % \lstname show the filename of files
  keywords={break,case,catch,classdef,continue,else,elseif,end,for,
  function,global,if,otherwise,parfor,persistent,return,spmd,switch,try,while},
  showspaces=false,                    % show spaces adding particular underscores
  showstringspaces=false,              % underline spaces within strings
  showtabs=false,                      % show tabs within strings adding particular underscores
  tabsize=4,                           % sets default tabsize to 2 spaces
  captionpos=t,                        % sets the caption-position to bottom
  breaklines=true,                     % sets automatic line breaking
}}{}

\lstnewenvironment{Python}[1]{
\lstset{language=python,               % choose the language of the code
  xleftmargin=20pt,
  xrightmargin=20pt,
  frame=single,framesep=4pt,framerule=0.5pt, % sets the frame style
  %frame=shadowbox,rulesepcolor=\color{red!20!green!20!blue!20},
  basicstyle=\small\ttfamily,          % sets font style for the code
  %basicstyle=\footnotesize\fontspec{Consolas},
  keywordstyle=\color{pKeyword},       % sets color for keywords
  stringstyle=\color{pString},         % sets color for strings
  commentstyle=\color{pComment},       % sets color for comments
  backgroundcolor=\color{gray!5},%\color{pBackground}, % choose the background color
  rulecolor=\color{gray!50},
  title=#1,                            % \lstnames how the filename of files
  showspaces=false,                    % show spaces adding particular underscores
  showstringspaces=false,              % underline spaces within strings
  showtabs=false,                      % show tabs within strings adding particular underscores
  tabsize=4,                           % sets default tabsize to 2 spaces
  captionpos=t,                        % sets the caption-position to bottom
  breaklines=true,                     % sets automatic line breaking
}}{}

% 全局 \lstset 用到的两个颜色（原模板把定义注释掉了，附录代码一有注释或字符串就报 Undefined color）
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\AtEndOfClass{\renewcommand{\lstlistingname}{代码}}
\lstset{
  frame=tb,
  xleftmargin=25pt,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  framerule=1pt,
  rulecolor=\color{gray!35},
  backgroundcolor=\color{gray!5},
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3,
}

% \RequirePackage{listings}
% \definecolor{dkgreen}{rgb}{0,0.6,0}
% \definecolor{gray}{rgb}{0.5,0.5,0.5}
% \definecolor{mauve}{rgb}{0.58,0,0.82}
% \lstset{
%   xleftmargin=20pt,
%   xrightmargin=20pt,
%   frame=single,
%   aboveskip=3mm,
%   belowskip=3mm,
%   showstringspaces=false,
%   columns=flexible,
%   framerule=0.5pt,
%   framesep=4pt,
%   rulecolor=\color{gray!35},
%   backgroundcolor=\color{gray!5},
%   basicstyle={\normalsize\ttfamily},
%   numbers=none,
%   numberstyle=\tiny\color{gray},
%   keywordstyle=\color{blue},
%   commentstyle=\color{dkgreen},
%   stringstyle=\color{mauve},
%   breaklines=true,
%   breakatwhitespace=true,
%   tabsize=3,
% }


% 首行缩进
\RequirePackage{indentfirst}
% 设置浮动体的标题
\RequirePackage{caption}
% 定制列表环境
\RequirePackage{enumitem}
% 下划线
\RequirePackage{ulem}
% 尺寸计算
\RequirePackage{calc}
\RequirePackage{titletoc,url}
%参考文献
\RequirePackage[numbers]{natbib}
\setlength{\bibsep}{0pt plus 0.3ex}

\RequirePackage{etoolbox}
\AtBeginEnvironment{thebibliography}{%
    \phantomsection
    \addcontentsline{toc}{section}{\refname}
    }
% 超链接 hyperref 的设置
\RequirePackage{hyperref}
%% Document Layout
% 页面布局
\geometry{top=30.0mm,bottom=25.0mm,left=22.5mm,right=22.5mm,headsep=8mm,footskip=19.4pt}
%% ---------------------------------------------------------------------
%% 行距：附件2 规定「行距用单倍行距」。
%% Word 的小四(12pt)宋体单倍行距 ≈ 15.6pt 基线距。
%% LaTeX 在 12pt 下 \baselineskip 默认 14.4pt，故 15.6/14.4 = 1.083。
%% 原模板用 1.38（= 19.87pt，比 Word 单倍行距松 27%），不符合「单倍行距」。
%% 想恢复原模板的宽松版式（页数会变多），把下面一行换成 1.38 即可。
\renewcommand*{\baselinestretch}{1.0833}  % 单倍行距，对齐 Word；原模板为 1.38
%% ---------------------------------------------------------------------
% 修改tabular 环境, 设置表格中的行间距为正文行间距.
\let\gmcm@oldtabular\tabular
\let\gmcm@endoldtabular\endtabular
\renewenvironment{tabular}%
	{\bgroup%
	%% 表格行高保持 1.38：这是表格观感，不必跟着正文行距走。
	%% （官方封面「学校/参赛队号/队员姓名」那张表就需要这个行高才对得上）
	\renewcommand{\arraystretch}{1.38}%
	\gmcm@oldtabular}%
	{\gmcm@endoldtabular\egroup}
% 每行缩进两个汉字
\setlength\parindent{2em}
% 设置字体
% 代码来自https://github.com/OsbertWang/GMCMthesis 这个是OsbertWang，修正支持让各个系统自适应支持近似字体。
\newif\ifmcm@mac
\newif\ifmcm@windows
\newif\ifmcm@fandol


\@ifclasslater{ctexart}{2015/05/06}{
  %\newcommand\mcm@strifeq{\csname str_if_eq_x:nnTF\endcsname}
  %修订错误来自：https://github.com/ustctug/ustcthesis/issues/241
  \newcommand\mcm@strifeq[4]{%
  \edef\ustc@tmp@a{#1}%
  \edef\ustc@tmp@b{#2}%
  \ifx\ustc@tmp@a\ustc@tmp@b
    #3%
  \else
    #4%
  \fi
}
  \newcommand\mcm@fontset{\csname g__ctex_fontset_tl\endcsname}
  \mcm@strifeq{\mcm@fontset}{mac}{\mcm@mactrue}{}
  \mcm@strifeq{\mcm@fontset}{windows}{\mcm@windowstrue}{}
  \mcm@strifeq{\mcm@fontset}{fandol}{\mcm@fandoltrue}{}
}{
  \mcm@windowstrue
}

\ifmcm@fandol
  \setmainfont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]{texgyretermes}
  \setsansfont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]{texgyreheros}
  \setmonofont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
    Scale          = MatchLowercase,
  ]{texgyrecursor}
\else
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \ifmcm@mac
    \setmonofont[Scale=MatchLowercase]{Menlo}
  \else
    \setmonofont[Scale=MatchLowercase]{Courier New}
  \fi
\fi

\ifmcm@mac
  \setCJKmainfont[
       UprightFont = * Light,
          BoldFont = * Bold,
        ItalicFont = Kaiti SC,
    BoldItalicFont = Kaiti SC Bold,
  ]{Songti SC}
  \setCJKsansfont{Heiti SC}
  \setCJKfamilyfont{zhsong}[
       UprightFont = * Light,
          BoldFont = * Bold,
  ]{Songti SC}
  \setCJKfamilyfont{zhhei}{Heiti SC}
  \setCJKfamilyfont{zhkai}{Kaiti SC}
  \setCJKfamilyfont{zhli}{Baoli SC}
  \newcommand*\lishu{\CJKfamily{zhli}}
\else
  \ifmcm@windows
    \IfFileExists{C:/bootfont.bin}{
      \setCJKmainfont[AutoFakeBold=2.15,ItalicFont=KaiTi_GB2312]{SimSun}
      \setCJKfamilyfont{zhkai}[AutoFakeBold=2.15]{KaiTi_GB2312}
    }{
      \setCJKmainfont[AutoFakeBold=2.15,ItalicFont=KaiTi]{SimSun}
      \setCJKfamilyfont{zhkai}[AutoFakeBold=2.15]{KaiTi}
    }
    \setCJKsansfont[AutoFakeBold=2.15]{SimHei}
    \setCJKfamilyfont{zhsong}[AutoFakeBold=2.15]{SimSun}
    \setCJKfamilyfont{zhhei}[AutoFakeBold=2.15]{SimHei}
    \ifx\lishu\undefined%
      \setCJKfamilyfont{zhli}{LiSu}
      \newcommand*\lishu{\CJKfamily{zhli}} %% Do this if it is undefined
    \fi
  \else
    \ifmcm@fandol
      % \setCJKfamilyfont{zhli}{LiSu} % 需要隶书字体 最好更换其他相似字体
      % \newcommand*\lishu{\CJKfamily{zhli}}
      \PackageWarning{heavenlyclouds}{用楷书代替隶书}
    \fi
  \fi
\fi
%% \lishu 兜底：原模板只在 mac/windows/fandol 三个分支里定义它。若 ctex 的
%% fontset 是别的值（例如 fontset=ubuntu），\lishu 就没有定义，而封面的
%% 「题 目：」和摘要标题都要用它 —— 会直接编译失败。
%% \providecommand 不覆盖上面各分支已定义的版本，放这里最安全。
\providecommand{\lishu}{\kaishu}

% \ifmcm@windows
%   \setCJKfamilyfont{xw}{STXinwei}
%   \newcommand*{\xinwei}{\CJKfamily{xw}}
% \else
%   \ifmcm@mac
%     \setCJKfamilyfont{xw}{Weibei SC}
%   \fi
%   \ifmcm@fandol
%     % \setCJKfamilyfont{xw}{STXinwei} % 需要安装华文新魏字体 最好更换其他相似字体
%     \providecommand{\xinwei}{\kaishu}
%     \PackageWarning{heavenlyclouds}{用楷书代替华文新魏}
%   \fi
% \fi


% 数学环境, 定理等设置
\newtheorem{definition}{\gmcm@cap@definition}
\newtheorem{theorem}{\gmcm@cap@theorem}
\newtheorem{lemma}{\gmcm@cap@lemma}
\newtheorem{corollary}{\gmcm@cap@corollary}
\newtheorem{assumption}{\gmcm@cap@assumption}
\newtheorem{conjecture}{\gmcm@cap@conjecture}
\newtheorem{axiom}{\gmcm@cap@axiom}
\newtheorem{principle}{\gmcm@cap@principle}
\newtheorem{problem}{\gmcm@cap@problem}
\newtheorem{example}{\gmcm@cap@example}
\newtheorem{proof}{\gmcm@cap@proof}
\newtheorem{solution}{\gmcm@cap@solution}

% 浮动环境设置
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
 \renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
 \renewcommand*{\topfraction}{0.9}
 \renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85}
% 关于图片 graphicx
 % 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
 % 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
  {picture/}{pic/}{pics/}{image/}{images/}}
% 图表标题
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
\captionsetup[figure]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	font={song,minusfour}, % 图的字体, 宋体小四
	position=bottom % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
\captionsetup[table]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	font={song,minusfour}, % 表的字体, 宋体小四
	position=top % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
% 列表环境设置
\setlist{%
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}

% 超链接
% \AtBeginDocument{%
	 \hypersetup{%
		% % unicode=false, % hyperref 和 xetex 同时使用时不能开启 Unicode 选项.
		 hyperfootnotes=true,
		 hyperindex=true,
		 colorlinks=true,
		 bookmarksnumbered=true,
		 bookmarksopen=true,
 		 bookmarksopenlevel=0,
		 allcolors=black,
		 breaklinks=true,
		 %% —— 防止 PDF 元数据泄露身份信息 ——
		 %% 规范：除首页外不得出现单位/姓名/队号。hyperref 默认会把 \title
		 %% 写进 PDF 的 Info 字典，评委在「文档属性」里一看就有。全部清空。
		 pdftitle={},
		 pdfauthor={},
		 pdfsubject={},
		 pdfkeywords={},
		 pdfcreator={},
		 pdfproducer={}}%
% }
% \if@gmcm@bwprint
% \AtBeginDocument{\hypersetup{hidelinks}}
% \else\relax\fi
\def\UrlAlphabet{%
      \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
      \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
      \do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D%
      \do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N%
      \do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X%
      \do\Y\do\Z}
\def\UrlDigits{\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0}
\g@addto@macro{\UrlBreaks}{\UrlOrds}
\g@addto@macro{\UrlBreaks}{\UrlAlphabet}
\g@addto@macro{\UrlBreaks}{\UrlDigits}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 页码字体：官方模板实测为 Times New Roman 9.00pt，居中于页脚。
%% 原模板用正文字号(12pt)，偏大。本机装有 msttcorefonts，能取到真 Times New Roman。
\IfFontExistsTF{Times New Roman}{%
  \newfontfamily\gmcm@pagefont{Times New Roman}%
}{%
  \let\gmcm@pagefont\relax
}
\renewcommand{\ps@plain}{%
  \let\@mkboth\@gobbletwo
  \let\@oddhead\@empty
  \let\@evenhead\@empty
  \def\@oddfoot{\hfil{\gmcm@pagefont\fontsize{9}{11}\selectfont\thepage}\hfil}%
  \let\@evenfoot\@oddfoot
}
%% 全文固定 plain：ctex 的中文 article 方案默认 \pagestyle{headings}，摘要写满两页时第二页页码会跑到右上角成了页眉
\pagestyle{plain}

%% Document Markup

% 生成封面, 使用\maketitle
\renewcommand{\maketitle}{\par
	\begingroup
      \newpage
      \global\@topnum\z@ % Prevents figures from going at top of page.
      \ge@maketitle      %
    \endgroup
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\ge@maketitle{%
  \clearpage
  %\thispagestyle{plain}%
  \thispagestyle{empty}
  \pagenumbering{roman}% 封面在阅读器里标为 i，摘要页才是 1
  \pdfbookmark[1]{封~面}{cover}
  \if@gmcm@preface
  %\setcounter{page}{0}
  %\def\thepage{0}

 \begin{center}
 {\gmcm@logo@row}

  %% logo 行 → 抬头首行基线：官方实测 224.30pt（页顶起），此处标定过
  \vskip38.02pt
 {\zihao{2} \gmcm@ges@string@contents \par}
 \end{center}

 %% 抬头 → 封面表格第一行基线：官方实测 381.17pt，此处标定过
 \vskip4em\vskip13.20pt

 % \thispagestyle{gmcmheadings}
 \renewcommand\arraystretch{1.5}
 %\noindent 
 %% 官方模板 PDF span 实测：「学 校」「参赛队号」「队员姓名」三个标签均为
 %% SimSun 18.00pt 且【不加粗】（flags=4，无 bold 位）；序号 1./2./3. 才是粗体。
 %% 原模板对标签和取值都加了 \bfseries，与官方不一致，这里去掉。
 \begin{tabularx}{\textwidth-40pt}{lX}
  \zihao{-2} 学\qquad 校&\zihao{-2}\gmcm@tokens@schoolname\\
  %% [10.2pt] 用来补足行距：官方「学校」→「参赛队号」基线间距实测 58.20pt。
  %% 原模板靠 \baselinestretch 撑开，正文行距改成单倍后这里会塌，所以显式补。
  \Xhline{1.2pt}\\[10.2pt]
  \zihao{-2} 参赛队号&\zihao{-2}\gmcm@tokens@baominghao\\
  \Xhline{1.2pt}\\[-15pt]
   \multirow{3}{*}{\zihao{-2} 队员姓名}&\zihao{-2}{\bfseries 1.} \gmcm@tokens@membera\hfill\null\\
   \cline{2-2}\\[-15pt]
                               &\zihao{-2}{\bfseries 2.} \gmcm@tokens@memberb\hfill\null\\
   \cline{2-2}\\[-15pt]
                        &\zihao{-2}{\bfseries 3.} \gmcm@tokens@memberc\hfill\null\\
   \Xhline{1.2pt}
  \end{tabularx}

	\makenametitle
	\fi          % ← 补上 \if@gmcm@preface 缺失的 \fi（原模板遗漏；日志里的
	             %   "(\end occurred when \iftrue ... was incomplete)" 就是它）
	}

\def\makenametitle{
\clearpage
\thispagestyle{plain}%
\pdfbookmark[1]{标~题}{title}
\pagenumbering{arabic}%
\setcounter{page}{1}
%% 以下三处间距均按官方模板 PDF 实测标定：
%%   抬头首行基线 106.34pt、「题 目：」基线 231.98pt、「摘 要：」基线 294.41pt
\begin{center}
{\zihao{2} \gmcm@ges@string@contents \par}
\end{center}

\vskip0.6cm\vskip18.87pt%

\begin{center}
\begin{tabularx}{\textwidth}{@{}l>{\centering\arraybackslash}X@{}}
{\zihao{-2}\lishu 题\quad 目：} &\zihao{3}\heiti \@title\\
\cline{2-2}
\end{tabularx}
\end{center}

\vskip0.2cm\vskip22.53pt%
}


% 中文标题格式设置
% 目录深度
\setcounter{secnumdepth}{3}
\def\@seccntformat#1{\csname the#1\endcsname\ \ }
% 节标题格式, 居中, 使用\chinese命令修改计数器, \kern 使得数字和内容不至于太远
\newcommand{\thinskip}{\hskip 0.05em\relax}
% \renewcommand\thesection{\arabic{section}\thinskip.}
\renewcommand\thesubsection{\arabic{section}\thinskip.\thinskip\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection\thinskip.\thinskip\arabic{subsubsection}}
\renewcommand\section{\@startsection{section}{1}{\z@}%
 	{2.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\bfseries\centering\zihao{4}\heiti}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{1.25ex\@plus -1ex \@minus -.2ex}%
	{1.25ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{1.25ex\@plus -1ex \@minus -.2ex}%
	{1.2ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	 {3.25ex \@plus1ex \@minus .2ex}%
	 {-1em}%
	 {\normalfont\normalsize\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define new environment and command
%% 摘要两个字设置为 -2 号.
%% 定义摘要环境
\renewenvironment{abstract}{%
\if@twocolumn
		\section*{\gmcm@cap@abstractname}%
	\else
	 \begin{center}%
	{\zihao{-2}\lishu\gmcm@cap@abstractname\vspace{\z@}}%
	 \end{center}%
 	 \quotation
	\fi}
	{\if@twocolumn\else\endquotation\newpage\fi}
\renewenvironment{quotation}
	{\list{}{\listparindent 2em%
	 \itemindent \listparindent
	 \rightmargin\z@
	 \leftmargin\z@
	 \parsep \z@ \@plus\p@}%
	\item\relax}
	{\endlist}

\newcommand\keywords[1]{%
	\renewcommand{\gmcm@tokens@keywords}{#1}
	\par
	\vskip1ex
	%% 官方模板实测「题 目：」「摘 要：」「关键词：」三个标签同为小二(18pt)，
	%% 原模板这里误用 \zihao{-3}(15pt)，与前两者不齐。
	{\noindent\zihao{-2}\lishu\gmcm@cap@keywordsname：}~{\gmcm@tokens@keywords}
	}


\newcommand*\baominghao[1]{%
	\renewcommand{\gmcm@tokens@baominghao}{#1}}
\newcommand*\schoolname[1]{%
	\renewcommand{\gmcm@tokens@schoolname}{#1}}
\newcommand*\membera[1]{%
	\renewcommand{\gmcm@tokens@membera}{#1}}
\newcommand*\memberb[1]{%
	\renewcommand{\gmcm@tokens@memberb}{#1}}
\newcommand*\memberc[1]{%
	\renewcommand{\gmcm@tokens@memberc}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialization
 %%%数学定理相关的常量
\newcommand*{\gmcm@cap@definition}{定义}
\newcommand*{\gmcm@cap@theorem}{定理}
\newcommand*{\gmcm@cap@lemma}{引理}
\newcommand*{\gmcm@cap@corollary}{推论}
\newcommand*{\gmcm@cap@assumption}{假设}
\newcommand*{\gmcm@cap@conjecture}{猜想}
\newcommand*{\gmcm@cap@axiom}{公理}
\newcommand*{\gmcm@cap@principle}{定律}
\newcommand*{\gmcm@cap@problem}{问题}
\newcommand*{\gmcm@cap@example}{例}
\newcommand*{\gmcm@cap@proof}{证明}
\newcommand*{\gmcm@cap@solution}{解}
 %%%  中文标题名称
\newcommand*{\gmcm@cap@abstractname}{摘\quad 要： }
 %%%  中文关键字
\newcommand*{\gmcm@cap@keywordsname}{关键词}

% 常量

%% =====================================================================
%%  封面抬头 与 四枚 logo  ——  2026（第二十三届）版
%% ---------------------------------------------------------------------
%%  原模板的 figures/title.pdf 与 figures/logo.pdf 是第二十一届的烘焙图，
%%  里面写死了“第二十一届”和山东大学校徽，本届（承办方为西安交通大学）必须重做。
%%  这里改成：文字用 LaTeX 真实排版（可搜索、可改届数），
%%           四枚 logo 直接用从官方 附件3 模板里原样提取的图片。
%%
%%  ⚠ 通知规定「4个logo图标不能替换」。figures/logos/ 下的四个文件是
%%    直接从官方 .doc 的 Data 流中原样提取的，未经任何修改，请勿替换。
%% =====================================================================

%% —— 届数：唯一需要改的地方 ——
\newcommand*\gmcm@jieshu{第二十三届}

%% —— 抬头字体 ——
%% 官方 Word 模板用的是 华文新魏(STXinwei)，属 Windows/Office 字体，
%% Linux/TeXLive 一般没有，本机也确实没有（fc-list 查无）。
%% 这里按可用性依次退让：华文新魏 → 楷体(加粗模拟) → 楷体。
%% 三者都是书法/楷书风格，与官方封面的观感最接近。
%% 若想换成更常见的黑体封面，把 \gmcmcoverfont 定义成 \heiti\bfseries 即可。
%% 降级链：系统装的华文新魏 → 项目自带的 STXINWEI.TTF → 隶书 → 文鼎中楷 → Fandol 楷体
%% 想 100% 还原官方封面：找队友从 Windows 的 C:\Windows\Fonts\STXINWEI.TTF
%% 拷一份放进本目录的 fonts/ 下即可，源码换机也能保持一致。
\IfFontExistsTF{STXinwei}{%
  \setCJKfamilyfont{gmcmcover}{STXinwei}%
  \newcommand\gmcmcoverfont{\CJKfamily{gmcmcover}}%
}{%
\IfFontExistsTF{fonts/STXINWEI.TTF}{%
  \setCJKfamilyfont{gmcmcover}[Path=fonts/]{STXINWEI.TTF}%
  \newcommand\gmcmcoverfont{\CJKfamily{gmcmcover}}%
}{%
\IfFontExistsTF{LiSu}{%
  \setCJKfamilyfont{gmcmcover}[AutoFakeBold=2.5]{LiSu}%
  \newcommand\gmcmcoverfont{\CJKfamily{gmcmcover}\bfseries}%
}{%
\IfFontExistsTF{AR PL KaitiM GB}{%
  \setCJKfamilyfont{gmcmcover}[AutoFakeBold=2.5]{AR PL KaitiM GB}%
  \newcommand\gmcmcoverfont{\CJKfamily{gmcmcover}\bfseries}%
}{%
\IfFontExistsTF{FandolKai-Regular.otf}{%
  % Fandol Kai 没有粗体字重，用 AutoFakeBold 模拟官方封面的笔画厚度
  \setCJKfamilyfont{gmcmcover}[AutoFakeBold=2.5]{FandolKai-Regular.otf}%
  \newcommand\gmcmcoverfont{\CJKfamily{gmcmcover}\bfseries}%
}{%
  \newcommand\gmcmcoverfont{\kaishu}%
}}}}}

%% 字号取自官方模板 PDF 的 span 实测：
%%   第 1 行「中国研究生创新实践系列大赛」 STXinwei 18.00pt  → \zihao{-2}(18.07pt)
%%   第 2、3 行                          STXinwei 21.96pt → \zihao{2} (22.08pt)
%% 原模板把三行统一成 \zihao{2}，第 1 行偏大。
%% 字号与基线间距全部取自官方模板 PDF 的 span 实测：
%%   第 1 行 18.00pt；第 2、3 行 21.96pt
%%   基线间距 第1→2 行 32.52pt，第2→3 行 31.20pt
\newcommand\gmcm@ges@string@contents{%
  \begingroup
  \gmcmcoverfont
  \renewcommand*{\baselinestretch}{1}%  否则正文行距倍数会把下面的基线间距再乘一遍
  {\fontsize{18}{22}\selectfont 中国研究生创新实践系列大赛\par}
  {\fontsize{21.96}{32.52}\selectfont “华为杯”\gmcm@jieshu 中国研究生\par}
  {\fontsize{21.96}{31.20}\selectfont 数学建模竞赛\par}
  \endgroup}

%% —— 四枚 logo 一行 ——
%% 顺序与尺寸均来自对官方 附件3 (.doc) 的二进制解析：
%% 逐个图片占位符按 CP 顺序取 sprmCPicLocation(0x6A03) 得到 fcPic，
%% 再读 PICF 的 dxaGoal/dyaGoal 与 mx/my 缩放，得到实际显示尺寸。
%% 解析器已在第二十一届模板上验证，能复现其已知版面
%% （CPIPC / 数模会徽 / HUAWEI / 山东大学）。
%%
%% 本届（第二十三届）文档顺序与显示尺寸：
%%   #1 CPIPC        cp=0    3.615 x 2.302 cm
%%   #2 数模会徽      cp=2    2.762 x 2.656 cm
%%   #3 HUAWEI 竖版   cp=181  2.804 x 2.804 cm
%%   #4 西安交通大学   cp=184  2.410 x 2.276 cm
%%
%% ⚠ 注意第 4 枚：官方在 Word 里对那张 2935x786 的横版 banner 设了
%%   cropFromRight = 0.7155，即**只显示左侧 28.45%（仅校徽，不含校名文字）**。
%%   logos/03_xjtu_crest.png 就是按这个比例裁出来的（835x786），
%%   未裁切的原图保留为 03_xjtu_full_原始未裁切.png 以备存证。
%%   四枚 logo 高度并不相同，这里按官方实测值逐个给定，不要改成统一高度。
\newcommand\gmcm@logo@row{%
  \begingroup
  \includegraphics[width=3.615cm,height=2.302cm]{logos/01_cpipc}\hspace{5mm}%
  \includegraphics[width=2.762cm,height=2.656cm]{logos/02_gmcm}\hspace{5mm}%
  \includegraphics[width=2.804cm,height=2.804cm]{logos/04_huawei}\hspace{5mm}%
  \includegraphics[width=2.410cm,height=2.276cm]{logos/03_xjtu_crest}%
  \endgroup}

\renewcommand{\thetable}{\arabic{section}.\arabic{table}}
\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}
\renewcommand{\thefigure}{\arabic{section}.\arabic{figure}}
%% 原模板只改了编号「格式」，没让计数器随节复位：
%% 第 2 节的第一张图会编成「2.4」而不是「2.1」。\numberwithin 同时管格式和复位。
\numberwithin{equation}{section}
\numberwithin{figure}{section}
\numberwithin{table}{section}

% 字图与子标题
% \RequirePackage{subcaption}
\RequirePackage[titles]{tocloft}
%\renewcommand{\cftdot}{$\cdot$}
%\renewcommand{\cftsecdotsep}{1.5}
\renewcommand{\cftsecdotsep}{4.5}
\setlength{\cftbeforesecskip}{7pt}
\setlength{\cftbeforesubsecskip}{3pt}
%\setlength{\cftbeforesubsecskip}{5pt}
\renewcommand{\cftsecfont}{\bfseries\zihao{-4}\heiti}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecaftersnumb}{\hskip.4em}

% ----------- 设置新的生成目录命令 -------------
\newcommand{\maketoc}{
  \phantomsection
  \pdfbookmark[1]{目~录}{contents}
  \tableofcontents
}

\RequirePackage{titletoc}
\RequirePackage[title,titletoc]{appendix}

\newcommand*{\gmcm@cap@appendixname}{附录}
\renewcommand*\appendixname{\gmcm@cap@appendixname}

% 定义附录  
% \let\oldappendix\appendix
\renewcommand\appendix{\par
  \setcounter{section}{0}%
   \setcounter{subsection}{0}%
  \gdef\thesection{\appendixname\@Alph\c@section}
  %\gdef\thesubsection{\@Alph\c@section\thinskip.\thinskip\c@subsection}
}


% 设置目录格式
% 节的目录格式
% \titlecontents{section}[0pt]{\vspace{2mm}\bfseries\heiti}
% {\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
% % 小节的目录格式
% \titlecontents{subsection}[30pt]{\songti}
% {\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

% \titlecontents{subsubsection}[55pt]{\songti}
% {\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

% \pagestyle{plain}

\endinput
