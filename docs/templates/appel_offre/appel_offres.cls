%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Classe de rapport pédagogique v3
%%
%% Vincent Labatut 2014-2016
%%
%% v1   - 10/2014 : forme de rapport très différente
%% v2   - 02/2015 : modèle complètement refait
%% v2.1 - 03/2015 : définition de la page de titre
%% v2.2 - 03/2015 : correction de quelques bugs
%% v2.3 - 04/2015 : page de titre complétée (date, adresse postale, long titre)
%% v2.4 - 12/2015 : diverses modifications du contenu du document
%% v3   - 01/2016 : définition de la classe latex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% init class
	\NeedsTeXFormat{LaTeX2e}
	\ProvidesClass{ceri}[2016/01/08 Report LaTeX class]
	\LoadClass[a4paper, 11pt, final]{report}	% based on the existing latex class


% various packages
	\RequirePackage{xspace}						% used by babel
	\RequirePackage[numbers]{natbib}
	\RequirePackage[english,francais]{babel}	% necessary for french documents
	\RequirePackage[utf8]{inputenc}				% use source file containing diacritics
	\RequirePackage[T1]{fontenc}				% select font encoding and allow hyphenation
	\RequirePackage[table,xcdraw]{xcolor}				% put colors in the document
	\let\normalcolor\relax
	\RequirePackage{lmodern}					% use specific fonts
	\RequirePackage{graphicx}					% include pictures
	\RequirePackage{url}						% display urls
	\RequirePackage{amsmath}					% extended equations
%	\RequirePackage{ifthen}						% if/then expressions
	\RequirePackage{lastpage}					% last page number
	\RequirePackage{textcomp}					% degree character
	\RequirePackage{printlen}					% display lengths
	\RequirePackage{xstring}					% handle strings functions
	%\RequirePackage{subfig}						% subfloats (subfigures, subtables...)
	\RequirePackage{float}	 					% custom floats environments
%\RequirePackage{caption}
%\RequirePackage{subcaption}

\RequirePackage[%
    font={small,sf},
    labelfont=bf,
    format=hang,    
    format=plain,
    margin=0pt,
    width=0.8\textwidth,
]{caption}
\RequirePackage[list=true]{subcaption}

\RequirePackage{booktabs}
\RequirePackage{varwidth}

%	\RequirePackage{tocloft}	 				% list of custom float objects
	\RequirePackage{setspace}
	\RequirePackage[french]{varioref}
	\RequirePackage{tikz}
	\RequirePackage{authoraftertitle}			% access title and author names
	\RequirePackage{fancyhdr}					% custom headers and footers
	\RequirePackage{multicol}					% colonnes		
% due to a warning
	\setlength{\headheight}{13.6pt}

% needed fo UAPV title page formating
	\RequirePackage{soul}
	\RequirePackage{graphicx}
	\sodef\ugg{}{.4em plus 1fill}{1em plus 2 fill}{2em plus 2fill minus.1em}

% custom margins
	\RequirePackage[top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry} 	

% thick lines in the tables
	\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}


% colors
	\definecolor{DarkColor}{gray}{0.75}
	\definecolor{LightColor}{gray}{0.9}
	\definecolor{LightGrey}{rgb}{0.96,0.96,0.96}
	\definecolor{DarkGrey}{rgb}{0.83,0.83,0.83}
	\definecolor{BaseColor}{rgb}{0.22,0.66,0.86}%{0.64,0.69,0.31}
	\definecolor{TextColor}{rgb}{0.44,0.49,0.11}
	\definecolor{VertDepartementGeo}{rgb}{0.55,0.70,0.06}
	\definecolor{jaune}{rgb}{0.99,0.93,0.14}
	\definecolor{bleuciel}{rgb}{0.77,0.91,0.97}

% macros allowing to set the document info
	\def\classname#1{\gdef\myclassname{#1}}
	\def\formation#1{\gdef\myformation{#1}}
	\def\parcours#1{\gdef\myparcours{#1}}
	


