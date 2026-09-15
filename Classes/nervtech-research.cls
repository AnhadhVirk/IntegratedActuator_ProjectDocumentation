%% nervtech-research.cls
%% LaTeX class for NervTech preliminary research documents
%% Version: 1.0.0 | Date: 2026-06-25
%%
%% Usage:
%%   \documentclass[internal]{nervtech-research}
%%   \nervsetup{project={Integrated Robotic Actuator}, document={Preliminary Research Note}}
%%   \begin{document}
%%   \maketitle
%%   ...
%%   \end{document}
%%
%% Recommended compiler: XeLaTeX or LuaLaTeX.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nervtech-research}[2026/06/25 v1.0.0 NervTech Preliminary Research Document Class]

% -----------------------------------------------------------------------------
% Class options
% -----------------------------------------------------------------------------
\newif\ifnr@draft
\newif\ifnr@watermark
\newif\ifnr@confidential
\newif\ifnr@public
\nr@draftfalse
\nr@watermarkfalse
\nr@confidentialfalse
\nr@publicfalse
\def\nr@classification{INTERNAL}

\DeclareOption{draft}{\nr@drafttrue\nr@watermarktrue\PassOptionsToClass{draft}{article}}
\DeclareOption{final}{\nr@draftfalse}
\DeclareOption{watermark}{\nr@watermarktrue}
\DeclareOption{public}{\nr@publictrue\nr@confidentialfalse\def\nr@classification{PUBLIC}}
\DeclareOption{internal}{\nr@publicfalse\nr@confidentialfalse\def\nr@classification{INTERNAL}}
\DeclareOption{confidential}{\nr@confidentialtrue\nr@publicfalse\def\nr@classification{CONFIDENTIAL}}
\DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{article}}
\DeclareOption{letterpaper}{\PassOptionsToClass{letterpaper}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{11pt,a4paper,internal}
\ProcessOptions\relax

\LoadClass{article}

% -----------------------------------------------------------------------------
% Packages
% -----------------------------------------------------------------------------
\RequirePackage[margin=23mm,top=25mm,bottom=25mm,headheight=22pt]{geometry}
\RequirePackage{iftex}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{keyval}
\RequirePackage{etoolbox}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage{microtype}

% -----------------------------------------------------------------------------
% Typography
% -----------------------------------------------------------------------------
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[scale=0.97]{tgheros}
  \RequirePackage{inconsolata}
  \renewcommand{\familydefault}{\sfdefault}
\else
  \RequirePackage{fontspec}
  \defaultfontfeatures{Ligatures=TeX}
  \IfFontExistsTF{Inter}{%
    \setsansfont{Inter}[Scale=0.97]
    \setmainfont{Inter}[Scale=0.97]
  }{%
    \IfFontExistsTF{TeX Gyre Heros}{%
      \setsansfont{TeX Gyre Heros}[Scale=0.97]
      \setmainfont{TeX Gyre Heros}[Scale=0.97]
    }{%
      \setsansfont{Arial}[Scale=0.97]
      \setmainfont{Arial}[Scale=0.97]
    }%
  }%
  \IfFontExistsTF{JetBrains Mono}{%
    \setmonofont{JetBrains Mono}[Scale=0.88]
  }{%
    \IfFontExistsTF{DejaVu Sans Mono}{\setmonofont{DejaVu Sans Mono}[Scale=0.88]}{\setmonofont{lmmono10-regular.otf}[Scale=0.88]}%
  }%
\fi

\linespread{1.05}
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt plus 2pt minus 1pt}
\setlist{itemsep=2pt,topsep=4pt,leftmargin=1.45em}

% -----------------------------------------------------------------------------
% NervTech brand colours
% -----------------------------------------------------------------------------
\definecolor{NervBlack}{HTML}{090D12}
\definecolor{NervGraphite}{HTML}{151B23}
\definecolor{NervSlate}{HTML}{2B3440}
\definecolor{NervSteel}{HTML}{657080}
\definecolor{NervMist}{HTML}{EEF3F7}
\definecolor{NervPaper}{HTML}{F8FAFC}
\definecolor{NervCyan}{HTML}{00D4FF}
\definecolor{NervBlue}{HTML}{1976FF}
\definecolor{NervViolet}{HTML}{7C3AED}
\definecolor{NervGreen}{HTML}{00C48C}
\definecolor{NervAmber}{HTML}{FFB020}
\definecolor{NervRed}{HTML}{FF4D5E}

\colorlet{nrPrimary}{NervViolet}
\colorlet{nrAccent}{NervCyan}
\colorlet{nrText}{NervBlack}
\colorlet{nrMuted}{NervSteel}
\color{nrText}

