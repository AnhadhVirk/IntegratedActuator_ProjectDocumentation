%% nervtech-engdoc.cls % LaTeX class for NervTech engineering technical documentation %
%Version: 1.0.0 | Date: 2026-06-25 % % Usage: %
%\documentclass[confidential]{nervtech-engdoc} % \nervsetup{project={Integrated Robotic
%Actuator}, document={System Architecture}, docid={NT-IRA-SYS-001}, revision={A}} %
%\begin{document} % \maketitle % ... % \end{document} % % Recommended compiler: XeLaTeX
%or LuaLaTeX for best typography. % pdfLaTeX is supported with fallback fonts.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nervtech-engdoc}[2026/06/25 v1.0.0 NervTech Engineering Technical Document Class]

% ----------------------------------------------------------------------------- Class
% options -----------------------------------------------------------------------------
\newif\ifnt@draft
\newif\ifnt@confidential
\newif\ifnt@public
\newif\ifnt@watermark
\nt@draftfalse
\nt@confidentialfalse
\nt@publicfalse
\nt@watermarkfalse

\def\nt@classification{INTERNAL}
\def\nt@papersize{a4paper}

\DeclareOption{draft}{\nt@drafttrue\nt@watermarktrue\PassOptionsToClass{draft}{article}}
\DeclareOption{final}{\nt@draftfalse}
\DeclareOption{public}{\nt@publictrue\nt@confidentialfalse\def\nt@classification{PUBLIC}}
\DeclareOption{internal}{\nt@publicfalse\nt@confidentialfalse\def\nt@classification{INTERNAL}}
\DeclareOption{confidential}{\nt@confidentialtrue\nt@publicfalse\def\nt@classification{CONFIDENTIAL}}
\DeclareOption{watermark}{\nt@watermarktrue}
\DeclareOption{a4paper}{\def\nt@papersize{a4paper}\PassOptionsToClass{a4paper}{article}}
\DeclareOption{letterpaper}{\def\nt@papersize{letterpaper}\PassOptionsToClass{letterpaper}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{11pt,a4paper,internal}
\ProcessOptions\relax

\LoadClass{article}

% ----------------------------------------------------------------------------- Core
% packages -----------------------------------------------------------------------------
\RequirePackage[margin=22mm,top=25mm,bottom=25mm,headheight=22pt]{geometry}
\RequirePackage{iftex}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{etoolbox}
\RequirePackage{keyval}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}
\RequirePackage{listings}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{siunitx}
\RequirePackage{amsmath,amssymb}
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage{microtype}

% -----------------------------------------------------------------------------
% Typography
% -----------------------------------------------------------------------------
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[scale=0.96]{tgheros}
  \RequirePackage{inconsolata}
  \renewcommand{\familydefault}{\sfdefault}
\else
  \RequirePackage{fontspec}
  \defaultfontfeatures{Ligatures=TeX}
  \IfFontExistsTF{Inter}{%
    \setsansfont{Inter}[Scale=0.96]
    \setmainfont{Inter}[Scale=0.96]
  }{%
    \IfFontExistsTF{TeX Gyre Heros}{%
      \setsansfont{TeX Gyre Heros}[Scale=0.96]
      \setmainfont{TeX Gyre Heros}[Scale=0.96]
    }{%
      \setsansfont{Arial}[Scale=0.96]
      \setmainfont{Arial}[Scale=0.96]
    }%
  }%
  \IfFontExistsTF{JetBrains Mono}{%
    \setmonofont{JetBrains Mono}[Scale=0.88]
  }{%
    \IfFontExistsTF{Fira Code}{%
      \setmonofont{Fira Code}[Scale=0.88]
    }{%
      \IfFontExistsTF{DejaVu Sans Mono}{%
        \setmonofont{DejaVu Sans Mono}[Scale=0.88]
      }{%
        \setmonofont{lmmono10-regular.otf}[Scale=0.88]
      }%
    }%
  }%
\fi

\linespread{1.04}
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt plus 2pt minus 1pt}
\setlist{itemsep=2pt,topsep=4pt,leftmargin=1.5em}

