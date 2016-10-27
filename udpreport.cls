% udpreport.cls
% Article for the UDP documents
% Adin Ramirez adin.ramirez (at) mail.udp.cl modified by Jorge Aguirre
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{udpreport} [2014/04/09 v0.01 Report for the UDP courses]


% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.udp" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.udp}{}{
%
\PassOptionsToClass{\CurrentOption}{book}}}
% --- Class structure: execution of options part
% ---
\ProcessOptions \relax
% --- Class structure: declaration of options part
% ---
\LoadClass[oneside]{book}

% Page layout
\RequirePackage[left=2.5cm,right=2.5cm,top=2cm,bottom=2cm]{geometry}

% For using the empty verification
\RequirePackage{etoolbox}

% For custom table of contents
\RequirePackage{tocbibind}
\RequirePackage{titlesec}
\RequirePackage{longtable}
\RequirePackage[titles]{tocloft}
\renewcommand\cftchapfont{\normalfont}
\renewcommand\cftchappagefont{\normalfont}

\titleformat{\chapter}[display]
{}{\hfill\rule{.9\textwidth}{3pt}}{0pt}
{\hspace*{.1\textwidth}\huge\bfseries}[\addvspace{-1pt}]
\titleformat{name=\chapter,numberless}[display]
{}{\hfill\rule{.9\textwidth}{3pt}}{0pt}
{\hspace*{.1\textwidth}\huge\bfseries}[\addvspace{1pt}]


% Headers and footers
\RequirePackage{fancyhdr}
\fancypagestyle{firstpage}{
%
\fancyhf{}
% clear all six fields
\fancyhead[L]{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{
%
\fancyhf{}
% clear all six fields
\fancyhead[L]{\@headertext}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0.7pt}
\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}

\let\ps@plain\ps@firstpage% add this because maketitle triggers a \thispagestyle{plain}

% Set the spanish system (ironically, the comments are in english, but.. who cares)
\RequirePackage[spanish,es-lcroman,es-tabla]{babel}
\decimalpoint% changes the coma in the numbers to period
\RequirePackage[utf8]{inputenc}
\RequirePackage{csquotes}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{float}
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{tikz}
\RequirePackage{natbib}
\RequirePackage{enumerate}

%% Definitions and commands
\newcommand*{\authors}[1]{\def\@authornames{#1}}
\newcommand*{\setprofessor}[1]{\def\@profname{#1}}
\newcommand*{\setassistant}[1]{\def\@assistname{#1}}
\newcommand*{\setuniversity}[1]{\def\@univname{#1}}
\newcommand*{\setfaculty}[1]{\def\@facname{#1}}
\newcommand*{\setdepartment}[1]{\def\@deptname{#1}}
\newcommand{\course}[2]{\ifstrempty{#1}{\def\@coursecode{#2}}{\def\@coursecode{#1}}\def\@coursename{#2}}
\newcommand*{\setcourse}[1]{\def\@coursename{#1}}
\newcommand*{\setcoursecode}[1]{\def\@coursecode{#1}}
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} % Defines a new command for the horizontal lines, change thickness here
\authors{}
\setprofessor{}
\setassistant{}
\setcourse{}
\setuniversity {}
\setfaculty {}
\setdepartment { }

% custom section and subsection 
\titlespacing*{\section}
{0pt}{6.5ex plus 1ex minus .2ex}{.4ex}


% Contains all the udp logos and other stuff
\RequirePackage{udp}

% Set header text for following pages
\def\@headertext{
  \ifdefempty{\@title}{}{\@title}
  {-   \nouppercase{\leftmark}}
}
\let\headertext\setheadertext
\renewcommand{\chaptername}{}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

\newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}
        \setlength{\parskip}{0pt}
        \ifdefempty{\@univname}{}{\normalsize \@univname \par}
        \bigskip
        {\huge{\textit \abstractname } \par}
        \bigskip
        \ifdefempty{\@facname}{}{\normalsize \@facname \par}
        \ifdefempty{\@deptname}{}{\normalsize \@deptname \par}
        \bigskip
        {\normalsize\bf \@title \par}
        \medskip
        {\normalsize por \ifdefempty{\@authornames}{\@author}{\@authornames}}
        \bigskip
      \end{center}}%
     {\par\vfil\null\endtitlepage}

  

\def\@myfooter{%
\ifdefempty{\@logo}{}{%ifnotempty
\begin{minipage}{\@logosz}
\@logo
\end{minipage}%
}%ifnotmtarg
}%end \@myfooter

% Re-define the title
\renewcommand\maketitle {
  \begin{titlepage}
  \thispagestyle{firstpage}
  \let \footnote \thanks
  \let \footnotesize \small
  \let \footnoterule \relax
  \setcounter{footnote}{0}
  \null\vfil
  \vskip 60\p@
  \center    % center all page
  
  \ifdefempty{\@univname}{}{\textsc{\LARGE \@univname }  \vskip 3.5em }
  \ifdefempty{\@facname}{}{\textsc{\Large \@facname  }  \vskip 1.2em }
  \ifdefempty{\@deptname}{}{\textsc{\large \@deptname }  \vskip 1.2em }
  \ifdefempty{\@coursename}{}{\textbf{\large \@coursename} \vskip .8em  }
  \ifdefempty{\@coursecode}{}{\textsc{\large \@coursecode} \vskip 2.4em }% header text such as course name
  
  \hrule height \z@        % to avoid the insertion of lineskip glue
  \HRule \vskip 0.94em
    { \huge \bfseries \@title } \vskip 0.94em % Title of your document
  \HRule \vskip 7em        % <--- modify this to adjust the separation
  
  % authors section
  \begin{minipage}{0.4\textwidth}
    \begin{flushleft}
      \ifdefempty{\@authornames} {%ifempty  
        \large \emph{Autor:} \\ \@author }{%ifnotempty
        \large \emph{Autores:} \\  \@authornames }
    \end{flushleft}
  \end{minipage}
  \begin{minipage}{0.4\textwidth}
    \begin{flushright}
      \ifdefempty{\@profname} {}{%ifempty  
        \large \emph{Profesor:} \\ \@profname } \\
      \ifdefempty{\@assistname}{}{%ifnotempty
        \large \emph{Ayudante:} \\  \@assistname } \\
    \end{flushright}
  \end{minipage}
  \vskip 9.5em
  {\large \today \par} %  <---- change the \today to a set date if you want to be precise
  \vskip 2em  
  \@myfooter
  \vfill
  \end{titlepage}
}

% Set paragraph skip height
\setlength{\parskip}{0.8ex}

\newcommand{\slice}[4]{
  \pgfmathparse{0.5*#1+0.5*#2}
  \let\midangle\pgfmathresult

  % slice
  \draw[thick,fill=black!10] (0,0) -- (#1:1) arc (#1:#2:1) -- cycle;

  % outer label
  \node[label=\midangle:#4] at (\midangle:1) {};

  % inner label
  \pgfmathparse{min((#2-#1-10)/110*(-0.3),0)}
  \let\temp\pgfmathresult
  \pgfmathparse{max(\temp,-0.5) + 0.8}
  \let\innerpos\pgfmathresult
  \node at (\midangle:\innerpos) {#3};
}

\RequirePackage{booktabs}