% -----------------------------------------------------------------------------
% Metadata keys
% -----------------------------------------------------------------------------
\makeatletter
\def\nr@company{NervTech}
\def\nr@project{Integrated Robotic Actuator}
\def\nr@document{Preliminary Research Document}
\def\nr@subtitle{Problem framing, evidence, assumptions, and early technical direction}
\def\nr@docid{NT-IRA-RES-001}
\def\nr@revision{A}
\def\nr@status{Exploratory Draft}
\def\nr@author{NervTech Research}
\def\nr@owner{Robotics Systems Engineering}
\def\nr@date{\today}
\def\nr@stage{Preliminary Research}
\def\nr@question{What evidence should guide the next design iteration?}
\def\nr@abstract{}
\def\nr@keywords{robotics, actuator, preliminary research, design evidence}
\def\nr@logo{}

\define@key{nerv}{company}{\def\nr@company{#1}}
\define@key{nerv}{project}{\def\nr@project{#1}}
\define@key{nerv}{document}{\def\nr@document{#1}}
\define@key{nerv}{subtitle}{\def\nr@subtitle{#1}}
\define@key{nerv}{docid}{\def\nr@docid{#1}}
\define@key{nerv}{revision}{\def\nr@revision{#1}}
\define@key{nerv}{status}{\def\nr@status{#1}}
\define@key{nerv}{author}{\def\nr@author{#1}}
\define@key{nerv}{owner}{\def\nr@owner{#1}}
\define@key{nerv}{date}{\def\nr@date{#1}}
\define@key{nerv}{stage}{\def\nr@stage{#1}}
\define@key{nerv}{question}{\def\nr@question{#1}}
\define@key{nerv}{abstract}{\def\nr@abstract{#1}}
\define@key{nerv}{keywords}{\def\nr@keywords{#1}}
\define@key{nerv}{classification}{\def\nr@classification{#1}}
\define@key{nerv}{logo}{\def\nr@logo{#1}}
\newcommand{\nervsetup}[1]{\setkeys{nerv}{#1}}
\newcommand{\nervresearchsetup}[1]{\setkeys{nerv}{#1}}
\newcommand{\nervcompany}{\nr@company}
\newcommand{\nervproject}{\nr@project}
\newcommand{\nervdocument}{\nr@document}
\newcommand{\nervdocid}{\nr@docid}
\newcommand{\nervclassification}{\nr@classification}
\makeatother

% -----------------------------------------------------------------------------
% Hyperref and PDF metadata
% -----------------------------------------------------------------------------
\hypersetup{
  colorlinks=true,
  linkcolor=NervBlue,
  citecolor=NervViolet,
  urlcolor=NervBlue,
  pdfauthor={NervTech},
  pdftitle={NervTech Preliminary Research Document},
  pdfsubject={Integrated Robotic Actuator},
  pdfkeywords={robotics, actuator, preliminary research, NervTech},
  pdfcreator={LaTeX with nervtech-research.cls}
}

% -----------------------------------------------------------------------------
% Section styling
% -----------------------------------------------------------------------------
\titleformat{\section}
  {\Large\bfseries\color{NervGraphite}}
  {\llap{\color{NervViolet}\rule[-0.2em]{3pt}{1.35em}\hspace{0.6em}}\thesection}
  {0.75em}
  {\MakeUppercase}
\titleformat{\subsection}{\large\bfseries\color{NervGraphite}}{\thesubsection}{0.75em}{}
\titleformat{\subsubsection}{\normalsize\bfseries\color{NervSlate}}{\thesubsubsection}{0.75em}{}
\titlespacing*{\section}{0pt}{1.35em}{0.55em}
\titlespacing*{\subsection}{0pt}{1.0em}{0.35em}
\titlespacing*{\subsubsection}{0pt}{0.75em}{0.25em}

% -----------------------------------------------------------------------------
% Tables and captions
% -----------------------------------------------------------------------------
\captionsetup{font=small,labelfont={bf,color=NervGraphite},textfont={color=NervSlate},margin=8pt}
\renewcommand{\arraystretch}{1.22}
\newcolumntype{Y}{>{\raggedright\arraybackslash}X}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}

% -----------------------------------------------------------------------------
% Header and footer
% -----------------------------------------------------------------------------
\makeatletter
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small\bfseries\color{NervGraphite}\nr@project}
\fancyhead[R]{\small\color{NervSteel}\nr@docid\;|\;Rev.\,\nr@revision}
\fancyfoot[L]{\small\color{NervSteel}\nr@company\;--\;\nr@classification}
\fancyfoot[R]{\small\color{NervSteel}Page \thepage\ of \pageref*{LastPage}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{NervMist}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrule}{\hbox to\headwidth{\color{NervMist}\leaders\hrule height \footrulewidth\hfill}}
\makeatother

% -----------------------------------------------------------------------------
% Title page
% -----------------------------------------------------------------------------
\makeatletter
\renewcommand{\maketitle}{%
  \begin{titlepage}
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    \fill[NervBlack] (current page.north west) rectangle ([yshift=-96mm]current page.north east);
    \fill[NervViolet] ([yshift=-96mm]current page.north west) rectangle ([yshift=-101mm]current page.north east);
    \fill[NervCyan] ([xshift=22mm,yshift=-101mm]current page.north west) rectangle ([xshift=92mm,yshift=-104mm]current page.north west);
    \draw[NervCyan,opacity=0.35,line width=0.6pt] ([xshift=-12mm,yshift=-18mm]current page.north east) -- ([xshift=-74mm,yshift=-90mm]current page.north east);
    \draw[NervViolet,opacity=0.5,line width=1.0pt] ([xshift=-38mm,yshift=-15mm]current page.north east) -- ([xshift=-128mm,yshift=-96mm]current page.north east);
    \fill[NervCyan,opacity=0.11] ([xshift=-47mm,yshift=-27mm]current page.north east) circle (20mm);
  \end{tikzpicture}
  \vspace*{11mm}
  {\color{white}
    \begin{minipage}[t]{0.60\textwidth}
      {\fontsize{22}{24}\selectfont\bfseries\nr@company}\par
      \vspace{2mm}
      {\small\MakeUppercase{Research and Concept Development}}\par
    \end{minipage}\hfill
    \begin{minipage}[t]{0.32\textwidth}\raggedleft
      \ifx\nr@logo\@empty
        {\large\bfseries NT}\;{\color{NervCyan}\rule{18mm}{1.4pt}}\par
      \else
        \includegraphics[height=16mm,keepaspectratio]{\nr@logo}\par
      \fi
      \vspace{3mm}
      {\small\color{NervCyan}\MakeUppercase{\nr@classification}}\par
    \end{minipage}
  }
  \vspace*{20mm}
  {\color{white}
    {\hyphenpenalty=10000\exhyphenpenalty=10000\fontsize{26}{31}\selectfont\bfseries\raggedright\nr@document}\par
    \vspace{4mm}
    {\fontsize{13}{16}\selectfont\color{NervMist}\nr@subtitle}\par
  }
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north west,fill=white,draw=NervMist,rounded corners=2mm,line width=0.5pt,inner xsep=5mm,inner ysep=4mm,text width=\dimexpr\paperwidth-54mm\relax]
      at ([xshift=22mm,yshift=-112mm]current page.north west) {%
        {\scriptsize\bfseries\color{NervSteel}\MakeUppercase{Project}}\par\vspace{1mm}
        {\Large\bfseries\color{NervGraphite}\nr@project}\par
      };
  \end{tikzpicture}
  \vspace*{42mm}
  \begin{tcolorbox}[colback=white,colframe=NervMist,boxrule=0.5pt,arc=2mm,left=5mm,right=5mm,top=4mm,bottom=4mm,width=\textwidth]
    \begin{tabularx}{\textwidth}{@{}L{28mm}Y L{25mm}Y@{}}
      \textbf{Document ID} & \nr@docid & \textbf{Revision} & \nr@revision \\
      \textbf{Status} & \nr@status & \textbf{Date} & \nr@date \\
      \textbf{Stage} & \nr@stage & \textbf{Owner} & \nr@owner \\
      \textbf{Author} & \nr@author & \textbf{Class} & \nr@classification \\
    \end{tabularx}
  \end{tcolorbox}
  \vspace{5mm}
  \begin{tcolorbox}[colback=NervPaper,colframe=NervMist,boxrule=0pt,arc=2mm,left=5mm,right=5mm,top=4mm,bottom=4mm]
    {\bfseries\color{NervGraphite}Research Question}\par\vspace{1mm}
    {\color{NervSlate}\nr@question}
  \end{tcolorbox}
  \ifx\nr@abstract\@empty\else
    \vspace{3mm}
    \begin{tcolorbox}[colback=white,colframe=NervMist,boxrule=0.5pt,arc=2mm,left=5mm,right=5mm,top=4mm,bottom=4mm]
    \textbf{Abstract}\par\vspace{1mm}\nr@abstract
    \end{tcolorbox}
  \fi
  \vfill
  {\small\color{NervSteel}\textbf{Keywords:} \nr@keywords}\par
  \vspace{3mm}
  {\small\color{NervSteel}\textcopyright\ \the\year\ \nr@company. All rights reserved.}
  \end{titlepage}
  \setcounter{page}{1}
}
\makeatother

% -----------------------------------------------------------------------------
% Watermark
% -----------------------------------------------------------------------------
\makeatletter
\ifnr@watermark
  \RequirePackage{eso-pic}
  \AddToShipoutPictureBG{%
    \begin{tikzpicture}[remember picture,overlay]
      \node[rotate=35,scale=8,text=NervMist,opacity=0.20] at (current page.center) {DRAFT};
    \end{tikzpicture}%
  }
\fi
\makeatother

% -----------------------------------------------------------------------------
% Research callout boxes
% -----------------------------------------------------------------------------
\tcbset{
  nrbox/.style={enhanced,breakable,sharp corners=south,arc=1.2mm,boxrule=0pt,leftrule=2.6mm,left=3mm,right=3mm,top=2mm,bottom=2mm,fonttitle=\bfseries,coltitle=NervGraphite}
}

\newtcolorbox{researchquestion}[1][]{nrbox,colback=NervPaper,colframe=NervViolet,title={Research Question\ifstrempty{#1}{}{ -- #1}}}
\newtcolorbox{hypothesisbox}[1][]{nrbox,colback=blue!3!white,colframe=NervBlue,title={Hypothesis\ifstrempty{#1}{}{ -- #1}}}
\newtcolorbox{insightbox}[1][]{nrbox,colback=cyan!4!white,colframe=NervCyan,title={Insight\ifstrempty{#1}{}{ -- #1}}}
\newtcolorbox{gapbox}[1][]{nrbox,colback=orange!6!white,colframe=NervAmber,title={Open Gap\ifstrempty{#1}{}{ -- #1}}}
\newtcolorbox{decisionbox}[1][]{nrbox,colback=green!5!white,colframe=NervGreen,title={Direction / Decision\ifstrempty{#1}{}{ -- #1}}}
\newtcolorbox{riskbox}[1][]{nrbox,colback=red!4!white,colframe=NervRed,title={Risk\ifstrempty{#1}{}{ -- #1}}}

% -----------------------------------------------------------------------------
% Research tables
% -----------------------------------------------------------------------------
\newenvironment{evidencetable}{%
  \begin{table}[H]
  \centering
  \caption{Evidence Matrix}
  \begin{tabular}{@{}|L{27mm}|L{58mm}|L{31mm}|L{24mm}|@{}}
  \hline
  \textbf{Claim} & \textbf{Evidence / Observation} & \textbf{Source} & \textbf{Confidence} \\
  \hline
}{%
  
  \end{tabular}
  \end{table}
}
\newcommand{\evidencerow}[4]{#1 & #2 & #3 & #4 \\ \hline}

\newenvironment{assumptiontable}{%
  \begin{table}[H]
  \centering
  \caption{Assumptions to Validate}
  \begin{tabular}{@{}|L{26mm}|L{54mm}|L{38mm}|L{22mm}|@{}}
  \hline
  \textbf{Assumption} & \textbf{Why it matters} & \textbf{Validation method} & \textbf{Owner} \\
  \hline
}{%
  
  \end{tabular}
  \end{table}
}
\newcommand{\assumptionrow}[4]{#1 & #2 & #3 & #4 \\ \hline}

\newenvironment{researchbacklog}{%
  \begin{table}[H]
  \centering
  \caption{Research Backlog}
  \begin{tabular}{@{}|L{18mm}|L{58mm}|L{32mm}|L{30mm}|@{}}
  \hline
  \textbf{ID} & \textbf{Question / Task} & \textbf{Output} & \textbf{Priority} \\
  \hline
}{%
  
  \end{tabular}
  \end{table}
}
\newcommand{\backlogrow}[4]{#1 & #2 & #3 & #4 \\ \hline}

% -----------------------------------------------------------------------------
% Summary helper
% -----------------------------------------------------------------------------
\newcommand{\researchsnapshot}[4]{%
  \begin{tcolorbox}[colback=NervBlack,colframe=NervBlack,arc=2mm,boxrule=0pt,left=4mm,right=4mm,top=3mm,bottom=3mm]
  {\color{white}\textbf{Research Snapshot}}\par\vspace{2mm}
  \begin{tabularx}{\textwidth}{@{}L{31mm}Y@{}}
    {\color{NervCyan}\textbf{Problem}} & {\color{white}#1} \\
    {\color{NervCyan}\textbf{Key Finding}} & {\color{white}#2} \\
    {\color{NervCyan}\textbf{Main Uncertainty}} & {\color{white}#3} \\
    {\color{NervCyan}\textbf{Next Step}} & {\color{white}#4} \\
  \end{tabularx}
  \end{tcolorbox}
}

% End of class