% ----------------------------------------------------------------------------- NervTech
% brand colours
% -----------------------------------------------------------------------------
\definecolor{NervBlack}{HTML}{090D12}
\definecolor{NervGraphite}{HTML}{151B23}
\definecolor{NervSlate}{HTML}{2B3440}
\definecolor{NervSteel}{HTML}{657080}
\definecolor{NervMist}{HTML}{EEF3F7}
\definecolor{NervCyan}{HTML}{00D4FF}
\definecolor{NervBlue}{HTML}{1976FF}
\definecolor{NervViolet}{HTML}{7C3AED}
\definecolor{NervGreen}{HTML}{00C48C}
\definecolor{NervAmber}{HTML}{FFB020}
\definecolor{NervRed}{HTML}{FF4D5E}

\colorlet{ntPrimary}{NervBlue}
\colorlet{ntAccent}{NervCyan}
\colorlet{ntText}{NervBlack}
\colorlet{ntMuted}{NervSteel}
\colorlet{ntPanel}{NervMist}

\pagecolor{white}
\color{ntText}

% ----------------------------------------------------------------------------- Metadata
% keys -----------------------------------------------------------------------------
\makeatletter
\def\nt@company{NervTech}
\def\nt@project{Integrated Robotic Actuator}
\def\nt@document{Engineering Technical Document}
\def\nt@subtitle{Design, analysis, verification, and integration notes}
\def\nt@docid{NT-IRA-DOC-001}
\def\nt@revision{A}
\def\nt@status{Draft}
\def\nt@author{Engineering Team}
\def\nt@owner{NervTech Robotics Systems}
\def\nt@approver{--}
\def\nt@date{\today}
\def\nt@logo{}
\def\nt@abstract{}
\def\nt@keywords{robotics, actuator, controls, embedded systems, mechatronics}

