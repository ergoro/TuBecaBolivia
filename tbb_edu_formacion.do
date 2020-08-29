*Formación
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
}
	*List of leaders
	list name if forces=="Formación"
quietly{
keep f2formación f2vocación f2profesores f2reconocimientos f2padres
egen F2formación=sum(f2formación)
egen F2vocación=sum(f2vocación)
egen F2profesores=sum(f2profesores)
egen F2reconocimientos=sum(f2reconocimientos)
egen F2padres=sum(f2padres)
keep if _n==1
keep F2formación F2vocación F2profesores F2reconocimientos F2padres
xpose, varname clear
order _varname v1
sort _varname	
encode _varname, gen(f)
		graph twoway (bar v1 f if f==1, bcolor("128 141 140") barwidth(0.7) ///
								yaxis(1) yscale(range(0) axis(1)) ///
								ytitle("Líderes", size(medium) height(5)) ///
								ylabel(#7) ylabel(, labsize(small)) ///
								ymtick(##10) ///
								xtitle("FORMACIÓN: temas", size(medium) height(5)) ///
								xlabel(, angle(vertical) labsize(large)) ///
								xlabel(#15) ///
								xlabel(1 "Formación" 2 "Padres" 3 "Profesores" 4 "Reconocimientos" 5 "Vocación") ///
								xlabel(, angle(horizontal) labsize(small) notick)) ///
								(bar v1 f if f==2, bcolor("251 73 55") barwidth(0.7)) ///
								(bar v1 f if f==3, bcolor("255 196 33") barwidth(0.7)) ///
								(bar v1 f if f==4, bcolor("97 187 112") barwidth(0.7)) ///
								(bar v1 f if f==5, bcolor("59 74 75") barwidth(0.7)) ///
								(scatter v1 f if f==1 | f==2 | f==3 | f==4 | f==5, ///
								msym(none) mlab(v1) mlabposition(1) mlabcolor(black) mlabsize(medium) mlabangle(ver) legend(off) yaxis(1))
}
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
}
	*List of leaders FORMACIÓN: Formación
	list name if forces=="Formación" & f2formación==1
	*List of leaders FORMACIÓN: Vocación
	list name if forces=="Formación" & f2vocación==1
	*List of leaders FORMACIÓN: Profesores
	list name if forces=="Formación" & f2profesores==1
	*List of leaders FORMACIÓN: Reconocimientos
	list name if forces=="Formación" & f2reconocimientos==1
	*List of leaders FORMACIÓN: Padres
	list name if forces=="Formación" & f2padres==1
