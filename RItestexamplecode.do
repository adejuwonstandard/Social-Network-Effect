***** Examples using ritest to try it out *************
*** Used in Development Impact blogpost

**** Example 1: McKenzie (2017, AER, Business Plan Competition)
use "Nigeriablogdata.dta", clear

* Truncated profits in round 2
* Specification in paper
areg s_prof_trunc assigntreat, a(strata) robust
* RI test with 1000 replications 
ritest assigntreat _b[assigntreat], reps(1000) seed(125) strata(strata): areg s_prof_trunc assigntreat, a(strata) robust
ritest assigntreat _b[assigntreat], reps(5000) strata(strata) seed(123): areg s_prof_trunc assigntreat, a(strata) robust

* Example 2: panel data regression, to illustrate clustering at individual level with repeated measures.
***** Pooling Round 2 and Round 3 post-treatment data ******************
gen prof_trunc2=s_prof_trunc
gen prof_trunc3=t_prof_trunc
gen uid=_n
keep uid prof_trunc2 prof_trunc3 group existing assigntreat strata
reshape long prof_trunc ,i(uid) j(time) 

gen time3=time==3

areg prof_trunc assigntreat time3 if group<=2 & existing==1, a(strata) robust cluster(uid)
ritest assigntreat _b[assigntreat], reps(1000) strata(strata) cluster(uid) seed(124): areg prof_trunc assigntreat time3 if group<=2 & existing==1, a(strata) robust cluster(uid)
ritest assigntreat _b[assigntreat], reps(5000) strata(strata) cluster(uid) seed(124): areg prof_trunc assigntreat time3 if group<=2 & existing==1, a(strata) robust cluster(uid)


**** Example 3: Iacovone and McKenzie on supply chain shortening - clustered randomization, with 63 clusters
use "clusterColombia.dta", clear
areg dayscorab b_treat b_dayscorab miss_b_dayscorab round2 round3, cluster(b_block) a(b_pair)
ritest b_treat _b[b_treat], reps(5000) cluster(b_block) strata(b_pair) seed(546): areg dayscorab b_treat b_dayscorab miss_b_dayscorab round2 round3, cluster(b_block) a(b_pair)
* using the t-stat instead of coefficient for comparison
ritest b_treat _b[b_treat]/_se[b_treat], reps(5000) cluster(b_block) strata(b_pair) seed(546): areg dayscorab b_treat b_dayscorab miss_b_dayscorab round2 round3, cluster(b_block) a(b_pair)


