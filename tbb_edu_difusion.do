*Difusión
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
}
	*List of leaders
	list name if forces=="Difusión"
quietly{
keep f3difusión f3recursos f3web f3medios
egen F3difusión=sum(f3difusión)
egen F3recursos=sum(f3recursos)
egen F3web=sum(f3web)
egen F3medios=sum(f3medios)
keep if _n==1
keep F3difusión F3recursos F3web F3medios
xpose, varname clear
order _varname v1
sort _varname	
encode _varname, gen(f)
		graph twoway (bar v1 f if f==1, bcolor("128 141 140") barwidth(0.7) ///
								yaxis(1) yscale(range(0) axis(1)) ///
								ytitle("Líderes", size(medium) height(5)) ///
								ylabel(#7) ylabel(, labsize(small)) ///
								ymtick(##10) ///
								xtitle("DIFUSIÓN: temas", size(medium) height(5)) ///
								xlabel(, angle(vertical) labsize(large)) ///
								xlabel(#15) ///
								xlabel(1 "Difusión" 2 "Medios" 3 "Recursos" 4 "Web") ///
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
	*List of leaders DIFUSIÓN: Difusión
	list name if forces=="Difusión" & f3difusión==1
	*List of leaders DIFUSIÓN: Recursos
	list name if forces=="Difusión" & f3recursos==1
	*List of leaders DIFUSIÓN: Web
	list name if forces=="Difusión" & f3web==1
	*List of leaders DIFUSIÓN: Medios
	list name if forces=="Difusión" & f3medios==1
