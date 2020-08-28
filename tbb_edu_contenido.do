*contenido
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
}
	*List of leaders
	list name if forces=="Contenido"
quietly{
keep f1contenidos f1métodos f1materiales f1adaptación f1curricula
egen F1contenido=sum(f1contenidos)
egen F1métodos=sum(f1métodos)
egen F1materiales=sum(f1materiales)
egen F1adaptación=sum(f1adaptación)
egen F1curricula=sum(f1curricula)
keep if _n==1
keep F1contenido F1métodos F1materiales F1adaptación F1curricula
xpose, varname clear
order _varname v1
sort _varname	
encode _varname, gen(f)
		graph twoway (bar v1 f if f==1, bcolor("128 141 140") barwidth(0.7) ///
								yaxis(1) yscale(range(0) axis(1)) ///
								ytitle("Líderes", size(medium) height(5)) ///
								ylabel(#7) ylabel(, labsize(small)) ///
								ymtick(##10) ///
								xtitle("CONTENIDO: temas", size(medium) height(5)) ///
								xlabel(, angle(vertical) labsize(large)) ///
								xlabel(#15) ///
								xlabel(1 "Adaptación" 2 "Contenido" 3 "Curricula" 4 "Materiales" 5 "Métodos") ///
								xlabel(, angle(horizontal) labsize(small) notick)) ///
								(bar v1 f if f==2, bcolor("251 73 55") barwidth(0.7)) ///
								(bar v1 f if f==3, bcolor("255 196 33") barwidth(0.7)) ///
								(bar v1 f if f==4, bcolor("97 187 112") barwidth(0.7)) ///
								(bar v1 f if f==5, bcolor("59 74 75") barwidth(0.7)) ///
								(scatter v1 f if f==1 | f==2 | f==3 | f==4 | f==5, ///
								msym(none) mlab(v1) mlabposition(1) mlabcolor(black) mlabsize(medium) mlabangle(ver) legend(off) yaxis(1))
}
