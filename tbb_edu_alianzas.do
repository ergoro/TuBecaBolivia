*Alianzas
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
}
	*List of leaders
	list name if forces=="Alianzas"
quietly{
keep f5otros f5educativas
egen F5otros=sum(f5otros)
egen F5educativas=sum(f5educativas)
keep if _n==1
keep F5otros F5educativas
xpose, varname clear
order _varname v1
sort _varname	
encode _varname, gen(f)
		graph twoway (bar v1 f if f==1, bcolor("128 141 140") barwidth(0.7) ///
								yaxis(1) yscale(range(0) axis(1)) ///
								ytitle("Líderes", size(medium) height(5)) ///
								ylabel(#7) ylabel(, labsize(small)) ///
								ymtick(##10) ///
								xtitle("ALIANZAS: temas", size(medium) height(5)) ///
								xlabel(, angle(vertical) labsize(large)) ///
								xlabel(#15) ///
								xlabel(1 "Educativas" 2 "Otras") ///
								xlabel(, angle(horizontal) labsize(small) notick)) ///
								(bar v1 f if f==2, bcolor("251 73 55") barwidth(0.7)) ///
								(scatter v1 f if f==1 | f==2 | f==3 | f==4, ///
								msym(none) mlab(v1) mlabposition(1) mlabcolor(black) mlabsize(medium) mlabangle(ver) legend(off) yaxis(1))
}
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
}
	*List of leaders ALIANZAS: Otros
	list name if forces=="Alianzas" & f5otros==1
	*List of leaders ALIANZAS: Educativas
	list name if forces=="Alianzas" & f5educativas==1
