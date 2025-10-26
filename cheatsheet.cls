% MIT License

% Copyright (c) 2023  Micha Bosshart

% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

% Author: % Micha Bosshart - bmicha@ethz.ch

% https://github.com/LaTeX-Template-Share

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}[2023/10/20 LaTeX class for cheatsheets by Micha Bosshart]
\LoadClass[8pt, a4paper, landscape]{extarticle}

%% packages
\RequirePackage{multicol}
\RequirePackage{amsmath}
\RequirePackage{changepage}
\RequirePackage{etoolbox} % check ifempty
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{tcolorbox}
\tcbuselibrary{breakable,skins}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{colortbl}
\RequirePackage{multirow}
\RequirePackage{listings}

%% Link to GitHub Repo
\RequirePackage[hidelinks,
  pdftex,
  pdfauthor={Colin Mettler},
  pdftitle={https://github.com/CoMet147/cheatsheet_template},
]{hyperref}


%% options
% optionslist [onecolumn, twocolumn, threecolumn, numerate]
\newcommand{\@@colnum}{4} % default number of columns
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{twocolumns}{\def\@@colnum{2}}
\DeclareOption{threecolumns}{\def\@@colnum{3}}
\setcounter{secnumdepth}{3} % enable counting
\DeclareOption{nonumbering}{\setcounter{secnumdepth}{0}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

%% Colors
\definecolor{ThemeDarkBlue}{HTML}{0a0f1a}
\definecolor{ThemeLightBlue}{HTML}{1a1f2e}
\definecolor{FormulaBG}{HTML}{e8f4fd}
\definecolor{BorderBlue}{HTML}{4b91e2}

%% Header
\def\@doctitle{}
\long\def\doctitle#1{\def\@doctitle{#1}}
\def\@docauthor{}
\long\def\author#1{\def\@docauthor{#1}}
\def\@docversion{}
\long\def\docversion#1{\def\@docversion{#1}}

%% text margin for left and right
\def\@@leftTextMargin{1mm}
\def\@@rightTextMargin{1mm}

%% begin and end document
\AtBeginDocument{%
    \begin{multicols*}{\@@colnum}%
    \begin{adjustwidth}{\@@leftTextMargin}{\@@rightTextMargin}%
    \Header{\@doctitle}{\@docauthor}{\@docversion}
    \small%
}
\AtEndDocument{%
    \end{adjustwidth}%
    \end{multicols*}%
}

%% SECTION
\newcommand*{\sectionbox}[1]{%
    \begin{adjustwidth}{-\@@leftTextMargin}{-\@@rightTextMargin}
        \begin{tcolorbox}[%
                        arc=0mm,%
                        colback=ThemeLightBlue,%
                        boxrule=0pt,%
                        valign=center,%
                        height from=5mm to 5cm,%
                        top=0mm,%
                        bottom=0mm,%
                        left=0.2mm,%
                        right=0.2mm,%
                        after skip = 0.01mm,%
                        before skip = 0.01mm,%
                        fontupper=\color{white}%
                        ]%
                        \textbf{#1}%
        \end{tcolorbox}%
    \end{adjustwidth}
}%
\renewcommand\section{\@startsection%
                            {section}% name
                            {1}% level
                            {\z@}% indent
                            {0.1mm}% space before
                            {0.1mm}% space after
                            {\normalsize\sectionbox}% function which automaticaly gets the section argument
}

%% SUBSECTION
\newcommand*{\subsectionbox}[1]{%
    \begin{adjustwidth}{-\@@leftTextMargin}{-\@@rightTextMargin}
        \begin{tcolorbox}[%
                        arc=0mm,%
                        colback=ThemeLightBlue,%
                        boxrule=0pt,%
                        valign=center,%
                        height from=5mm to 5cm,%
                        top=0mm,%
                        bottom=0mm,%
                        left=0.2mm,%
                        right=0.2mm,%
                        after skip = 0.01mm,%
                        before skip = 0.01mm,%
                        fontupper=\color{white}%
                        ]%
                        \textbf{#1}%
        \end{tcolorbox}%
    \end{adjustwidth}%
}
\renewcommand\subsection{\@startsection%
                            {subsection}% name
                            {2}% level
                            {\z@}% indent
                            {0.1mm}% space before
                            {0.1mm}% space after
                            {\normalsize\subsectionbox}%
}

%% SUBSUBSECTION
\newcommand*{\subsubsectionbox}[1]{%
    \begin{adjustwidth}{-\@@leftTextMargin}{-\@@rightTextMargin}
        \begin{tcolorbox}[%
                        arc=0mm,% corner radius
                        colback=ThemeLightBlue,%
                        boxrule=0pt,% border box
                        valign=center,% vertically center title
                        height from=5mm to 5cm,%
                        top=0mm,%
                        bottom=0mm,%
                        left=0.2mm,%
                        right=0.2mm,%
                        after skip = 0.01mm,%
                        before skip = 0.01mm,%
                        fontupper=\color{white}%
                        ]%
                        \textbf{#1}%
        \end{tcolorbox}%
    \end{adjustwidth}%
}
\renewcommand\subsubsection{\@startsection%
                            {subsubsection}% name
                            {3}% level
                            {\z@}% indent
                            {0.1mm}% space before
                            {0.1mm}% space after
                            {\normalsize\subsubsectionbox}%
}

%% HEADER
\newcommand{\Header}[4][]{%
    \begin{adjustwidth}{-\@@leftTextMargin}{-\@@rightTextMargin}
        \begin{tcolorbox}[%
            arc=0mm,%
            colframe=ThemeDarkBlue,%
            colback=ThemeDarkBlue,%
            boxrule=0pt,%
            toptitle=1mm,%
            bottomtitle=-1mm,%
            right=0mm,%
            left=0mm,%
            fontupper=\color{white},%
            after skip = 0.01mm,%
            top=0mm,%
            bottom=0mm,%
            title= \huge \center \textbf{#2} \ifstrempty{#4}{}{\small\ #4} \par%
            \ifstrempty{#3}{}{
                \center \normalsize \vskip 0mm #3 %
            }
        ]%
        \end{tcolorbox}%
    \end{adjustwidth}
}


%% Box for highlighting formulas
\newtcolorbox{formulabox}{
    breakable,
    colback=FormulaBG,
    colframe=BorderBlue,
    arc=0mm,
    boxrule=0.3mm,
    left=2pt, right=2pt, top=1pt, bottom=1pt,
    halign=center
}

%% Box for topics
\newtcolorbox{topicbox}[1]{
    enhanced,
    breakable,
    colback=White,
    colframe=ThemeLightBlue,
    boxrule=1pt,
    arc=0mm,
    boxsep=2pt,
    top=7pt, bottom=1pt, left=2pt, right=2pt,
    title=#1,
    fonttitle=\bfseries,
    colbacktitle=ThemeLightBlue,
    coltitle=White,
    attach boxed title to top left={yshift=-0.25cm, xshift=0.25cm},
    boxed title style={arc=0mm, top=0pt, bottom=-1pt, left=-1pt, right=-1pt,},
    before skip=0mm,
    after skip=0mm
}

%% Box for side-by-side content
\newtcolorbox{sidebysidebox}[1]{
    enhanced,
    breakable,
    colback=White,
    colframe=ThemeLightBlue,
    boxrule=1pt,
    arc=0mm,
    boxsep=2pt,
    top=7pt, bottom=1pt, left=2pt, right=2pt,
    title=#1,
    fonttitle=\bfseries,
    colbacktitle=ThemeLightBlue,
    coltitle=White,
    attach boxed title to top left={yshift=-0.25cm, xshift=0.25cm},
    boxed title style={arc=0mm, top=0pt, bottom=-1pt, left=-1pt, right=-1pt,},
    before skip=0mm,
    after skip=0mm,
    sidebyside,
    sidebyside align=top
}


%% MATLAB
% simulates matlab syntax font
\newcommand{\matlab}[1]{%
    \vskip4pt%
    \begin{center}%
        \fontfamily{qcr}\selectfont #1%
    \end{center}%
}

\renewcommand{\normalsize}{\fontsize{8}{9}\selectfont} % changes normalsize to small % dirty
\renewcommand{\familydefault}{\sfdefault}

\setlength{\parindent}{0cm}
\setlength\columnsep{0.5mm}
\setlength{\columnseprule}{0.4pt}
\renewcommand{\columnseprulecolor}{\color{ThemeDarkBlue}}
\raggedcolumns
\setlength{\textwidth}{597pt} % max 597pt
\setlength{\textheight}{845pt} % max 845pt
\usepackage[
    landscape,
    a4paper,
    left=0.2cm,
    right=0.2cm,
    top=0.2cm,
    bottom=0.2cm,
    columnsep=0.2cm
]{geometry}

%% Custom vector and matrix commands
\newcommand{\bvec}[1]{\mathbf{#1}}
\newcommand{\pmat}[1]{\begin{pmatrix}#1\end{pmatrix}}


%% MATHBOX
% PRE: #1 math expression
% POST: typeset math expression in a box
\newtcolorbox{mathbox}[1][]{%
    enhanced,
    breakable,
    colback=white,
    colframe=black,
    boxrule=0.5mm,
    arc=0mm,
    top=2pt, bottom=2pt, left=2pt, right=2pt,
    before skip=0mm,
    after skip=0mm,
    #1
}