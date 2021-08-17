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
** Overall estimates (similar to letter by Leung et al)
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


** Annual estimates
use Output/IncidenceByYear, clear
drop if ref=="Andersen 1988" // same population as Ebbehoj 2021

meta set mean se if mean!=0 /// cannot include years with N=0
	, studylabel(ref2)

meta_bubble, var(year) save(YearlyData_Year) xtitle(Year) ///
	addplot(scatter mean year if ref=="Kim 2020" & year==2005, msymbol(none) mlabel(ref) mlabpos(6))

meta_bubble, var(altitude) save(YearlyData_Altitude) xtitle(Altitude in meters) ///
	addplot(scatteri ///
		0.1 134 `"1964 Graeff"'  ///
		0.87 355 `"1983 Beard"'  ///
		0.4 111 `"1985 Hartley"'  ///
		0.4 120 `"1986 Stenström"'  ///
		0.40 297 `"1994 Fernandez-Calvet"'  ///
		0.82 104 `"2000 Takayanagi"'  ///
		0.48 77 `"2014 Holland"'  ///
		0.67 134 `"2018 Berends"'  ///
		0.93 64	`"2020 Cvasciuc"' ///
		1.3 355 `"2020 Ebbehoj"'  ///
		0.25 72 `"2020 Kim"'  ///
		0.65 64 `"2021 Ebbehoj"'  ///
		0.87 773 `"2021 Leung"' ///
		, msymbol(none) mlabel(ref2) mlabangle(vertical) mlabpos(1) mlabsize(1.5))

** Annual estimates (wo./Kim et al)
use Output/IncidenceByYear, clear
drop if ref=="Andersen 1988" | ref=="Kim 2020"

meta set mean se if mean!=0 /// cannot include years with N=0
	, studylabel(ref2)

meta_bubble, var(year) save(YearlyData_Year_woKim) xtitle(Year) ///
	addplot(scatter mean year if ref=="Kim 2020" & year==2005, msymbol(none) mlabel(ref) mlabpos(6))

meta_bubble, var(altitude) save(YearlyData_Altitude_woKim) xtitle(Altitude in meters) ///
	addplot(scatteri ///
		0.1 134 `"1964 Graeff"'  ///
		0.87 355 `"1983 Beard"'  ///
		0.4 111 `"1985 Hartley"'  ///
		0.4 120 `"1986 Stenström"'  ///
		0.40 297 `"1994 Fernandez-Calvet"'  ///
		0.82 104 `"2000 Takayanagi"'  ///
		0.48 77 `"2014 Holland"'  ///
		0.67 134 `"2018 Berends"'  ///
		0.93 64	`"2020 Cvasciuc"' ///
		1.3 355 `"2020 Ebbehoj"'  ///
		0.65 64 `"2021 Ebbehoj"'  ///
		0.87 773 `"2021 Leung"' ///
		, msymbol(none) mlabel(ref2) mlabangle(vertical) mlabpos(1) mlabsize(1.5))
