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

\definecolor{white}{RGB}{255,255,255}
\definecolor{black}{HTML}{000000}

\definecolor{darkgray}{HTML}{333333}
% \definecolor{darkgray}{HTML}{2C3236}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{555555}
% \definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pink}{HTML}{FA44AA}
\definecolor{darkpurple}{HTML}{674B8C}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  % \colorlet{fillheader}{darkgray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{black}
\colorlet{headercolor}{pink}
\colorlet{boldcolor}{darkpurple}
\colorlet{accentcolor}{pink}


%%%%%%%%%
% Fonts %
%%%%%%%%%

%%% modified by Sean McKenna for own use
\RequirePackage[quiet]{fontspec}
% \RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont[]{Source Sans Pro}
\newfontfamily\thinfont[]{Source Sans Pro ExtraLight}
\newfontfamily\boldfont[]{Source Sans Pro Semibold}
\newfontfamily\titlefont[]{Lora}
\newfontfamily\headingfont[]{Lora Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Source Sans Pro ExtraLight}

\setmathfont{Source Code Pro}

%%% original friggeri cv
% \newfontfamily\bodyfont[]{Helvetica Neue}
% \newfontfamily\thinfont[]{Helvetica Neue UltraLight}
% \newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
% 
% \defaultfontfeatures{Mapping=tex-text}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}
% 
% \setmathfont{XITS Math}

%%% modified by Karol Kozioł for ShareLaTex use
% \newfontfamily\bodyfont
% [BoldFont=texgyreheros-bold.otf,
% ItalicFont=texgyreheros-italic.otf,
% BoldItalicFont=texgyreheros-bolditalic.otf]
% {texgyreheros-regular.otf}
% \newfontfamily\thinfont[]{Lato-Light.ttf}
% \newfontfamily\headingfont[]{texgyreheros-bold.otf}

% \defaultfontfeatures{Mapping=tex-text}
% \setmainfont
% [Mapping=tex-text, Color=textcolor,
% BoldFont=texgyreheros-bold.otf,
% ItalicFont=texgyreheros-italic.otf,
% BoldItalicFont=texgyreheros-bolditalic.otf
% ]
% {texgyreheros-regular.otf}

% \setmathfont{texgyreheros-regular.otf}


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
    \node [anchor=west,
      xshift = 3cm
    ] (name) at (0,1) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\titlefont #1}
    };
    \node [anchor=west,
      xshift = 3.1cm
    ] at (0,0) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #2%
    };
    \node[circle,draw=darkpurple,
      minimum width=2.8cm,
      line width=0.5mm,
      yshift=0.9cm,
      xshift=1.2cm,
      path picture={
        \node at (path picture bounding box.center){
          \includegraphics[width=2.8cm]{profile}
        };
    }]{};
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

% \newcounter{colorCounter}
% \def\@sectioncolor#1#2#3{%
%   {%
%     \color{accentcolor} #1#2#3%
%   }%
%   \stepcounter{colorCounter}%
% }

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

% \renewcommand{\bfseries}{\headingfont\color{headercolor}}
% \newcommand{\entry}[4]{%
%   #1&\parbox[t]{11.8cm}{%
%     \textbf{#2}%
%     \hfill%
%     {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
%     #4\vspace{\parsep}%
%   }\\}



%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

% \RequirePackage[absolute,overlay]{textpos}
% \setlength{\TPHorizModule}{1cm}
% \setlength{\TPVertModule}{1cm}
% \newenvironment{aside}{%
%   \let\oldsection\section
%   \renewcommand{\section}[1]{
%     \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
%   }
%   \begin{textblock}{3.6}(1.5, 4.33)
%   \begin{flushright}
%   \obeycr
% }{%
%   \restorecr
%   \end{flushright}
%   \end{textblock}
%   \let\section\oldsection
% }

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

% \RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

% \DeclareFieldFormat[article]{title}{#1\par}
% \DeclareFieldFormat[inproceedings]{title}{#1\par}
% \DeclareFieldFormat[misc]{title}{#1\par}
% \DeclareFieldFormat[report]{title}{#1\par}

% \DeclareBibliographyDriver{article}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \usebibmacro{journal+issuetitle}%
%     \setunit{\space}%
%     \printfield{pages}%
%     \newunit%
%     \printlist{publisher}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareBibliographyDriver{inproceedings}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}%
%     \printfield{booktitle}%
%     \setunit{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareBibliographyDriver{misc}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printfield{booktitle}%
%     \setunit*{\addcomma\space}%
%     \printfield{note}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareBibliographyDriver{report}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printfield{type}%
%     \setunit{\space}%
%     \printfield{number}%
%     \setunit{\addcomma\space}%
%     \printfield{year}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareNameFormat{author}{%
%   \nameparts{#1}
%   \small\addfontfeature{Color=lightgray}%
%   \ifblank{\namepartgiven}{}{\namepartgiven\space}#1%
%   \ifthenelse{\value{listcount}<\value{liststop}}
%     {\addcomma\space}
%     {}%
% }

% \newcommand{\printbibsection}[2]{
%   \begin{refsection}
%     \newrefcontext[sorting=chronological]%
%     \nocite{*}
%     \printbibliography[type={#1}, title={#2}, heading=subbibliography]
%   \end{refsection}
% }

% \DeclareSortingScheme{chronological}{
%   \sort[direction=descending]{\field{year}}
%   \sort[direction=descending]{\field{month}}
% }



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

% \RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[left=1in,top=1in,right=1in,bottom=1in,nohead,nofoot]{geometry}
\RequirePackage{hyperref}