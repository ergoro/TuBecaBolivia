*Ciudades
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
tab city
replace city="Bay Area, CA" if city=="Bay area california"
replace city="Ciudad de México" if city=="Ciudad de MÃ©xico "
replace city="Cochabamba" if city=="Cochabamba "
replace city="Coimbra" if city=="Coimbra, Portugal"
replace city="Córdoba" if city=="CÃ³rdoba Argentina"
replace city="Gainesville, FL" if city=="Gainesville"
replace city="La Paz" if city=="La Paz "
replace city="Málaga" if city=="MALAGA"
replace city="Orléans" if city=="Orleans"
replace city="Recife" if city=="Recife "
replace city="Ribeirão Preto" if city=="RibeirÃ£o Preto"
replace city="Recife" if city=="Recife "
replace city="Santa Cruz" if city=="Santa Cruz de la Sierra"
replace city="Talca" if city=="Talca, Chile"
}
	*Participants's cities
	tabulate city
quietly{
*Number of cities
generate order = _n
by city (order), sort: generate y = _n == 1
sort order
replace y = sum(y)
drop order
}
	*Number of cities
	list city y
