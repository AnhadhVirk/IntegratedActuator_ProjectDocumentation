%% nervtech-overview.cls % LaTeX class for NervTech non-technical project overviews %
%Version: 1.0.1 | Date: 2026-07-04 % % Usage: %
%\documentclass[public]{nervtech-overview} % \nervsetup{project={Integrated Robotic
%Actuator}, document={Project Overview}} % \begin{document} % \maketitle % ... %
%\end{document} % % Recommended compiler: XeLaTeX or LuaLaTeX.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nervtech-overview}[2026/07/04 v1.0.1 NervTech Non-Technical Project Overview Class]

% ----------------------------------------------------------------------------- Class
% options -----------------------------------------------------------------------------
\newif\ifno@draft
\newif\ifno@watermark
\newif\ifno@confidential
\newif\ifno@public
\no@draftfalse
\no@watermarkfalse
\no@confidentialfalse
\no@publicfalse
\def\no@classification{INTERNAL}

\DeclareOption{draft}{\no@drafttrue\no@watermarktrue\PassOptionsToClass{draft}{article}}
\DeclareOption{final}{\no@draftfalse}
\DeclareOption{watermark}{\no@watermarktrue}
\DeclareOption{public}{\no@publictrue\no@confidentialfalse\def\no@classification{PUBLIC}}
\DeclareOption{internal}{\no@publicfalse\no@confidentialfalse\def\no@classification{INTERNAL}}
\DeclareOption{confidential}{\no@confidentialtrue\no@publicfalse\def\no@classification{CONFIDENTIAL}}
\DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{article}}
\DeclareOption{letterpaper}{\PassOptionsToClass{letterpaper}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{11pt,a4paper,internal}
\ProcessOptions\relax

\LoadClass{article}

% ----------------------------------------------------------------------------- Packages
% -----------------------------------------------------------------------------
\RequirePackage[margin=23mm,top=25mm,bottom=25mm,headheight=22pt]{geometry}
\RequirePackage{iftex}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{booktabs}
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
\RequirePackage{microtype}
\RequirePackage{colortbl}

% -----------------------------------------------------------------------------
% Typography
% -----------------------------------------------------------------------------
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[scale=0.98]{tgheros}
  \renewcommand{\familydefault}{\sfdefault}
\else
  \RequirePackage{fontspec}
  \defaultfontfeatures{Ligatures=TeX}
  \IfFontExistsTF{Inter}{%
    \setsansfont{Inter}[Scale=0.98]
    \setmainfont{Inter}[Scale=0.98]
  }{%
    \IfFontExistsTF{TeX Gyre Heros}{%
      \setsansfont{TeX Gyre Heros}[Scale=0.98]
      \setmainfont{TeX Gyre Heros}[Scale=0.98]
    }{%
      \setsansfont{Arial}[Scale=0.98]
      \setmainfont{Arial}[Scale=0.98]
    }%
  }%
\fi

\linespread{1.06}
\setlength{\parindent}{0pt}
\setlength{\parskip}{7pt plus 2pt minus 1pt}
\setlist{itemsep=2pt,topsep=4pt,leftmargin=1.45em}

% ----------------------------------------------------------------------------- NervTech
% brand colours
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

\colorlet{noPrimary}{NervBlue}
\colorlet{noAccent}{NervCyan}
\colorlet{noText}{NervBlack}
\colorlet{noMuted}{NervSteel}
\color{noText}

% ----------------------------------------------------------------------------- Metadata
% keys -----------------------------------------------------------------------------
\makeatletter
\def\no@company{NervTech}
\def\no@project{Integrated Robotic Actuator}
\def\no@document{Project Overview}
\def\no@subtitle{A concise non-technical summary for stakeholders, collaborators, and reviewers}
\def\no@docid{NT-IRA-OVR-001}
\def\no@revision{A}
\def\no@status{Draft Brief}
\def\no@author{NervTech}
\def\no@owner{Robotics Systems Engineering}
\def\no@date{\today}
\def\no@audience{Non-technical stakeholders}
\def\no@purpose{Explain what the project is, why it matters, and what comes next.}
\def\no@tagline{Actuation intelligence for compact robotic systems.}
\def\no@logo{}
\def\no@summary{}

\define@key{nerv}{company}{\def\no@company{#1}}
\define@key{nerv}{project}{\def\no@project{#1}}
\define@key{nerv}{document}{\def\no@document{#1}}
\define@key{nerv}{subtitle}{\def\no@subtitle{#1}}
\define@key{nerv}{docid}{\def\no@docid{#1}}
\define@key{nerv}{revision}{\def\no@revision{#1}}
\define@key{nerv}{status}{\def\no@status{#1}}
\define@key{nerv}{author}{\def\no@author{#1}}
\define@key{nerv}{owner}{\def\no@owner{#1}}
\define@key{nerv}{date}{\def\no@date{#1}}
\define@key{nerv}{audience}{\def\no@audience{#1}}
\define@key{nerv}{purpose}{\def\no@purpose{#1}}
\define@key{nerv}{tagline}{\def\no@tagline{#1}}
\define@key{nerv}{classification}{\def\no@classification{#1}}
\define@key{nerv}{logo}{\def\no@logo{#1}}
\define@key{nerv}{summary}{\def\no@summary{#1}}
\newcommand{\nervsetup}[1]{\setkeys{nerv}{#1}}
\newcommand{\nervoverviewsetup}[1]{\setkeys{nerv}{#1}}
\newcommand{\nervcompany}{\no@company}
\newcommand{\nervproject}{\no@project}
\newcommand{\nervdocument}{\no@document}
\newcommand{\nervdocid}{\no@docid}
\newcommand{\nervclassification}{\no@classification}
\makeatother

% ----------------------------------------------------------------------------- Hyperref
% -----------------------------------------------------------------------------
\hypersetup{
  colorlinks=true,
  linkcolor=NervBlue,
  urlcolor=NervBlue,
  pdfauthor={NervTech},
  pdftitle={NervTech Project Overview},
  pdfsubject={Integrated Robotic Actuator},
  pdfkeywords={robotics, actuator, project overview, NervTech},
  pdfcreator={LaTeX with nervtech-overview.cls}
}

% ----------------------------------------------------------------------------- Section
% styling -----------------------------------------------------------------------------
\titleformat{\section}
{\Large\bfseries\color{NervGraphite}}
{\llap{\color{NervBlue}\rule[-0.2em]{3pt}{1.35em}\hspace{0.6em}}\thesection}
{0.75em}
{\MakeUppercase}
\titleformat{\subsection}{\large\bfseries\color{NervGraphite}}{\thesubsection}{0.75em}{}
\titleformat{\subsubsection}{\normalsize\bfseries\color{NervSlate}}{\thesubsubsection}{0.75em}{}
\titlespacing*{\section}{0pt}{1.35em}{0.55em}
\titlespacing*{\subsection}{0pt}{1.0em}{0.35em}
\titlespacing*{\subsubsection}{0pt}{0.75em}{0.25em}

% ----------------------------------------------------------------------------- Tables
% and captions
% -----------------------------------------------------------------------------
\captionsetup{font=small,labelfont={bf,color=NervGraphite},textfont={color=NervSlate},margin=8pt}
\renewcommand{\arraystretch}{1.24}
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
\fancyhead[L]{\small\bfseries\color{NervGraphite}\no@project}
\fancyhead[R]{\small\color{NervSteel}\no@docid\;|\;Rev.\,\no@revision}
\fancyfoot[L]{\small\color{NervSteel}\no@company\;--\;\no@classification}
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
    \fill[NervBlack] (current page.north west) rectangle ([yshift=-110mm]current page.north east);
    \fill[NervBlue] ([yshift=-110mm]current page.north west) rectangle ([yshift=-115mm]current page.north east);
    \fill[NervCyan] ([xshift=22mm,yshift=-115mm]current page.north west) rectangle ([xshift=100mm,yshift=-118mm]current page.north west);
    \draw[NervCyan,opacity=0.35,line width=0.6pt] ([xshift=-12mm,yshift=-18mm]current page.north east) -- ([xshift=-75mm,yshift=-104mm]current page.north east);
    \draw[NervBlue,opacity=0.55,line width=1.2pt] ([xshift=-36mm,yshift=-16mm]current page.north east) -- ([xshift=-128mm,yshift=-110mm]current page.north east);
    \fill[NervCyan,opacity=0.11] ([xshift=-47mm,yshift=-27mm]current page.north east) circle (20mm);
    \end{tikzpicture}
    \vspace*{11mm}
    {\color{white}
      \begin{minipage}[t]{0.60\textwidth}
        {\fontsize{22}{24}\selectfont\bfseries\no@company}\par
        \vspace{2mm}
        {\small\MakeUppercase{Robotics Systems Overview}}\par
      \end{minipage}\hfill
      \begin{minipage}[t]{0.32\textwidth}\raggedleft
        \ifx\no@logo\@empty
          {\large\bfseries NT}\;{\color{NervCyan}\rule{18mm}{1.4pt}}\par
        \else
          \includegraphics[height=16mm,keepaspectratio]{\no@logo}\par
        \fi
        \vspace{3mm}
        {\small\color{NervCyan}\MakeUppercase{\no@classification}}\par
      \end{minipage}
    }
    \vspace*{18mm}
    {\color{white}
      {\fontsize{15}{18}\selectfont\color{NervCyan}\bfseries\no@tagline}\par
      \vspace{6mm}
      {\hyphenpenalty=10000\exhyphenpenalty=10000\fontsize{28}{33}\selectfont\bfseries\raggedright\no@document}\par
      \vspace{4mm}
      {\fontsize{13}{16}\selectfont\color{NervMist}\no@subtitle}\par
    }
    \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north west,fill=white,draw=NervMist,rounded corners=2mm,line width=0.5pt,inner xsep=5mm,inner ysep=4mm,text width=\dimexpr\paperwidth-54mm\relax]
    at ([xshift=22mm,yshift=-126mm]current page.north west) {%
      {\scriptsize\bfseries\color{NervSteel}\MakeUppercase{Project}}\par\vspace{1mm}
      {\Large\bfseries\color{NervGraphite}\no@project}\par
    };
    \end{tikzpicture}
    \vspace*{38mm}
    \begin{tcolorbox}[colback=white,colframe=NervMist,boxrule=0.5pt,arc=2mm,left=5mm,right=5mm,top=4mm,bottom=4mm,width=\textwidth]
      \begin{tabularx}{\textwidth}{@{}L{28mm}Y L{25mm}Y@{}}
        \textbf{Document ID} & \no@docid    & \textbf{Revision} & \no@revision       \\
        \textbf{Status}      & \no@status   & \textbf{Date}     & \no@date           \\
        \textbf{Audience}    & \no@audience & \textbf{Owner}    & \no@owner          \\
        \textbf{Author}      & \no@author   & \textbf{Class}    & \no@classification \\
      \end{tabularx}
    \end{tcolorbox}
    \vspace{5mm}
    \begin{tcolorbox}[colback=NervPaper,colframe=NervMist,boxrule=0pt,arc=2mm,left=5mm,right=5mm,top=4mm,bottom=4mm]
      {\bfseries\color{NervGraphite}Purpose}\par\vspace{1mm}
      {\color{NervSlate}\no@purpose}
    \end{tcolorbox}
    \ifx\no@summary\@empty\else
      \vspace{3mm}
      \begin{tcolorbox}[colback=white,colframe=NervMist,boxrule=0.5pt,arc=2mm,left=5mm,right=5mm,top=4mm,bottom=4mm]
        \textbf{Summary}\par\vspace{1mm}\no@summary
      \end{tcolorbox}
    \fi
    \vfill
    {\small\color{NervSteel}\textcopyright\ \the\year\ \no@company. All rights reserved.}
  \end{titlepage}
  \setcounter{page}{1}
}
\makeatother

% -----------------------------------------------------------------------------
% Watermark
% -----------------------------------------------------------------------------
\makeatletter
\ifno@watermark
  \RequirePackage{eso-pic}
  \AddToShipoutPictureBG{%
    \begin{tikzpicture}[remember picture,overlay]
    \node[rotate=35,scale=8,text=NervMist,opacity=0.20] at (current page.center) {DRAFT};
    \end{tikzpicture}%
  }
\fi
\makeatother

% ----------------------------------------------------------------------------- Overview
% callouts -----------------------------------------------------------------------------
\tcbset{
  nobox/.style={enhanced,breakable,sharp corners=south,arc=1.2mm,boxrule=0pt,leftrule=2.6mm,left=3mm,right=3mm,top=2mm,bottom=2mm,fonttitle=\bfseries,coltitle=NervGraphite}
}

\newtcolorbox{overviewbox}[1][]{nobox,colback=NervPaper,colframe=NervBlue,title={Overview\ifstrempty{#1}{}{ -- #1}}}
\newtcolorbox{valuebox}[1][]{nobox,colback=cyan!4!white,colframe=NervCyan,title={Value\ifstrempty{#1}{}{ -- #1}}}
\newtcolorbox{statusbox}[1][]{nobox,colback=green!5!white,colframe=NervGreen,title={Status\ifstrempty{#1}{}{ -- #1}}}
\newtcolorbox{decisionbox}[1][]{nobox,colback=blue!3!white,colframe=NervBlue,title={Decision\ifstrempty{#1}{}{ -- #1}}}
\newtcolorbox{riskbox}[1][]{nobox,colback=orange!6!white,colframe=NervAmber,title={Concern\ifstrempty{#1}{}{ -- #1}}}
\newtcolorbox{plainstakeholderbox}[1][]{nobox,colback=white,colframe=NervViolet,title={Stakeholder Note\ifstrempty{#1}{}{ -- #1}}}

% ----------------------------------------------------------------------------- Overview
% tables -----------------------------------------------------------------------------
\newenvironment{milestonetable}{%
  \begin{table}[H]
  \centering
  \caption{Milestones}
  \begin{tabular}{@{}|L{25mm}|L{62mm}|L{30mm}|L{22mm}|@{}}
  \hline
  \textbf{Milestone} & \textbf{Meaning} & \textbf{Target} & \textbf{Status} \\
  \hline
}{%
  
  \end{tabular}
  \end{table}
}
\newcommand{\milestonerow}[4]{#1 & #2 & #3 & #4 \\ \hline}

\newenvironment{stakeholdertable}{%
  \begin{table}[H]
  \centering
  \caption{Stakeholder Map}
  \begin{tabular}{@{}|L{34mm}|L{52mm}|L{52mm}|@{}}
  \hline
  \textbf{Audience} & \textbf{What they need to know} & \textbf{How this document helps} \\
  \hline
}{%
  
  \end{tabular}
  \end{table}
}
\newcommand{\stakeholderrow}[3]{#1 & #2 & #3 \\ \hline}

\newenvironment{roadmaptable}{%
  \begin{table}[H]
  \centering
  \caption{Project Roadmap}
  \begin{tabular}{@{}|L{24mm}|L{64mm}|L{42mm}|@{}}
  \hline
  \textbf{Phase} & \textbf{Focus} & \textbf{Visible Output} \\
  \hline
}{%
  
  \end{tabular}
  \end{table}
}
\newcommand{\roadmaprow}[3]{#1 & #2 & #3 \\ \hline}

% ----------------------------------------------------------------------------- Goals
% table -----------------------------------------------------------------------------
\makeatletter
\@ifundefined{c@nogoal}{\newcounter{nogoal}}{}
\makeatother

\newenvironment{goalstable}{%
  \setcounter{nogoal}{0}%
  \begin{table}[H]
  \centering
  \caption{Overall Project Goals}
  \begin{tcolorbox}[
    colback=white,
    colframe=NervMist,
    boxrule=0.5pt,
    arc=2mm,
    left=2mm,
    right=2mm,
    top=2mm,
    bottom=2mm
  ]
  \renewcommand{\arraystretch}{1.32}%
  \begin{tabular}{@{}|
    >{\bfseries\color{NervBlue}\raggedright\arraybackslash}p{22mm}|
    >{\raggedright\arraybackslash}p{31mm}|
    >{\centering\arraybackslash}p{49mm}|
    >{\centering\arraybackslash}p{49mm}|
    @{}}
  \hline
  \textbf{NT Goal ID}
  & \textbf{Project Goal}
  & \textbf{Success Criteria}
  & \textbf{Value Target} \\
  \hline
}{%
  
  \end{tabular}
  \end{tcolorbox}
  \end{table}
}

\newcommand{\goalrow}[4][]{%
  \stepcounter{nogoal}%
  \ifstrempty{#1}
  {\textbf{NT-N-G\thenogoal}}
  {\textbf{#1}}
  & #2
  & #3
  & #4 \\ \hline
}

% -----------------------------------------------------------------------------
% Deliverables table
% -----------------------------------------------------------------------------
\newenvironment{deliverablestable}{%
  \begin{table}[H]
  \centering
  \caption{Key Deliverables}
  \begin{tcolorbox}[
    colback=white,
    colframe=NervMist,
    boxrule=0.5pt,
    arc=2mm,
    left=2mm,
    right=2mm,
    top=2mm,
    bottom=2mm
  ]
  \renewcommand{\arraystretch}{1.32}%
  \setlength{\tabcolsep}{1.5mm}%
  \begin{tabular}{@{}|
    >{\bfseries\color{NervBlue}\raggedright\arraybackslash}p{21mm}|
    >{\raggedright\arraybackslash}p{33mm}|
    >{\centering\arraybackslash}p{57mm}|
    >{\centering\arraybackslash}p{24mm}|
    @{}}
  \hline
  \textbf{Deliverable ID}
  & \textbf{Deliverable}
  & \textbf{Description}
  & \textbf{Deadline} \\
  \hline
}{%
  \end{tabular}
  \end{tcolorbox}
  \end{table}
}

\newcommand{\deliverablerow}[4]{%
  \textbf{#1}
  & #2
  & #3
  & #4 \\ \hline
}

% ----------------------------------------------------------------------------- Summary
% helper -----------------------------------------------------------------------------
\newcommand{\projectsnapshot}[4]{%
  \begin{tcolorbox}[colback=NervBlack,colframe=NervBlack,arc=2mm,boxrule=0pt,left=4mm,right=4mm,top=3mm,bottom=3mm]
    {\color{white}\textbf{Project Snapshot}}\par\vspace{2mm}
    \begin{tabularx}{\textwidth}{@{}L{31mm}Y@{}}
      {\color{NervCyan}\textbf{What it is}}                                               & {\color{white}#1} \\
      {\color{NervCyan}\textbf{Why it matters}}      & {\color{white}#2} \\
      {\color{NervCyan}\textbf{Current stage}}       & {\color{white}#3} \\
      {\color{NervCyan}\textbf{Next visible result}} & {\color{white}#4} \\
    \end{tabularx}
  \end{tcolorbox}
}

% End of class
