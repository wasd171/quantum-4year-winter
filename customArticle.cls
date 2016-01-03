% Sets minimal LaTeX version
\NeedsTeXFormat{LaTeX2e}

% Class name
\ProvidesClass{customArticle}

% Calls extarticle class and pass all customArticle class options
\LoadClassWithOptions{extarticle}

% Set fonts (XeLaTeX required)
	% Allows to load fonts
	\RequirePackage{fontspec}

	\setmainfont{Helvetica}

	% Sans-serif math font
	\RequirePackage{arevmath}

	% Use TeX ligatures, like ``something''
	\defaultfontfeatures{Mapping=tex-text}

	% The pack­age sup­ports the Text Com­pan­ion fonts, which pro­vide many text sym­bols
	% (such as baht, bul­let, copy­right, mu­si­cal­note, onequar­ter, sec­tion, and yen), 
	% in the TS1 en­cod­ing.
	\RequirePackage{textcomp}

	% Pro­vides generic com­mands \de­gree, \cel­sius, \pert­hou­sand, \mi­cro and \ohm 
	% which work both in text and maths mode.
	\RequirePackage{gensymb}

% Handle Russian language properly
	\newfontfamily{\cyrillicfont}{Helvetica}
	\newfontfamily{\cyrillicfonttt}{Courier New}

	% Customizes lists
	\RequirePackage{enumitem}

	% Sets cyrillic list labels. Usage example: \begin{enumerate}[label=\asbuk*)]
	\AddEnumerateCounter{\Asbuk}{\@Asbuk}{\CYRM}
	\AddEnumerateCounter{\asbuk}{\@asbuk}{\cyrm}

	% Support for Russian language
	\RequirePackage{polyglossia}
	\setdefaultlanguage[spelling=modern]{russian}

	% Sorry, non-Russian speakers :-)
	\setotherlanguage{english}

	% Allows babel-like shorthands, like Einstein"=Podolsky"=Rosen
	\setkeys{russian}{babelshorthands=true}

	% Sets a bit different spacing, required by Russian typography
	\frenchspacing

% Math setup
	% Generic math packages
	\RequirePackage{amsmath}
	\RequirePackage{amssymb}
	\RequirePackage{amsthm}
	\RequirePackage{mathtools}

	% Allows display breaks inside formulae
	\allowdisplaybreaks

	% Controls numeration of equations, figures, etc
	\RequirePackage{chngcntr}

	% Prints nice brackets
	\newcommand{\brround}[1]{\left( #1 \right)}
	\newcommand{\brsquare}[1]{\left[ #1 \right]}

	% Easy partial derivatives
		% Partial derivative with constant #3
		\newcommand{\partfrac}[3]{
			\brround{ \frac{\partial #1}{\partial #2} }_{#3}
		}

		% Partial derivative of a custom power
		\newcommand{\pwrpartfrac}[4]{
			\brround{ \frac{\partial^{#4} #1}{\partial #2^{#4}} }_{#3}
		}

		% Partial derivative of variation
		\newcommand{\dpartfrac}[3]{
			\brround{ \frac{\delta #1}{\partial #2} }_{#3}
		}

	% Use fancy vector signs
	\RequirePackage{esvect}

	% Scalar and vector products
	\newcommand{\scprod}[2]{\brround{ \vv{#1} \cdot \vv{#2}}}
	\newcommand{\vecprod}[2]{\brsquare{ \vv{#1} \times \vv{#2}}}

	% Why big Epsilon isn't implemented in standart?
	\newcommand{\Epsilon}[0]{\mathcal{E}}

	% Use nice surface integral signs like \oiint
	\RequirePackage{esint}

% Tables config
	% Custom tables handling
	\RequirePackage{booktabs}

	% Set longtable enviroment, which allows display break in tables
	\RequirePackage{longtable}

	% Set a new column type, which implements vertical centering and breaks
	\RequirePackage{array}
	\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

	% Allow multicolumns and multirows
	\RequirePackage{multicol}
	\RequirePackage{multirow}

	% Multirow with horizontal centering
	\newcommand{\cmultirow}[3]{
		{\multirow{#1}{#2}{\centering #3}}
	}

% Graphics packages
	% For including various image formats
	\RequirePackage{graphicx}

	% Im­proves the in­ter­face for defin­ing float­ing ob­jects such as fig­ures and ta­bles.
	\RequirePackage{float}

	% Al­lows fig­ures or ta­bles to have text wrapped around them.
	\RequirePackage{wrapfig}

	% Mod­i­fies the mar­gins and ro­tates the page con­tents but not the page num­ber. 
	\RequirePackage{lscape}

% Chemistry packages
	\RequirePackage{chemfig}

	% http://tex.stackexchange.com/questions/96633/how-to-draw-parentheses-inside-chemfig
	\newcommand\setpolymerdelim[2]{\def\delimleft{#1}\def\delimright{#2}}

	\def\makebraces(#1,#2)#3#4#5{%
	  \edef\delimhalfdim{\the\dimexpr(#1+#2)/2}%
	  \edef\delimvshift{\the\dimexpr(#1-#2)/2}%
	  \chemmove{
	    \node[at=(#4),yshift=(\delimvshift)]
	      {$
	       \left\delimleft
	         \vrule height\delimhalfdim depth\delimhalfdim width0pt
	       \right.
	      $};
	    \node[at=(#5),yshift=(\delimvshift)]
	      {$
	        \left.
	          \vrule height\delimhalfdim depth\delimhalfdim width0pt
	        \right\delimright_{\rlap{#3}}
	      $};
	  }
	}

% General packages
	\RequirePackage[unicode]{hyperref}

% Text formatting
	% Allow LaTeX to stretch lines
	\sloppy

	% Set vertical spacing between paragraphs
	\RequirePackage{parskip}

% Custom options, feel free to change!
	% Rows shall be higher, useful for formulae inside tables
	\renewcommand{\arraystretch}{1.5}

	% Sometimes you just need custom margins
	\RequirePackage[left = 20mm, right = 20mm, top = 15mm, bottom = 15mm]{geometry}

% Useful commands
	\newcommand{\msu}{Московский государственный университет имени М.\,В.~Ломоносова}