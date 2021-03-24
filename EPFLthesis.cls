\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{EPFLthesis}[2019/07/22 LaTeX template for EPFL thesis]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

\newcommand*{\department}[1]{\gdef\@department{#1}%
}
\newcommand*{\@department}{\texttt{\string\department} currently not set. Please fix this.}

\newcommand*{\edoc}[1]{\gdef\@edoc{#1}%
}
\newcommand*{\@edoc}{\texttt{\string\edoc} currently not set. Please fix this.}

\newcommand*{\laboratory}[1]{\gdef\@laboratory{#1}%
}
\newcommand*{\@laboratory}{\texttt{\string\laboratory} currently not set. Please fix this.}

\newcommand*{\jury}[1]{\gdef\@jury{#1}%
}
\newcommand*{\@jury}{\texttt{\string\jury} currently not set. Please fix this.}

\newcommand*{\thesisno}[1]{\gdef\@thesisno{#1}%
}
\newcommand*{\@thesisno}{1234}

\newcommand*{\oraldate}[1]{\gdef\@oraldate{#1}%
}
\newcommand*{\@oraldate}{\today}

\newcommand*{\@epicoremp}[1]{\begin{minipage}{\epigraphwidth}#1\end{minipage}}

\RequirePackage{geometry}

\newdimen\myleftmargin
\newdimen\myrightmargin
\setlength{\myleftmargin}{37mm}
\setlength{\myrightmargin}{26.2mm}
\geometry{paper=a4paper, right=\myrightmargin, left=\myleftmargin, top=23.2mm, includeheadfoot,bottom=29.5mm, headheight=14pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{setspace} % increase interline spacing slightly
\setstretch{1.1}


\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{colortbl}

\definecolor{rouge}{rgb}{1,0,0}
\definecolor{groseille}{RGB}{181,31,31}
\definecolor{leman}{RGB}{0,167,159}
\definecolor{canard}{RGB}{0,116,128}
\definecolor{ardoise}{RGB}{65,61,58}
\definecolor{perle}{RGB}{202,199,199}
\def\setrulec@lor{\color{rouge}}
\newlength\l@goheight\l@goheight=8mm
\newlength\l@gowidth\l@gowidth=3.4402778\l@goheight

\RequirePackage{notoccite}

%% TITLE PAGE %%
\renewcommand*{\maketitle}{%
\newgeometry{vmargin=26.2mm,hmargin=22mm}
\begin{titlepage}
\begin{otherlanguage}{french}
\sffamily

{\includegraphics[height=\l@goheight]{images/EPFLlogo}}

\begin{flushright}

\parbox{\textwidth - \l@gowidth}{%
\vspace{1.5cm}%
\begin{flushleft}
  \huge\foreignlanguage{english}{\@title}
\end{flushleft}
\vspace{2cm}
\textcolor{gray}{\small{THIS IS A TEMPORARY TITLE PAGE \\ It will be replaced for the final print by a version provided by the registrar's office.}}
\vspace{3cm}

    Thèse n. \@thesisno\\
    présentée le \@oraldate\\[12pt]
    à la \@department\\
    \@laboratory\\
    \@edoc\\[6pt]
    pour l'obtention du grade de Docteur ès Sciences par\\ [12pt]
    {\Large\@author}\\[9pt]
%
\small
acceptée sur proposition du jury:\\[8pt]
%
\@jury\\[18pt]
}
\end{flushright}
\vspace{2.5cm}
\makebox[0pt][r]{\setrulec@lor\rule{6.5pt}{5.6pt}\hspace*{5.6pt}}%
\includegraphics[viewport=5 176 337 221, width=0.596\l@gowidth]{images/EPFLcorp}
\end{otherlanguage}
\end{titlepage}
\restoregeometry
}

%%%% PAGE HEADERS %%%%

%\RequirePackage{fancyhdr}


\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{amsthm}


\makeatletter
\let\oldfrontmatter\frontmatter
\renewcommand\frontmatter{%
\oldfrontmatter
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}}%(needs to be before titlepage and frontmatter to keep the table of contents lists short)
% space before each new paragraph according to the template guidelines.
%(needs to be after titlepage and frontmatter to keep the table of contents lists short)
\let\oldmainmatter\mainmatter
\renewcommand\mainmatter{%
\oldmainmatter
\setlength{\parskip}{1em}}
\makeatother


\makeatletter
\renewcommand\@pnumwidth{20pt}
\makeatother

%%%%% CHAPTER HEADER %%%%
\RequirePackage{tikz}
\RequirePackage{sectsty}
\RequirePackage[clearempty,pagestyles]{titlesec}

\newcommand*\chapterlabel{}
\newcommand*{\chapnumfont}{%
\fontsize{80}{96}\selectfont%
\rmfamily\color{white}}

\allsectionsfont{\sffamily}

\titleformat{\chapter}[display]%
  {\sffamily\bfseries\Huge}%
  {\raggedleft%
    \begin{tikzpicture}[remember picture, overlay]
      \node[yshift=-6.14cm,xshift=-31.5mm] at (current page.north east) {
        \begin{tikzpicture}[remember picture, overlay]
          \filldraw[rouge] (0,0) rectangle(31.5mm,27mm) node[pos=0.5] {\chapnumfont\thechapter};
        \end{tikzpicture}%
      };
    \end{tikzpicture}}
  {0pt}{\raggedleft}

\titlespacing*{name=\chapter,numberless}{-3.7cm}{83.2pt-\parskip}{3.2pt+\parskip}
\titlespacing*{\chapter}{-3.7cm}{50pt-\parskip-\parskip}{30pt+\parskip+\parskip}
\titlespacing*{\section}{0pt}{13.2pt}{1em-\parskip}  % 13.2pt is line spacing for a text with 11pt font size
\titlespacing*{\subsection}{0pt}{13.2pt}{1em-\parskip}
\titlespacing*{\subsubsection}{0pt}{13.2pt}{1em-\parskip}
\titlespacing*{\paragraph}{0pt}{13.2pt}{1em-\parskip}

% \assignpagestyle{\chapter}{plain}

\newpagestyle{main}[\small]{
  \headrule
  \sethead[][][\bfseries \thesection~\sectiontitle]
          {\bfseries \ifthechapter{Chapter~\thechapter.~\chaptertitle}{\chaptertitle}}{}{}
  \setfoot[\thepage][][]{}{}{\thepage}
}
\pagestyle{main}

\newpagestyle{addpagenumbersforpdfimports}[\small]{
  \headrule
  \setfoot[\thepage][][]
          {}{}{\thepage}
}

\renewpagestyle{plain}[\small]{
  \setfoot[\thepage][][]
          {}{}{\thepage}
}

%%%% ABSTRACT ENV %%%

\RequirePackage{xstring}
\DeclareRobustCommand{\abstracttitle}[1]{%
    \IfEqCase{#1}{%
        {english}{Abstract}%
        {french}{Résumé}%
        {german}{Zusammenfassung}%
        % you can add more cases here as desired
    }[\PackageError{abstracttitle}{Undefined option to abstracttitle: #1}{}]%
}

\newcounter{numabstracts}

\newenvironment{abstract}[1][english]
  {\begin{otherlanguage}{#1}
    \cleardoublepage
    \chapter*{\abstracttitle{#1}}
    \ifnum\value{numabstracts} = 0%
    \addcontentsline{toc}{chapter}{Abstract (English/Français)}%
    \fi\stepcounter{numabstracts}
    \setlength{\parskip}{1em}}
  {\end{otherlanguage}\ignorespacesafterend}


\newenvironment{dedication}
  {\cleardoublepage\thispagestyle{empty}}
  {\setcounter{page}{0}\ignorespacesafterend}

\endinput
