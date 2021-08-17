***** 2_DataExtraction.do *****
/* Data extracted from papers and from publicly available data when necessary. Public sources are cited below. 

Data extraction from figures was done using the online image analysis tool WebPlotDigitizer by Ankit Rohatgi (https://automeris.io/WebPlotDigitizer/index.html). Images and calculations are stored in the Papers folder. 
*/


*** Input data from papers

** Graeff 1964
// Annual population from paper
clear
input year pop cases
1949 9955594 4
1950 10113527 2
1951 10264311 1
1952 10381987 6
1953 10493184 4
1954 10615380 2
1955 10750842 1
1956 10889351 7
1957 11026383 6
1958 11186875 11
end
gen ref = "Graeff 1964"
save "Data/Graeff 1964", replace


** Beard 1983
// average population from paper (45800/year x 10 year periods)
clear
input year_from year_to pop cases
1950 1959 458000 4
1960 1969 458000 3
1970 1979 458000 6
end
gen ref = "Beard 1983"
save "Data/Beard 1984", replace


** Hartley 1985
// Average population from paper
clear
input year pop cases
1970 2000000 0
1971 2000000 3
1972 2000000 1
1973 2000000 4
1974 2000000 0
1975 2000000 4
1976 2000000 2
1977 2000000 4
1978 2000000 3
1979 2000000 8
1980 2000000 1
1981 2000000 5
1982 2000000 3
1983 2000000 7
end
gen ref = "Hartley 1985"
save "Data/Hartley 1985", replace


** Stenström 1986
// annual population from Statistics Sweden (source cited in the paper): http://www.statistikdatabasen.scb.se/pxweb/en/ssd/START__BE__BE0101__BE0101A/BefolkningR1860N/table/tableViewLayout1/
clear 
input year pop cases
1958 7429675 7
1959 7462823 12
1960 7497967 7
1961 7542028 11
1962 7581148 7
1963 7627507 11
1964 7695200 15
1965 7772506 17
1966 7843088 22
1967 7892774 23
1968 7931193 15
1969 8004270 19
1970 8081229 15
1971 8115165 17
1972 8129129 23
1973 8144428 15
1974 8176691 32
1975 8208442 32
1976 8236179 20
1977 8267116 25
1978 8284437 16
1979 8303010 21
1980 8317937 30
1981 8323033 27
end
gen ref = "Stenström 1986"
save "Data/Stenström 1986", replace


** Andersen 1988
// Average population from paper (5000000 x 5 years)
// Note that paper report 47 cases, but 4 were diagnosed before 1977 and should therefore be excluded
clear 
input year_from year_to pop cases
1977 1981 20000000 43
end
gen ref = "Andersen 1988"
save "Data/Andersen 1988", replace


** Fernández-Calvet 1994
// Annual population from paper
clear
input year pop cases 
1980 514291 2
1981 508618 2
1982 514937 2
1983 524300 1
1984 531585 0
1985 537107 1
1986 516668 0
1987 518214 0
1988 527242 0
1989 532007 2
1990 537005 2
1991 522953 1
1992 526216 1
end
gen ref = "Fernandez-Calvet 1994"
save "Data/Fernandez-Calvet 1994", replace


** Takayanagi 2000
/* Population from: https://www.e-stat.go.jp/en/stat-search/files?page=1&layout=datalist&toukei=00200524&tstat=000000090001&cycle=7&year=19970&month=0&tclass1=000001011679

Note that this paper sent out questionnaires to all university hospitals and to internal medicine departments at 2117 randomly selected medium sized hospitals. Based on responses, they extrapolated the results to all 17740 medium sized hospitals in Japan. 
*/
clear 
input year pop cases 
1997 126166000 1030
end
gen ref = "Takayanagi 2000"
save "Data/Takayanagi 2000", replace

** Holland 2014
// Average population from paper (they used the 2001-population 512930 x 10 years)
clear
input year_from year_to pop cases
2001 2010 5129300 24
end
gen ref = "Holland 2014"
save "Data/Holland 2014", replace


