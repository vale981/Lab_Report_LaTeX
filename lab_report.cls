\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lab_report}[Hiro's Lab Course Class]
\LoadClass{scrartcl}

\RequirePackage[version=3]{mhchem} % Package for chemical equation typesetting
\RequirePackage{siunitx} % Provides the \SI{}{} and \si{} command for typesetting SI units
\RequirePackage{graphicx} % Required for the inclusion of images
\RequirePackage{natbib} % Required to change bibliography style to APA
\RequirePackage{amsmath} % Required for some math elements
\RequirePackage{xkeyval}%
\RequirePackage{physics}%
\RequirePackage{float}%
\RequirePackage[automark,headsepline]{scrpage2}
\KOMAoptions{DIV=14}

\newcommand{\headsection}{\leftmark}

\deftripstyle{pagestyle}
  [0.3pt]
  [0.3pt]
  {\pagemark}
  {}
  {\headsection}
  {\pagemark}
  {\@author}
  {\@title\ifx\slug\empty\else\ (\slug)\fi}
\pagestyle{pagestyle}
\setlength\parindent{0pt} % Removes all indentation from paragraphs

\renewcommand{\labelenumi}{\alph{enumi}.} % Make numbering in the enumerate environment by letter rather than number (e.g. section 6)

\define@key{lab_report.cls}{course}[]{%
  \def\course{#1}
}

\define@key{lab_report.cls}{slug}[]{%
  \def\slug{#1}
}

\define@key{lab_report.cls}{partner}[]{%
  \def\partner{#1}
}
\define@key{lab_report.cls}{supervisor}[]{%
  \def\supervisor{#1}
}
\define@key{lab_report.cls}{room}[]{%
  \def\room{#1}
}

\define@key{lab_report.cls}{coursedate}[\today]{%
  \def\coursedate{#1}
}

\define@key{lab_report.cls}{group}[]{%
  \def\group{#1}
}

\ExecuteOptionsX{course, slug, partner, supervisor, room, coursedate, group}
\ProcessOptionsX%

\renewcommand*{\@date}{\today}

\renewcommand*{\maketitle}{%
\begin{titlepage}
\centering
{\huge\bfseries\@title\unskip\strut\par}
{\noindent\rule{2cm}{0.4pt}\par}
{\scshape\Large\slug\unskip\strut\par}
\vspace{2cm}
{\Large\itshape\@author\unskip\strut\par}
{\large \@date\par}
\begin{center}%
  \begin{tabular}{l r}%
    Date Performed: & \coursedate\\%
    Partner(s): & \partner\\%
    {\ifx\group\empty\else\ (Group & \group\\)\fi}%
    Room/Seat: & \room\\%
    Instructor(s): & \supervisor\\%
  \end{tabular}%
\end{center}%
\tableofcontents
\end{titlepage}
}
