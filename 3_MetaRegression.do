***** 3_MetaRegression.do *****

capture: program drop meta_bubble
program define meta_bubble
syntax, var(varname) save(string) *
meta regress c.`var'

* P-value in notes
matrix A = r(table)
local pval = A[4, 1]
pval_tostring, pval(A[4, 1])

* bubbleplot
estat bubbleplot, ///
	scheme(s2mono) ///
	ytitle("Cases per 100,000 person-years") ///
	title("") note("P`r(pvalstring)'") ///
	legend(off) `options' //
graph export "Output/`save'.png", replace
graph export "Output/`save'.pdf", replace
end

	
*** Meta-regression
use Output/StudyOverview.dta, clear
drop if ref=="Andersen 1988" // same study population as Ebbehoj 2021

meta set total_mean total_se /// 
	, studylabel(ref2)

meta summarize

meta_bubble, var(year_middle) save(Overall_MiddleYear) xtitle(Median year of study period) ///
	addplot((scatter _meta_es year_middle, ///
		legend(off) mlabel(ref) mlabcolor(black) mlabsize(1.5) msymbol(none) mlabgap(4-pt)))
	
meta_bubble, var(altitude) save(Overall_Altitude) xtitle(Altitude in meters) ///
	addplot((scatter _meta_es altitude, ///
		legend(off)  mlabel(ref) mlabcolor(black) mlabsize(1.5) msymbol(none) mlabgap(4-pt)))