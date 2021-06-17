***** 3_GraphIncidence.do *****

*** Graph incidence lines
use Output/IncidenceByYear, clear
drop if ref =="Andersen 1988" // same population as Ebbehoj 2021

gen id=_n

local x = 1
levelsof ref2, local(refs)

foreach ref of local refs {
    * Figure
	local twoway = `"`twoway' (connected mean year if ref2=="`ref'", msize(0.5) )"'
	
	* legend
	qui: su id if ref2=="`ref'"
	local ncases = total_cases[`r(min)']
	local label = `"`label' `x' "`ref' (N=`ncases')" "'
	
	local x=`x'+1
}

twoway `twoway', ///
	/// Overall settings
	scheme(s1mono) ///
	legend(order(`label') colfirst) ///
	/// x-axis
	xtitle("Year") ///
	/// y-axis
	ytitle("Cases per 100,000 person-years") ///
	ymtick(0(0.1)2) ///
	ylines(0.5(0.5)2, lwidth(0.05) lcolor(gs6%20%))
	
graph export Output/IncidenceByYear.png, replace