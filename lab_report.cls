\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lab_report}[Hiro's Lab Course Class]
\LoadClass{scrartcl}

\RequirePackage{siunitx} % Provides the \SI{}{} and \si{} command for typesetting SI units
\RequirePackage{graphicx} % Required for the inclusion of images
\RequirePackage[style=phys,backend=biber]{biblatex}
\RequirePackage{amsmath} % Required for some math elements
\RequirePackage{physics}%
\RequirePackage{float}%
\RequirePackage{kvoptions}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{calc}
\RequirePackage{hyperref}
\RequirePackage{iflang}
\RequirePackage{fixltx2e}
\RequirePackage{csquotes}
\RequirePackage{fncylab}
\RequirePackage[table]{xcolor}
\RequirePackage[automark,headsepline]{scrpage2}
\KOMAoptions{DIV=14}

\labelformat{section}{\IfLanguageName{ngerman}{Kapitel #1}{section #1}}
\labelformat{figure}{\IfLanguageName{ngerman}{Abbildung #1}{Figure #1}}
\labelformat{table}{\IfLanguageName{ngerman}{Tabelle #1}{table #1}}

\sisetup{separate-uncertainty = true}
\hypersetup{
    colorlinks,
    linkcolor={blue!50!black},
    citecolor={red!50!black},
    urlcolor={green!80!black}
}
\newcolumntype{L}{>{\(}l<{\)}} % math-mode version of "l" column type
\newcommand{\headsection}{\leftmark}
\newcommand{\ifset}[2]{\ifx {#1} \empty\else\ {#2}\fi}
\deftripstyle{pagestyle}
  [0.3pt]
  [0.3pt]
  {\pagemark}
  {}
  {\headsection}
  {\@title\ifset{\lab@slug}{(\lab@slug)}}
  {\@author}
  {\pagemark}
\pagestyle{pagestyle}
\setlength\parindent{0pt} % Removes all indentation from paragraphs

\SetupKeyvalOptions{family=lab,prefix=lab@}

\DeclareStringOption{slug}
\DeclareStringOption{partner}
\DeclareStringOption{supervisor}
\DeclareStringOption{room}
\DeclareStringOption[\today]{coursedate}
\DeclareStringOption{group}
\ProcessKeyvalOptions*

\renewcommand*{\@date}{\today}

\renewcommand*{\maketitle}{%
\begin{titlepage}
\centering
{\huge\bfseries\@title\unskip\strut\par}
{\noindent\rule{2cm}{0.4pt}\par}
{\scshape\Large\lab@slug\unskip\strut\par}
\vspace{2cm}
{\Large\itshape\@author\unskip\strut\par}
{\large \@date\par}
\begin{center}%
  \begin{tabular}{l r}%
    \IfLanguageName{ngerman}{Datum der Durchf\"uhrung}{Date Performed}: & \lab@coursedate\\%
    \ifx\lab@partner \empty\else
    \IfLanguageName{ngerman}{Partner}{Partner(s)}: & \lab@partner\\%
    \fi
    \IfLanguageName{ngerman}{Ort}{Location}: & \lab@room\\%

    \ifx\lab@group \empty\else
    \IfLanguageName{ngerman}{Gruppe}{Group}: & \lab@group\\
    \fi
    \IfLanguageName{ngerman}{Betreuer}{Supervisor(s)}: & \lab@supervisor\\%
  \end{tabular}%
\end{center}%
\tableofcontents
\end{titlepage}
}

\newcommand*{\rom}[1]{\expandafter\@slowromancap\romannumeral #1@}
\newlength{\conditionwd}
\newenvironment{conditions}[1][\IfLanguageName{ngerman}{Wobei}{Where}:]
  {%
   #1\tabularx{\textwidth-\widthof{#1}}[t]{
     >{\(}r<{\)} @{${}\quad-\quad{}$} l@{}
   }%
  }
  {\endtabularx\\[\belowdisplayskip]}
