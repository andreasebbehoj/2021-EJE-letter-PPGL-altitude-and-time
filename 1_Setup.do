***** 1_Setup.do *****
** Folders
capture: mkdir Data
capture: mkdir Output

** General
set scheme s2color
grstyle init graphlayout, replace
grstyle set plain // No plot region color, white background + other tweaks

** Size
grstyle set graphsize 1200pt 1200pt // in pixels, default is 5.5 inches *72 pt/inch = 396pt
grstyle set symbolsize small
grstyle set size 40pt: axis_title // X and Y axis text size

** Axis
grstyle anglestyle vertical_tick horizontal // Horizontal "tick"text on y-axis
grstyle color major_grid gs11 // colour of horizontal lines


** Colors
colorpalette plottig, nograph 
forvalues x = 1/15 {
	global color_`x' = "`r(p`x')'"
}


*** Program to format p-value
capture: program drop pval_tostring
program define pval_tostring, rclass	
syntax, pval(string)

* Format p-val
if `pval'>0.99 {
	return local pvalstring = ">0.99"
}
if inrange(`pval', 0.05, 0.99) {
	return local pvalstring = "=" + string(round(`pval', 0.01), "%4.2f")
}
if `pval'>=0.001 & `pval'<0.05 {
	return local pvalstring = "=" + string(round(`pval', 0.001), "%4.3f")
}
if `pval'<0.001 {
	return local pvalstring = "<0.001"
}
end