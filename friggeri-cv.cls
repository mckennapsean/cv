\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% command for pandoc's lists
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% make regular lists use triangles instead
\renewcommand{\labelitemi}{\raise .5ex\hbox{\tiny$\blacktriangleright$}}
\renewcommand{\labelitemii}{\raise .5ex\hbox{\tiny$\blacktriangleright$}}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{555555}
\definecolor{pink}{HTML}{FA44AA}
\definecolor{darkpurple}{HTML}{674B8C}

\colorlet{fillheader}{gray}
\colorlet{header}{white}
\colorlet{textcolor}{black}
\colorlet{headercolor}{pink}
\colorlet{boldcolor}{darkpurple}
\colorlet{accentcolor}{pink}


%%%%%%%%%
% Fonts %
%%%%%%%%%

%%% modified (friggeri-cv) by Sean McKenna for own use
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont[]{Source Sans Pro}
\newfontfamily\thinfont[]{Source Sans Pro ExtraLight}
\newfontfamily\boldfont[]{Source Sans Pro Semibold}
\newfontfamily\titlefont[]{Lora}
\newfontfamily\headingfont[]{Lora Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Source Sans Pro ExtraLight}
\setmathfont{Source Code Pro}



%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=0.89\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=west] (name) at (0,1) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\titlefont #1}
    };
    \node [anchor=west, xshift=0.1cm] at (0,0) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #2%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par%\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    #1
    \begingroup
      \color{lightgray}
      \hrule width \linewidth height 0.35mm
    \endgroup
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \setlength{\parindent}{0.15in}
  \par
  % \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{lightgray} #1%
  }
  % \par\vspace{.25\parskip}%
  \setlength{\parindent}{0in}
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}

%% fix for list environment to avoid awkward page jumps
%% from: http://tex.stackexchange.com/questions/242194/
\usepackage{enumitem}
\newenvironment{entrylist}{%
  \begin{itemize}[noitemsep, leftmargin=0.35in]%[leftmargin=*,align=left,itemindent=-\dimexpr\labelwidth+\labelindent+\labelsep\relax]
}{%
  \end{itemize}
}

\renewcommand{\bfseries}{\boldfont\color{boldcolor}}
\newcommand{\entry}[4]{%
  \item[]
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #1}\\%
    #4%
    \hfill%
    \vspace{\parsep}%
  }
\newcommand{\entryalt}[3]{%
  \item[]
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #1}%
    \vspace{\parsep}%
  }
\newcommand{\entrypub}[2]{
  \vspace{-0.05in}
  \item[]
    \textbf{#1}
    \hfill
    {\footnotesize\addfontfeature{Color=lightgray} #2}\\%
    % \vspace{\parsep}%
}
\newcommand{\entryitem}[2]{
  \item #1 \hfill
  {\footnotesize\addfontfeature{Color=lightgray} #2}
}

% old list environment
% \newenvironment{entrylist}{%
%   \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
% }{%
%   \end{tabular*}
% }



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

% \RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[left=1in,top=1in,right=1in,bottom=1in,nohead,nofoot]{geometry}
\RequirePackage{hyperref}