** Berends 2018
/* Population from Statistics Netherlands (source mentioned but not cited in paper): https://opendata.cbs.nl/statline/#/CBS/en/dataset/37296eng/table?ts=1623933707525

Number cases were estimated by reading the incidence rates (fig 3) and multiplying by population. This resulted in a slight overestimation of N with 1562 patients compared to 1493 patients reported in the paper.
*/
clear
input year pop cases 
1995 15424122 57
1996 15493889 62
1997 15567107 58
1998 15654192 66
1999 15760225 44
2000 15863950 44
2001 15987075 45
2002 16105285 61
2003 16192572 78
2004 16258032 54
2005 16305526 72
2006 16334210 75
2007 16357992 90
2008 16405399 94
2009 16485787 84
2010 16574989 94
2011 16655799 87
2012 16730348 102
2013 16779575 79
2014 16829289 113
2015 16900726 103
end
gen ref = "Berends 2018"
save "Data/Berends 2018", replace


** Ebbehoj 2020
/* Population from Rochester Epidemiology Project (source cited in paper):
https://rochesterproject.org/for-researchers/population-overview/
Number of cases and years of diagnosis determined by reading incidence rates (fig 1F) and multiplying by population. 
*/
clear
input year pop cases
1995 112443 1
1996 113063 0
1997 114548 0
1998 116931 1
1999 119077 0
2000 124970 1
2001 126954 1
2002 129522 1
2003 131747 0
2004 133908 0
2005 135816 0
2006 138287 0
2007 140508 1
2008 142799 1
2009 144921 1
2010 144507 1
2011 145819 0
2012 146931 0
2013 148918 1
2014 150058 1
2015 151334 0
2016 153183 3
2017 154930 0
end
gen ref = "Ebbehoj 2020"
save "Data/Ebbehoj 2020", replace


** Kim 2020
/* Population from Statistics Korea (source mentioned but not cited in paper):
https://kosis.kr/eng/statisticsList/statisticsListIndex.do?menuId=M_01_01&vwcd=MT_ETITLE&parmTabId=M_01_01&statId=1962001&themaId=#SelectStatsBoxDiv
*/
clear
input year pop cases
2003 47892330 76
2004 48082519 54
2005 48184561 63
2006 48438292 61
2007 48683638 61
2008 49054708 94
2009 49307835 100
2010 49554112 122
2011 49936638 123
2012 50199853 107
2013 50428893 96
2014 50746659 91
end
gen ref = "Kim 2020"
save "Data/Kim 2020", replace


** Cvasciuc 2020
clear 
input year pop cases
2010 1800000 6
2011 1800000 8
2012 1800000 8
2013 1800000 7
2014 1800000 12
2015 1800000 14
2016 1800000 10
2017 1800000 9
2018 1800000 11
end
gen ref = "Cvasciuc 2020"
save "Data/Cvasciuc 2020", replace


** Ebbehoj 2021
/* Population from Statistics Denmark (source cited in paper): 
https://www.statbank.dk/statbank5a/default.asp?w=1920
*/
clear
input year pop cases
1977 5079879 6
1978 5096959 7
1979 5111537 8
1980 5122065 9
1981 5123989 8
1982 5119155 9
1983 5116464 9
1984 5112130 11
1985 5111108 6
1986 5116273 14
1987 5124794 9
1988 5129254 17
1989 5129778 7
1990 5135409 14
1991 5146469 12
1992 5162126 7
1993 5180614 6
1994 5196642 12
1995 5215718 10
1996 5251027 10
1997 5275121 12
1998 5294860 17
1999 5313577 12
2000 5330020 15
2001 5349212 21
2002 5368354 12
2003 5383507 13
2004 5397640 15
2005 5411405 12
2006 5427459 19
2007 5447084 16
2008 5475791 19
2009 5511451 23
2010 5534738 26
2011 5560628 22
2012 5580516 26
2013 5602628 27
2014 5627235 33
2015 5659715 36
end
gen ref = "Ebbehoj 2021"
save "Data/Ebbehoj 2021", replace


** Leung 2021
// Population from paper (in supplementary)
clear
input year pop cases
2012 3910117 30
2013 4068062 34
2014 4228125 37
2015 4354660 34
2016 4449483 34
2017 4529842 32
2018 4598089 38
end
gen ref = "Leung 2021"
save "Data/Leung 2021", replace