
* DiD_Analysis.do
* date: 2025-05-15

clear all
set more off

* 0. define the 6 study districts (uppercase and stripped)

local districts "NANKANA SAHIB" "BAHAWALPUR" "RAHIM YAR KHAN" "JHANG" "ATTOCK" "SAHIWAL"

* 1.import and clean pre-flood data (2005, 2006, 2007, 2009)

import delimited using "PunjabDevStatsPreFloods.csv", clear varnames(1) encoding(utf8)
replace dist_nm = upper(strtrim(dist_nm))
rename Year year
destring year, replace force
keep if inlist(string(year), "2005", "2006", "2007", "2009")
keep dist_nm Total_Enrolment year
rename Total_Enrolment enrol
keep if inlist(dist_nm, `"`districts'"')
assert enrol > 0
duplicates report dist_nm year
tempfile preflood
save `preflood', replace

* 2.import & clean 2010 school-level data
import delimited using "census_2010.csv", clear varnames(1) encoding(utf8)
replace dist_nm = upper(strtrim(dist_nm))
keep dist_nm enrol
collapse (sum) enrol, by(dist_nm)
gen year = 2010
keep if inlist(dist_nm, `"`districts'"')
assert enrol > 0
duplicates report dist_nm year
tempfile t2010
save `t2010', replace

* 3.Import & clean 2011 school-level data
import delimited using "census_2011.csv", clear varnames(1) encoding(utf8)
replace dist_nm = upper(strtrim(dist_nm))
keep dist_nm enrol
collapse (sum) enrol, by(dist_nm)
gen year = 2011
keep if inlist(dist_nm, `"`districts'"')
assert enrol > 0
duplicates report dist_nm year
tempfile t2011
save `t2011', replace

* 4.build full panel: pre-flood + 2010 + 2011
use `preflood', clear
append using `t2010'
append using `t2011'
sort dist_nm year
save full_panel_clean.dta, replace

* 5.creating DiD variables
gen treated     = inlist(dist_nm, "NANKANA SAHIB", "BAHAWALPUR", "RAHIM YAR KHAN")
gen post        = (year == 2011)
gen treat_post  = treated * post
label variable enrol "Total Enrollment"
label variable treated "Flood-Affected (Treatment)"
label variable post "Post-2010 Period"
label variable treat_post "Treatment × Post (DiD term)"

* 6.main DiD regression
regress enrol treated##post, vce(cluster dist_nm)
estimates store did_main

* 7.parallel Trends (falsification tests)
foreach y in 2006 2007 2009 {
    preserve
        keep if year == 2005 | year == `y'
        gen post`y' = (year == `y')
        regress enrol treated##post`y', vce(cluster dist_nm)
        estimates store falsif`y'
    restore
}

save "/Users/asfandiyarsafi/Desktop/SPROJ/full_panel_clean.dta", replace

* 8. end of do file
