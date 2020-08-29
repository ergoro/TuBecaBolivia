*Investigación
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
}
	*List of leaders
	list name if forces=="Investigación"
quietly{
keep f4investigar f4exámen f4PISA f4indicadores
egen F4investigar=sum(f4investigar)
egen F4exámen=sum(f4exámen)
egen F4PISA=sum(f4PISA)
egen F4indicadores=sum(f4indicadores)
keep if _n==1
keep F4investigar F4exámen F4PISA F4indicadores
xpose, varname clear
order _varname v1
sort _varname	
encode _varname, gen(f)
		graph twoway (bar v1 f if f==1, bcolor("128 141 140") barwidth(0.7) ///
								yaxis(1) yscale(range(0) axis(1)) ///
								ytitle("Líderes", size(medium) height(5)) ///
								ylabel(#7) ylabel(, labsize(small)) ///
								ymtick(##10) ///
								xtitle("INVESTIGACIÓN: temas", size(medium) height(5)) ///
								xlabel(, angle(vertical) labsize(large)) ///
								xlabel(#15) ///
								xlabel(1 "PISA" 2 "Exámen" 3 "Indicadores" 4 "Investigar") ///
								xlabel(, angle(horizontal) labsize(small) notick)) ///
								(bar v1 f if f==2, bcolor("251 73 55") barwidth(0.7)) ///
								(bar v1 f if f==3, bcolor("255 196 33") barwidth(0.7)) ///
								(bar v1 f if f==4, bcolor("97 187 112") barwidth(0.7)) ///
								(scatter v1 f if f==1 | f==2 | f==3 | f==4, ///
								msym(none) mlab(v1) mlabposition(1) mlabcolor(black) mlabsize(medium) mlabangle(ver) legend(off) yaxis(1))
}
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
}
	*List of leaders INVESTIGACIÓN: Investigar
	list name if forces=="Investigación" & f4investigar==1
	*List of leaders INVESTIGACIÓN: Exámen
	list name if forces=="Investigación" & f4exámen==1
	*List of leaders INVESTIGACIÓN: PISA
	list name if forces=="Investigación" & f4PISA==1
	*List of leaders INVESTIGACIÓN: Indicadores
	list name if forces=="Investigación" & f4indicadores==1