\define@key{nerv}{company}{\def\nt@company{#1}}
\define@key{nerv}{project}{\def\nt@project{#1}}
\define@key{nerv}{document}{\def\nt@document{#1}}
\define@key{nerv}{subtitle}{\def\nt@subtitle{#1}}
\define@key{nerv}{docid}{\def\nt@docid{#1}}
\define@key{nerv}{revision}{\def\nt@revision{#1}}
\define@key{nerv}{status}{\def\nt@status{#1}}
\define@key{nerv}{author}{\def\nt@author{#1}}
\define@key{nerv}{owner}{\def\nt@owner{#1}}
\define@key{nerv}{approver}{\def\nt@approver{#1}}
\define@key{nerv}{date}{\def\nt@date{#1}}
\define@key{nerv}{logo}{\def\nt@logo{#1}}
\define@key{nerv}{classification}{\def\nt@classification{#1}}
\define@key{nerv}{abstract}{\def\nt@abstract{#1}}
\define@key{nerv}{keywords}{\def\nt@keywords{#1}}
\newcommand{\nervsetup}[1]{\setkeys{nerv}{#1}}

% public getters for advanced customisation
\newcommand{\nervcompany}{\nt@company}
\newcommand{\nervproject}{\nt@project}
\newcommand{\nervdocument}{\nt@document}
\newcommand{\nervdocid}{\nt@docid}
\newcommand{\nervrevision}{\nt@revision}
\newcommand{\nervclassification}{\nt@classification}
\makeatother

% ----------------------------------------------------------------------------- Hyperref
% and PDF metadata
% -----------------------------------------------------------------------------
\hypersetup{
  colorlinks=true,
  linkcolor=NervBlue,
  citecolor=NervViolet,
  urlcolor=NervBlue,
  pdfauthor={NervTech},
  pdftitle={NervTech Engineering Technical Document},
  pdfsubject={Integrated Robotic Actuator},
  pdfkeywords={robotics, actuator, engineering, NervTech},
  pdfcreator={LaTeX with nervtech-engdoc.cls}
}

% ----------------------------------------------------------------------------- Section
% styling -----------------------------------------------------------------------------
\titleformat{\section}
{\Large\bfseries\color{NervGraphite}}
{\llap{\color{NervCyan}\rule[-0.2em]{3pt}{1.35em}\hspace{0.6em}}\thesection}
{0.75em}
{\MakeUppercase}

\titleformat{\subsection}
{\large\bfseries\color{NervGraphite}}
{\thesubsection}
{0.75em}
{}

\titleformat{\subsubsection}
{\normalsize\bfseries\color{NervSlate}}
{\thesubsubsection}
{0.75em}
{}

\titlespacing*{\section}{0pt}{1.4em}{0.55em}
\titlespacing*{\subsection}{0pt}{1.0em}{0.35em}
\titlespacing*{\subsubsection}{0pt}{0.75em}{0.25em}

% ----------------------------------------------------------------------------- Captions
% and tables
% -----------------------------------------------------------------------------
\captionsetup{
  font=small,
  labelfont={bf,color=NervGraphite},
  textfont={color=NervSlate},
  margin=8pt
}
\renewcommand{\arraystretch}{1.22}
\newcolumntype{Y}{>{\raggedright\arraybackslash}X}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}

% ----------------------------------------------------------------------------- Header
% and footer
% -----------------------------------------------------------------------------
\makeatletter
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small\bfseries\color{NervGraphite}\nt@project}
\fancyhead[R]{\small\color{NervSteel}\nt@docid\;|\;Rev.\,\nt@revision}
\fancyfoot[L]{\small\color{NervSteel}\nt@company\;--\;\nt@classification}
\fancyfoot[R]{\small\color{NervSteel}Page \thepage\ of \pageref*{LastPage}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{NervMist}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrule}{\hbox to\headwidth{\color{NervMist}\leaders\hrule height \footrulewidth\hfill}}
\makeatother

% ----------------------------------------------------------------------------- Title
% page -----------------------------------------------------------------------------
\makeatletter
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture,overlay]
    \fill[NervBlack] (current page.north west) rectangle ([yshift=-120mm]current page.north east);
    \fill[NervBlue] ([yshift=-120mm]current page.north west) rectangle ([yshift=-124mm]current page.north east);
    \fill[NervCyan] ([xshift=28mm,yshift=-124mm]current page.north west) rectangle ([xshift=95mm,yshift=-127mm]current page.north west);
    \draw[NervCyan,opacity=0.35,line width=0.6pt] ([xshift=-8mm,yshift=-22mm]current page.north east) -- ([xshift=-74mm,yshift=-104mm]current page.north east);
    \draw[NervBlue,opacity=0.45,line width=1.2pt] ([xshift=-30mm,yshift=-18mm]current page.north east) -- ([xshift=-124mm,yshift=-110mm]current page.north east);
    \fill[NervCyan,opacity=0.12] ([xshift=-44mm,yshift=-26mm]current page.north east) circle (22mm);
    \end{tikzpicture}

    \vspace*{10mm}
    {\color{white}
      \begin{minipage}[t]{0.60\textwidth}
        {\fontsize{22}{24}\selectfont\bfseries\nt@company}\par
        \vspace{2mm}
        {\small\MakeUppercase{Robotics Systems Engineering}}\par
      \end{minipage}
      \hfill
      \begin{minipage}[t]{0.32\textwidth}\raggedleft
        \ifx\nt@logo\@empty
          {\large\bfseries NT}\;{\color{NervCyan}\rule{18mm}{1.4pt}}\par
        \else
          \includegraphics[height=16mm,keepaspectratio]{\nt@logo}\par
        \fi
        \vspace{3mm}
        {\small\color{NervCyan}\MakeUppercase{\nt@classification}}\par
      \end{minipage}
    }

    \vspace*{30mm}
    {\color{white}
      {\hyphenpenalty=10000\exhyphenpenalty=10000\fontsize{27}{32}\selectfont\bfseries\raggedright\nt@document}\par
      \vspace{4mm}
      {\fontsize{14}{17}\selectfont\color{NervMist}\nt@subtitle}\par
    }

    % Project identity card: deliberately placed below the blue accent band so it cannot
    % overlap or clip into the title-page colour block.
    \begin{tikzpicture}[remember picture,overlay]
    \node[
      anchor=north west,
      fill=white,
      draw=NervMist,
      rounded corners=2mm,
      line width=0.5pt,
      inner xsep=5mm,
      inner ysep=4mm,
      text width=\dimexpr\paperwidth-54mm\relax
    ] at ([xshift=22mm,yshift=-134mm]current page.north west) {%%
      {\scriptsize\bfseries\color{NervSteel}\MakeUppercase{Project}}\par
      \vspace{1mm}
      {\Large\bfseries\color{NervGraphite}\nt@project}\par
    };
    \end{tikzpicture}

    \vspace*{44mm}
    \vfill
    \begin{tcolorbox}[
        colback=white,
        colframe=NervMist,
        boxrule=0.5pt,
        arc=2mm,
        left=5mm,right=5mm,top=4mm,bottom=4mm,
        width=\textwidth
      ]
      \begin{tabularx}{\textwidth}{@{}L{30mm}Y L{28mm}Y@{}}
        \textbf{Document ID} & \nt@docid  & \textbf{Revision} & \nt@revision       \\
        \textbf{Status}      & \nt@status & \textbf{Date}     & \nt@date           \\
        \textbf{Author}      & \nt@author & \textbf{Approver} & \nt@approver       \\
        \textbf{Owner}       & \nt@owner  & \textbf{Class}    & \nt@classification \\
      \end{tabularx}
    \end{tcolorbox}

    \ifx\nt@abstract\@empty\else
      \vspace{5mm}
      \begin{tcolorbox}[
          colback=NervMist,
          colframe=NervMist,
          boxrule=0pt,
          arc=2mm,
          left=5mm,right=5mm,top=4mm,bottom=4mm
        ]
        \textbf{Abstract}\par\vspace{1mm}\nt@abstract
      \end{tcolorbox}
    \fi

    \vspace{5mm}
    {\small\color{NervSteel}\textbf{Keywords:} \nt@keywords}\par
    \vspace{4mm}
    {\small\color{NervSteel}\textcopyright\ \the\year\ \nt@company. All rights reserved.}
  \end{titlepage}
  \setcounter{page}{1}
}
\makeatother

% ----------------------------------------------------------------------------- Optional
% watermark
% -----------------------------------------------------------------------------
\makeatletter
\ifnt@watermark
  \RequirePackage{eso-pic}
  \AddToShipoutPictureBG{%
    \begin{tikzpicture}[remember picture,overlay]
    \node[rotate=35,scale=9,text=NervMist,opacity=0.20] at (current page.center) {DRAFT};
    \end{tikzpicture}%
  }
\fi
\makeatother

% ----------------------------------------------------------------------------- Callout
% boxes for engineering documentation
% -----------------------------------------------------------------------------
\tcbset{
  ntbox/.style={
      enhanced,
      sharp corners=south,
      arc=1.2mm,
      boxrule=0pt,
      leftrule=2.6mm,
      left=3mm,right=3mm,top=2mm,bottom=2mm,
      fonttitle=\bfseries,
      coltitle=NervGraphite
    }
}

\newtcolorbox{designnote}[1][]{
  ntbox,
  colback=NervMist,
  colframe=NervBlue,
  title={Design Note\ifstrempty{#1}{}{ -- #1}}
}

\newtcolorbox{safetynote}[1][]{
  ntbox,
  colback=red!4!white,
  colframe=NervRed,
  title={Safety Critical\ifstrempty{#1}{}{ -- #1}}
}

\newtcolorbox{testnote}[1][]{
  ntbox,
  colback=green!5!white,
  colframe=NervGreen,
  title={Verification / Test\ifstrempty{#1}{}{ -- #1}}
}

\newtcolorbox{risknote}[1][]{
  ntbox,
  colback=orange!6!white,
  colframe=NervAmber,
  title={Risk / Mitigation\ifstrempty{#1}{}{ -- #1}}
}

\newtcolorbox{interfacebox}[1][]{
  ntbox,
  colback=blue!3!white,
  colframe=NervCyan,
  title={Interface\ifstrempty{#1}{}{ -- #1}}
}

% -----------------------------------------------------------------------------
% Document-control environments
% -----------------------------------------------------------------------------
\newenvironment{revisionhistory}{%
  \section*{Revision History}
  \addcontentsline{toc}{section}{Revision History}
  \centering
  \begin{tabular}{@{}|L{16mm}|L{26mm}|L{32mm}|L{75mm}|@{}}
  \hline
  \textbf{Rev.} & \textbf{Date} & \textbf{Author} & \textbf{Change Description} \\
  \hline
}{%

  \end{tabular}
}
\newcommand{\revisionrow}[4]{#1 & #2 & #3 & #4 \\ \hline}

\newenvironment{approvaltable}{%
  \section*{Approval}
  \addcontentsline{toc}{section}{Approval}
  \centering
  \begin{tabular}{@{}|L{28mm}|L{54mm}|L{32mm}|L{26mm}|@{}}
  \hline
  \textbf{Role} & \textbf{Name} & \textbf{Signature} & \textbf{Date} \\
  \hline
}{%

  \end{tabular}
}
\newcommand{\approvalrow}[4]{#1 & #2 & #3 & #4 \\ \hline}

% -----------------------------------------------------------------------------
% Engineering tables
% -----------------------------------------------------------------------------
\newenvironment{requirementstable}{%
  \begin{table}[H]
  \centering
  \caption{Requirements}
  \begin{tabular}{@{}|L{19mm}|L{19mm}|L{62mm}|L{22mm}|L{22mm}|@{}}
  \hline
  \textbf{ID} & \textbf{Type} & \textbf{Requirement} & \textbf{Driving Goal} & \textbf{Verification} \\
  \hline
}{%

  \end{tabular}
  \end{table}
}
\newcommand{\reqrow}[5]{#1 & #2 & #3 & #4 & #5 \\ \hline}

\newenvironment{bomtable}{%
  \begin{table}[H]
  \centering
  \caption{Bill of Materials}
  \begin{tabular}{@{}|L{14mm}|L{65mm}|L{24mm}|L{18mm}|R{18mm}|@{}}
  \hline
  \textbf{Item} & \textbf{Description} & \textbf{Part / Spec} & \textbf{Qty} & \textbf{Est. Cost} \\
  \hline
}{%

  \end{tabular}
  \end{table}
}
\newcommand{\bomrow}[5]{#1 & #2 & #3 & #4 & #5 \\ \hline}

\newenvironment{testcasetable}{%
  \begin{table}[H]
  \centering
  \caption{Verification Test Cases}
  \begin{tabular}{@{}|L{18mm}|L{52mm}|L{52mm}|L{20mm}|@{}}
  \hline
  \textbf{Test ID} & \textbf{Procedure} & \textbf{Acceptance Criteria} & \textbf{Result} \\
  \hline
}{%

  \end{tabular}
  \end{table}
}
\newcommand{\testrow}[4]{#1 & #2 & #3 & #4 \\ \hline}

\newenvironment{interfacetable}{%
  \begin{table}[H]
  \centering
  \caption{System Interfaces}
  \begin{tabular}{@{}|L{23mm}|L{23mm}|L{49mm}|L{49mm}|@{}}
  \hline
  \textbf{Interface} & \textbf{Domain} & \textbf{Signal / Data} & \textbf{Constraint} \\
  \hline
}{%

  \end{tabular}
  \end{table}
}
\newcommand{\interfacerow}[4]{#1 & #2 & #3 & #4 \\ \hline}

% ----------------------------------------------------------------------------- Code
% listing style
% -----------------------------------------------------------------------------
\lstdefinestyle{nervtech}{
  basicstyle=\ttfamily\small,
  keywordstyle=\bfseries\color{NervBlue},
  commentstyle=\itshape\color{NervSteel},
  stringstyle=\color{NervGreen},
  numberstyle=\scriptsize\color{NervSteel},
  numbers=left,
  stepnumber=1,
  numbersep=8pt,
  showstringspaces=false,
  breaklines=true,
  frame=single,
  rulecolor=\color{NervMist},
  backgroundcolor=\color{NervMist!45},
  tabsize=2,
  captionpos=b
}
\lstset{style=nervtech}

% -----------------------------------------------------------------------------
% Convenience macros
% -----------------------------------------------------------------------------
\newcommand{\nttag}[1]{\textcolor{NervBlue}{\textbf{[#1]}}}
\providecommand{\ntunit}[1]{\ensuremath{\,\mathrm{#1}}}
\newcommand{\torque}{\ensuremath{\tau}}
\newcommand{\rpm}{\ensuremath{\mathrm{rpm}}}
\newcommand{\gearRatio}{\ensuremath{N_g}}
\newcommand{\efficiency}{\ensuremath{\eta}}
\newcommand{\encoderres}{\ensuremath{N_{enc}}}
\newcommand{\todo}[1]{\textcolor{NervRed}{\textbf{TODO:} #1}}

% Compact project summary block
\newcommand{\systemsummary}[4]{%
  \begin{tcolorbox}[
      colback=NervBlack,
      colframe=NervBlack,
      arc=2mm,
      boxrule=0pt,
      left=4mm,right=4mm,top=3mm,bottom=3mm
    ]
    {\color{white}\textbf{System Summary}}\par\vspace{2mm}
    \begin{tabularx}{\textwidth}{@{}L{30mm}Y@{}}
      {\color{NervCyan}\textbf{Architecture}}                                   & {\color{white}#1} \\
      {\color{NervCyan}\textbf{Control}} & {\color{white}#2} \\
      {\color{NervCyan}\textbf{Sensing}} & {\color{white}#3} \\
      {\color{NervCyan}\textbf{Safety}}  & {\color{white}#4} \\
    \end{tabularx}
  \end{tcolorbox}
}

% End of class
