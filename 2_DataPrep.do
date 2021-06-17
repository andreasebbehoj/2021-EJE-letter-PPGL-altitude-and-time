***** 2_DataPrep.do *****
capture: mkdir Output


*** Combine study files
clear
local files : dir "Data/" files "*.dta"
di `"`files'"'

foreach file of local files {
    append using "Data/`file'"
}
tempfile filescombined
save `filescombined', replace


*** Add study overview data
import excel Input/StudyOverview.xlsx, clear first

* Year vars
gen period =string(year_from)+"-"+string(year_to), after(ref)
gen year_middle = (year_from+year_to)/2


* Secondary ref name (year first, author last)
gen ref2 = string(year_pub) + " " + subinstr(ref, " " + string(year_pub), "", 1) , after(ref)

* Calculate overall IR
merge 1:m ref using `filescombined', assert(match) nogen keepusing(pop)
bysort ref: egen total_pop = sum(pop)
drop pop
duplicates drop

foreach var in mean se lb ub {
    qui: gen total_`var' = .
}

qui: count
forvalues x = 1/`r(N)' {
    local pop = total_pop[`x']
	local cases = total_cases[`x']
	qui: cii means `pop' `cases', poisson
	foreach var in mean se lb ub {
		qui: replace total_`var' = `r(`var')'*100000 if _n==`x'
	}
}


* Save
drop year_from year_to notes
order inletter year_pub ref location period tumor altitude total_cases
save Output/StudyOverview.dta, replace



*** Calculate IR and SE by year
use Output/StudyOverview.dta, clear
merge 1:m ref using `filescombined', assert(match) nogen

* Find middle year for papers which only provides period-estimates
replace year = (year_from+year_to)/2 if mi(year)
drop year_from year_to

foreach var in mean se lb ub {
    qui: gen `var' = .
}

qui: count
forvalues x = 1/`r(N)' {
    local pop = pop[`x']
	local cases = cases[`x']
	qui: cii means `pop' `cases', poisson
	foreach var in mean se lb ub {
		qui: replace `var' = `r(`var')'*100000 if _n==`x'
	}
}


* Save
save Output/IncidenceByYear.dta, replace