*Clean
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
*Remove duplicates
tab email
drop if missing(email)
sort email
quietly by email:  gen dup = cond(_N==1,0,_n)
}
	*Number of duplicates
	tabulate dup
	list email dup if dup>0
quietly{
drop if dup>1
drop dup
}
	*Number of valid answers
	tab email
