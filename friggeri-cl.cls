\ProvidesClass{friggeri-cl}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{letter}%
}
\ProcessOptions\relax
\LoadClass{letter}

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
\newfontfamily\regfont[]{Source Sans Pro Light}
\newfontfamily\boldfont[]{Source Sans Pro Semibold}
\newfontfamily\titlefont[]{Lora}
\newfontfamily\headingfont[]{Lora Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Source Sans Pro Light}
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

\newcommand{\header}[6]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=0.89\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=west, xshift=-3.5in] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\titlefont #1}
    };
    \node [anchor=west, xshift=-3.5in, yshift=-30pt] at (box) {%
      \fontsize{14pt}{24pt}\color{header}%
      \regfont #2%
    };
    \node [anchor=east, xshift=3.5in, yshift=12pt] at(box){
      \fontsize{10pt}{14pt}\color{header} \regfont #3
    };
    \node [anchor=east, xshift=3.5in] at(box){
      \fontsize{10pt}{14pt}\color{header} \regfont #4
    };
    \node [anchor=east, xshift=3.5in, yshift=-12pt] at(box){
      \fontsize{10pt}{14pt}\color{header} \regfont #5
    };
    \node [anchor=east, xshift=3.5in, yshift=-24pt] at(box){
      \fontsize{10pt}{14pt}\color{header} \regfont #6
    };
  \end{tikzpicture}
}

% Shrink the space between the closing signature
\makeatletter
\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}
  \stopbreaks
  \noindent
  \ifx\@empty\fromaddress\else
  \hspace*{\longindentation}\fi
  \parbox{\indentedwidth}{\raggedright
    \ignorespaces #1\\[2\medskipamount]
    \ifx\@empty\fromsig
      \fromname
    \else \fromsig \fi\strut}
  \par}
\makeatother

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

% \RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[left=1in,top=1in,right=1in,bottom=1in,nohead,nofoot]{geometry}
\RequirePackage{hyperref}