% hyperlinks
	\RequirePackage[
		bookmarks=true, bookmarksnumbered=true, bookmarksopen=true,
		unicode=true, colorlinks=true, linktoc=all, %linktoc=page
		linkcolor=TextColor, citecolor=TextColor, filecolor=TextColor, urlcolor=TextColor,
		pdfstartview=FitH
]{hyperref}


% arrays and tables
	\RequirePackage{array}							% handle arrays
	% Macro by A. Kassi 
	% http://www.ukonline.be/programmation/latex/tutoriel/chapitre4/page2.php
	\makeatletter
		\def\hlinewd#1{
		\noalign{\ifnum0=`}\fi\hrule \@height #1
		\futurelet\reserved@a\@xhline}
	\makeatother
	% end macro


% NOTE: only (?) for the report class
	\RequirePackage{chngcntr}				% hide the chapter number in section headings
	\counterwithout{section}{chapter}		% hide the chapter number in section headings


% change default font
	\renewcommand{\familydefault}{\sfdefault}


% custom list bullets
%	\renewcommand{\labelitemi}{$\bullet$}
	\renewcommand{\FrenchLabelItem}{\textbullet}

% custom captions
	\RequirePackage{caption}
	\captionsetup{
		labelfont={color=TextColor, bf, small},	% font(sf), color, bold, size of the caption label
		textfont={small},								% font(sf) and size of the caption text itself
		labelsep=period,								% separator between label and text
		margin=10mm										% left/right margins
	}


% custom equations
	\makeatletter								% change equation numbers
	\def\tagform@#1{\maketag@@@{(\color{TextColor}\textbf{#1}\normalcolor)\@@italiccorr}}
	\makeatother


% custom section headers
	\makeatletter
		\renewcommand{\section}{
		    \@startsection{section}{1}{0pt}
		    {-3.5ex plus -1ex minus -.2ex}
		    {2.3ex plus.2ex}
		    {\color{TextColor}\normalfont\Large\bfseries}
		}
		\renewcommand\subsection{
		    \@startsection{subsection}{2}{\z@}
	    		{-3.25ex\@plus -1ex \@minus -.2ex}
		    {1.5ex \@plus .2ex}
		    {\color{TextColor}\normalfont\large\bfseries}
		}
		\renewcommand\subsubsection{
	    		\@startsection{subsubsection}{3}{\z@}
	    		{-3.25ex\@plus -1ex \@minus -.2ex}
	    		{1.5ex \@plus .2ex}
	    		{\color{TextColor}\normalfont\normalsize\bfseries}
		}
		\renewcommand\paragraph{
	    		\@startsection{paragraph}{4}{\z@}
	    		{-3.25ex\@plus -1ex \@minus -.2ex}
	    		{-1em}
	    		{\color{TextColor}\normalfont\normalsize}
		}
		\renewcommand\subparagraph{
	    		\@startsection{subparagraph}{5}{\z@}
	    		{-3.25ex\@plus -1ex \@minus -.2ex}
	    		{-1em}
	    		{\color{TextColor}\normalfont\normalsize}
		}
	\makeatother
    \setcounter{secnumdepth}{3}		% number subsubsections
	\setcounter{tocdepth}{3}			% and include them in the TOC


% custom table of contents
	\newcommand{\tocName}{Sommaire}									% define TOC header
	\addto\captionsfrench{\renewcommand{\contentsname}{\color{TextColor}\tocName}}	% change TOC header
	
% custom list of figures
	\newcommand{\lofName}{Liste des figures}						% define LOF header
%	\renewcommand{\listfigurename}{\lofName}						% change LOF header (1)
	\addto\captionsfrench{\renewcommand{\listfigurename}{\color{TextColor}\lofName}}	% change LOF header (2)
	
	
% custom list of tables
	\newcommand{\lotName}{Liste des tables}							% define LOT header
%	\renewcommand{\listtablename}{\lotName}							% change LOT header (1)
	\addto\captionsfrench{\renewcommand{\listtablename}{\color{TextColor}\lotName}}	% change LOT header (2)


%% custom section
	\newcommand{\merci}{Remerciements}							% define LOT header
%%	\renewcommand{\listtablename}{\lotName}							% change LOT header (1)
%	\addto\captionsfrench{\merci}	% change LOT header (2)
%


% custom bibliography
	\RequirePackage{babelbib}								% language-dependent bibliography
	\newcommand{\bibName}{Bibliographie}					% define bibliography header
%	\RequirePackage[square, comma, sort&compress]{natbib}	% compress numbered citations


% custom date format
	\RequirePackage{datetime}
		

% title page
	\renewcommand{\maketitle}{
		% setup PDF doc info
		\hypersetup{
    		pdftitle={\MyTitle},%
	    	pdfauthor={\MyAuthor},%
	    	%pdfsubject={\myclassname}%
		}
		
		% custom headers and footers
		\pagestyle{fancy}
		\fancyhf{}
		\renewcommand{\headrulewidth}{0.4pt}
		\renewcommand{\footrulewidth}{0.4pt}
		\rfoot{\thepage\ / \pageref*{LastPage}} 
		\lfoot{\MyAuthor (projet fictif)} 
		\chead{\MyTitle} 
		
		% draw title page
		\phantomsection 
		\addcontentsline{toc}{section}{Titre}	% add the title page in the TOC (yes! for PDF bookmark)
		\begin{titlepage}
			\begin{tikzpicture}[remember picture,overlay]
				% vertical lines
		    	\node at (current page.south west)
				{	\begin{tikzpicture}[remember picture,overlay]
				
						%% remplissage
						%\fill[fill=LightGrey]  (0cm,21.2cm) rectangle(21cm,29.7cm);
						\fill[fill=bleuciel] (0cm,29.7cm) rectangle(21cm,25.2cm);
						\fill[fill=jaune] (0cm,1cm) rectangle(21cm,2cm);
						%\fill[fill=BaseColor] (1cm,0cm) rectangle(5.2cm,25.2cm);
						\fill[fill=BaseColor] (1cm,0cm) rectangle(5.2cm,29.7cm);
				
						%%images
						
							% LOGO P8
 						%\pgftext[x=1cm,y=25.4cm,bottom,left]{\includegraphics[width=4.2cm]{images/logop8.png}};
 						\pgftext[x=1.1cm,y=24.9cm,bottom,left]{\includegraphics[height=4.0cm]{images/logo-metropole.png}};
 						
 							% image de couverture
 						\pgftext[x=20cm,y=10cm,bottom,right]{\includegraphics[width=14cm]{images/couv.JPG}};
 						% source:
 						\pgftext[x=15.5cm,y=9.5cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{8}{8}{\fontfamily{phv}\selectfont{}\textcolor{DarkGrey}{Crédit image : Oleg Skripochka (Roscomos)}}}};
 						
 							
 						%% Departement
 						%\pgftext[x=1.1cm,y=24.5cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{\ugg{\textbf{DEPARTEMENT}}}}}};
 						%\pgftext[x=1.1cm,y=24cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{\ugg{\textbf{{DE}}}}}}};
 						%\pgftext[x=1.1cm,y=23.5cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{\ugg{\textbf{GEOGRAPHIE}}}}}};
 						
 						%% intitulé formation
 						%\pgftext[x=1.1cm,y=23.9cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][l]{\ugg{\textbf{}}}}}};
 						%\pgftext[x=5.5cm,y=23.2cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{\myformation}}}};
 						%\pgftext[x=5.5cm,y=22.7cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{\myparcours}}}};
 						%\pgftext[x=5.5cm,y=21.3cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{UE} \myclassname}}};
 						
 						%% Titre
 						\pgftext[x=5.5cm,y=22.5cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{25}{30}{\fontfamily{phv}\selectfont{}\textbf{\textcolor{white}{}\hspace{0cm}\textcolor{BaseColor}{\parbox{19cm}{\raggedright\MyTitle}}}}}};
						%% Sous-titre
 						%\pgftext[x=5.5cm,y=19.5cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{20}{20}{\fontfamily{phv}\selectfont{}\textbf{UE Analyse Multi-Critères (projet)}}}};
 						
 						%\pgftext[x=3.5cm,y=19.5cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{30}{30}{\fontfamily{phv}\selectfont{}\textbf{\textcolor{white}{>{}>{}>}\hspace{0.7cm}\textcolor{BaseColor}{\parbox{19cm}{\raggedright\MyTitle}}}}}};
 						 						
 						Crédit image : Roscomos
 						\pgftext[x=5.5cm,y=21.5cm,bottom,left]{\scalebox{0.77}[1]{\fontsize{20}{20}{\fontfamily{phv}\selectfont{}\textcolor{BaseColor}{\MyAuthor}}}};
 						\pgftext[x=5.5cm,y=20.7cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{13}{13}{\fontfamily{phv}\selectfont{}\textbf{26 mars 2017}}}};
 						 						
 						
 						
 \pgftext[x=5.5cm,y=1cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{18}{18}{\fontfamily{phv}\selectfont{}\textbf{Commande fictive réalisée (projet de Master G2M -- Université Paris8)}}}};
 						
 						%% coordonnées MPM
 						\pgftext[x=1.1cm,y=5.7cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{Métropole Aix-Marseille Provence}}}};
 						\pgftext[x=1.1cm,y=5.2cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{Conseil de territoire}}}};
 						\pgftext[x=1.1cm,y=4.7cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{Le Pharo}}}};
 						\pgftext[x=1.1cm,y=4.4cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{58, boulevard Charles Livon}}}};
 						\pgftext[x=1.1cm,y=4.0cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{13007 Marseille}}}};
 						\pgftext[x=1.1cm,y=3.6cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{France}}}};
 						\pgftext[x=1.1cm,y=2.9cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{Tél. +33 (0)4 95 09 59 00}}}};
 						\pgftext[x=1.1cm,y=2.4cm,bottom,left]{\scalebox{0.6}[1]{\fontsize{12}{12}{\fontfamily{ptm}\selectfont{}\makebox[6.7cm][c]{http://www.mouvement-metropole.fr}}}};                        
 						
 					
					\end{tikzpicture}
				};
			\end{tikzpicture}
		\end{titlepage}





		\setcounter{page}{2} 	% set the second page... to number 2
		\thispagestyle{fancy}	% force header/footer
		\newpage
	}

%%% insérer les sources sous une figure/table !!! alignée à droite et collée à l'image
\newcommand{\source}[1]{\vspace{-40pt} \caption*{ \hfill \tiny{Source: {#1}}} }

% tables
	\newcommand{\MyToc}{
		\phantomsection
		\addcontentsline{toc}{section}{\tocName}	% add the TOC in the TOC (yes! for PDF bookmark)
		\tableofcontents							% insert TOC
		\thispagestyle{fancy}						% force header/footer
		\newpage
	}
	\newcommand{\MyLof}{
		\phantomsection
		\addcontentsline{toc}{section}{\lofName}	% add the LOF in the TOC
		\listoffigures								% insert LOF
		\thispagestyle{fancy}						% force header/footer
		\newpage
	}
	\newcommand{\MyLot}{
		\phantomsection
		\addcontentsline{toc}{section}{\lotName}	% add the LOT in the TOC
		\listoftables								% insert LOT
		\thispagestyle{fancy}						% force header/footer
		\newpage
	}		
	
		\newcommand{\mySection}[1]{
		\noindent{\textcolor{TextColor}{\huge{\textbf{#1}}}}
		\phantomsection
		\addcontentsline{toc}{section}{#1}	% add the LOT in the TOC
		\thispagestyle{fancy}						% force header/footer
		\vspace{1.5cm}
		%\newpage
	}	
	

	
	

% bibliography
	% receives the bibtex file
	\newcommand{\MyBibliography}[1]{
		% NOTE: for TexMaker it was necessary to reconfigure the bibtex target from "bibtex %.aux" to "bibtex %"
		\newpage
		\phantomsection
		\addcontentsline{toc}{section}{\bibName}	% add the bibliography in the TOC
%		\bibliographystyle{babplain}				% style for the bibliography (babel style)
%		\bibliographystyle{babunsrt}				% style for the bibliography (babel style)
%		\bibliographystyle{ieeetr}					% style for the bibliography
		\bibliographystyle{plainnat}
		\bibliography{#1}							% bibtex file
		\thispagestyle{fancy}						% force header/footer
	}
