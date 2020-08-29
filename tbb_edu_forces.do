*Fuerzas (Áreas)
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
}
	*Forces
	tab forces
*Graph
quietly{
gen value=.
replace value = 1 if regexm(forces, "Alianzas")
replace value = 1 if regexm(forces, "Contenido")
replace value = 1 if regexm(forces, "Difusión")
replace value = 1 if regexm(forces, "Formación")
replace value = 1 if regexm(forces, "Investigación")
bysort forces: egen total=total(value)
by forces:  gen dup = cond(_N==1,0,_n)
drop if dup>1
drop dup
encode forces, gen(f)
keep total f
order f
egen t=total(total)
gen per=(total/t)*100
replace per=round(per, 0.1)
gen per2=string(100 * total/t, "%8.1f") + "%"
		graph twoway (bar total f if f==1, bcolor("128 141 140") barwidth(0.7) ///
								yaxis(1) yscale(range(0) axis(1)) ///
								ytitle("Líderes", size(medium) height(5)) ///
								ylabel(#7) ylabel(, labsize(small)) ///
								ymtick(##10) ///
								xtitle("Fuerzas (Áreas)", size(medium) height(5)) ///
								xlabel(, angle(vertical) labsize(large)) ///
								xlabel(#15) ///
								xlabel(1 "Alianzas" 2 "Contenido" 3 "Difusión" 4 "Formación" 5 "Investigación") ///
								xlabel(, angle(horizontal) labsize(small) notick)) ///
								(bar total f if f==2, bcolor("251 73 55") barwidth(0.7)) ///
								(bar total f if f==3, bcolor("255 196 33") barwidth(0.7)) ///
								(bar total f if f==4, bcolor("97 187 112") barwidth(0.7)) ///
								(bar total f if f==5, bcolor("59 74 75") barwidth(0.7)) ///
								(scatter total f if f==1 | f==2 | f==3 | f==4 | f==5, ///
								msym(none) mlab(total) mlabposition(1) mlabcolor(black) mlabsize(small) mlabangle(ver) legend(off) yaxis(1)) ///
								(scatter total f if f==1 | f==2 | f==3 | f==4 | f==5, ///
								msym(none) mlab(per2) mlabposition(4) mlabcolor(black) mlabsize(small) mlabangle(hor) legend(off))
}
