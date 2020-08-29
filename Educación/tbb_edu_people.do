*personas
quietly{
use "tbb_edu_survey_teams.dta", clear
do tbb_edu_structure.do
do tbb_edu_clean.do
}
	*Participants
	list name
