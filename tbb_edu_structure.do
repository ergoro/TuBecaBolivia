*Structure dataset
use "tbb_edu_survey_teams.dta", clear
*Rename vars
rename Username email
rename NombreCompleto name
rename CelularConcÃdigodepaÃs phonenum
rename CiudaddeResidencia city
rename SeleccionaelÃreadetrabajoe forces
rename ÂEnquÃtipodeproyectotegu f1
rename ÂTienesalgunaotraideaoprop f1o
rename I f2
rename J f2o
rename K f3
rename L f3o
rename M f4
rename N f4o
rename O f5
rename P f5o
*Re-assign values
tab f1
replace f1 
