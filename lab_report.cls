\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lab_report}[Hiro's Lab Course Class]
\LoadClass{scrartcl}

\RequirePackage{siunitx} % Provides the \SI{}{} and \si{} command for typesetting SI units
\RequirePackage{graphicx} % Required for the inclusion of images
\RequirePackage{natbib} % Required to change bibliography style to APA
\RequirePackage{amsmath} % Required for some math elements
\RequirePackage{physics}%
\RequirePackage{float}%
\RequirePackage{kvoptions}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{calc}
\RequirePackage{fncylab}
\RequirePackage[automark,headsepline]{scrpage2}
\KOMAoptions{DIV=14}

\labelformat{section}{section #1}
\labelformat{figure}{figure #1}
\labelformat{table}{table #1}

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
    Date Performed: & \lab@coursedate\\%
    Partner(s): & \lab@partner\\%
    Room/Seat: & \lab@room\\%

    \ifx\lab@group \empty\else
    Group: & \lab@group\\
    \fi
    Supervisor(s): & \lab@supervisor\\%
  \end{tabular}%
\end{center}%
\tableofcontents
\end{titlepage}
}


\newlength{\conditionwd}
\newenvironment{conditions}[1][where:]
  {%
   #1\tabularx{\textwidth-\widthof{#1}}[t]{
     >{\(}l<{\)} @{${}-\quad{}$} X@{}
   }%
  }
  {\endtabularx\\[\belowdisplayskip]}
