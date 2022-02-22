****************************************************					2010						****************************************************

		***********INSTRUCTIONS ARE IN GREEN****************
		*NOTE: FOR EACH FILE OPEN, ENSURE YOU SAVE BEFORE OPENING ANOTHER ONE
			
			
*i) Combine necessary variables in cropsales file
*A) JOIN CROP SALES DATASETS WITH 0 BASELINE and 1 MIDLINE
  use  "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\CROP_SALES_1_men.dta", clear
 
 *B) rename where crop was sold
 ren q14_where_sale where_crop_was_sold
 
 *C) rename total income proxy as market_participation rate
 ren  q13e_total_income market_part_rate
 ren q13b_quantity_sold Qty_sold
 ren q13c_quantity_unit Qty_unit
 ren q13d_price_per_unit sellingprice
 ren q11_crops_one_sale crops_1_sale
 *D) rename "how long in hour" as Market Distance (hours)
 rename q16_how_long_hours Market_Distance
 
 *E) rename "mode of transport" as Mode of transport
 ren q15_mode_of_transport Mode_of_transport
 
 *F) drop unwanted variables
  drop q16_how_long_minutes survey_code q12_sale_number q13a_month
  sort household

  
  
 *A)
 use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_CROP_SALES_1_f2.dta", clear
 
 *B)
*ren where crop was sold
 ren q14_where_sale_f2 where_crop_was_sold
 
 *C) rename total_income proxy as market_participation rate
 ren q13e_total_income_f2 market_part_rate
  ren q13b_quantity_sold_f2 Qty_sold
 ren q13c_quantity_unit_f2 Qty_unit
 ren q13d_price_per_unit_f2 sellingprice
 ren q11_crops_one_sale_f2 crops_1_sale
 *D) renmae "how long in hour" as Market Distance (hours)
 rename q16_how_long_hours_f2 Market_Distance
 
 
 *E) rename "mode of transport" as Mode of transport
 ren q15_mode_of_transport_f2 Mode_of_transport 
 
 *F) RENAME OTHER VARIABLES
 ren kebele_f2 kebele
 ren ftc_gote_f2 ftc_gote
 ren household_f2 household
 ren region_f2 region
 ren zone_f2 zone
 ren woreda_f2 woreda
 *G) KEEP IMPORTANT VARIABLES
 drop q16_how_long_minutes q12_sale_number_f2 q13a_month_f2 sr_no
 
 *DROP DUPLICATE(WE USE TEFF TO DELETE DUPLICATES OF HOUSEHOLD ID SINCE TEFF HAS THE HIGHEST QTY SOLD)
 sort household
 *JOINED FILE
 use "C:\Users\User\Desktop\data1\cropsales2010.dta", clear

 append using "C:\Users\User\Desktop\data1\cropsales_2012.dta", generate(year) force
 sort household
gen id=_n
 *OTHER ADJUSTMENTS
 drop type_of_household_f2
 
 
 *END OF CROP SALES FILE*
 ***********************************************************
  
 use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\AGRICULTURAL_PRODUCTION_IN_BELG_men.dta", clear

 *A) Rename
ren q20_improved_seed Improved_seed
ren q19_crop b_type_of_crop
ren q19_area_planted b_Farm_size
ren q19_area_unit b_Farm_unit
ren q19_season_qty b_Qty_produced
ren q19_qty_unit b_Qty_unit
ren q19_total_value b_value_of_crops_produced
ren q21_source_of_seed b_source_of_seed
ren q22_amount_spent_on_seeds b_seed_exp
ren q25_type_of_irrigation b_irrigation1
*B) ren the proxies, replace observations and generate new variables
ren q23_amount_of_dap_birr_value value_of_dap
ren q24_amount_of_urea_birr_value value_of_urea
replace value_of_dap=0 if value_of_dap==999 
replace value_of_urea=0 if value_of_urea==999 
gen b_fertilizer_exp=value_of_dap+value_of_urea
gen b_use_fertlizer=b_fertilizer_exp>=1
replace b_seed_exp=0 if b_seed_exp==999
gen b_Expenditure_input=b_fertilizer_exp+b_seed_exp
sort household
duplicates drop household ftc_gote, force
*DROP IRRELEVANT VARIABLES
drop survey_code q15_parcel_number q16_plot_number q17_leased_status q18_land_use q23_amount_of_dap_qty q23_amount_of_dap_qty_unit q24_amount_of_urea_qty q24_amount_of_urea_qty_unit q25_type_of_irrigatiop q25_type_of_irrigatioo q26_how_many_years q27_used_pesticides q27_used_pesticidet q28_long_term_investments1 q28_long_term_investments2

use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_AGRICULTURAL_PRODUCTION_IN_BELG_F2.dta", clear
 *A) Rename
ren q20_improved_seed_f2 Improved_seed
ren q19_crop_f2 b_type_of_crop
ren q19_area_planted_f2 b_Farm_size
ren q19_area_unit_f2 b_Farm_unit
ren q19_season_qty_f2 b_Qty_produced
ren q19_qty_unit_f2 b_Qty_unit
ren q19_total_value_f2 b_value_of_crops_produced
ren q21_source_of_seed_f2 b_source_of_seed
ren q22_amount_spent_on_seeds_f2 b_seed_exp
ren q25_type_of_irrigation_f2 b_irrigation1
*B) ren the proxies, replace observations and generate new variables
ren q23_amount_of_dap_birr_value_f2 value_of_dap
ren q24_amount_of_urea_birr_value_f2 value_of_urea
replace value_of_dap=0 if value_of_dap==999 
replace value_of_urea=0 if value_of_urea==999 
gen b_fertilizer_exp=value_of_dap+value_of_urea
gen b_use_fertlizer=b_fertilizer_exp>=1
replace b_seed_exp=0 if b_seed_exp==999
gen b_Expenditure_input=b_fertilizer_exp+b_seed_exp
ren region_f2 region
ren zone_f2 zone
ren woreda_f2 woreda
ren kebele_f2 kebele
ren ftc_gote_f2 ftc_gote
ren household_f2 household
sort household
duplicates drop household ftc_gote, force
*DROP IRRELEVANT VARIABLES
drop sr_no q15_parcel_number_f2 q16_plot_number_f2 q17_leased_status_f2 q18_land_use_f2 q23_amount_of_dap_qty_f2 q23_amount_of_dap_qty_unit_f2 q24_amount_of_urea_qty_f2 q24_amount_of_urea_qty_unit_f2 q26_how_many_years_f2 q27_used_pesticides_f2 q28_long_term_investments1_f2 q28_long_term_investments2_f2 type_of_household_f2
 *JOINED FILE
 use "C:\Users\User\Desktop\data1\belg2010.dta", clear

 append using "C:\Users\User\Desktop\data1\belg2012.dta", generate(year) force
 sort household
gen id=_n
**********************************************************************
use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\AGRICULTURAL_PRODUCTION_IN_MEHER_men.dta", clear
 *A) Rename
ren q6_improved_seed m_Improved_seed
ren q5_crop m_type_of_crop
ren q5_area_planted m_Farm_size
ren q5_area_unit m_Farm_unit
ren q5_season_qty m_Qty_produced
ren q5_qty_unit m_Qty_unit
ren q5_total_value m_value_of_crops_produced
ren q7_source_of_seed m_source_of_seed
ren q8_amount_spent_on_seeds m_seed_exp
ren q11_type_of_irrigation m_irrigation1
*B) ren the proxies, replace observations and generate new variables
ren q9_amount_of_dap_birr_value mvalue_of_dap
ren q10_amount_of_urea_birr_value mvalue_of_urea
replace mvalue_of_dap=0 if mvalue_of_dap==999 
replace mvalue_of_urea=0 if mvalue_of_urea==999 
gen m_fertilizer_exp=mvalue_of_dap+mvalue_of_urea
gen m_use_fertlizer=m_fertilizer_exp>=1
replace m_seed_exp=0 if m_seed_exp==999
gen m_Expenditure_input=m_fertilizer_exp+m_seed_exp
sort household
duplicates drop household ftc_gote, force
*DROP IRRELEVANT VARIABLES
drop survey_code q1_parcel_number q2_plot_number q3_leased_status q4_land_use q9_amount_of_dap_qty q9_amount_of_dap_qty_unit q10_amount_of_urea_qty q10_amount_of_urea_qty_unit q11_type_of_irrigatiop q11_type_of_irrigatioo q12_how_many_years q13_used_pesticides q13_used_pesticidet q14_long_term_investments1 q14_long_term_investments2


use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_AGRICULTURAL_PRODUCTION_IN_MEHER_F2.dta", clear
 *A) Rename
ren q6_improved_seed_f2 m_Improved_seed
ren q5_crop_f2 m_type_of_crop
ren q5_area_planted_f2 m_Farm_size
ren q5_area_unit_f2 m_Farm_unit
ren q5_season_qty_f2 m_Qty_produced
ren q5_qty_unit_f2 m_Qty_unit
ren q5_total_value_f2 m_value_of_crops_produced
ren q7_source_of_seed_f2 m_source_of_seed
ren q8_amount_spent_on_seeds_f2 m_seed_exp
ren q11_type_of_irrigation_f2 m_irrigation1
*B) ren the proxies, replace observations and generate new variables
ren q9_amount_of_dap_birr_value_f2 mvalue_of_dap
ren q10_amount_of_urea_birr_value_f2 mvalue_of_urea
replace mvalue_of_dap=0 if mvalue_of_dap==999 
replace mvalue_of_urea=0 if mvalue_of_urea==999 
gen m_fertilizer_exp=mvalue_of_dap+mvalue_of_urea
gen m_use_fertlizer=m_fertilizer_exp>=1
replace m_seed_exp=0 if m_seed_exp==999
gen m_Expenditure_input=m_fertilizer_exp+m_seed_exp
sort household
duplicates drop household ftc_gote, force
*DROP IRRELEVANT VARIABLES
drop sr_no q1_parcel_number_f2 q2_plot_number_f2 q3_leased_status_f2 q4_land_use_2 q9_amount_of_dap_qty_f2 q9_amount_of_dap_qty_unit_f2 q10_amount_of_urea_qty_f2 q10_amount_of_urea_qty_unit_f2 q12_how_many_years_f2 q13_used_pesticides_f2 q13_used_pesticidet_f2 q14_long_term_investments1_f2 q14_long_term_investments2_f2 type_of_household_f2
ren region_f2 region
ren zone_f2 zone
ren woreda_f2 woreda
ren kebele_f2 kebele
ren ftc_gote_f2 ftc_gote
ren household_f2 household

*JOINED FILE
 use "C:\Users\User\Desktop\data1\mehr2010.dta", clear

 append using "C:\Users\User\Desktop\data1\mehr2012.dta", generate(year) force
 sort household
gen id=_n

*END OF PRODUCTION FILE*
********************************************************************
use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\NETWORKS1_men.dta", clear

*A) Rename "How many people do you talk to to share information"

ren q1_how_many_people Share_of_information

*B) Drop unnecessary variables
drop survey_code
sort household
 use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_NETWORKS1_f2.dta", clear

*A) Rename "How many people do you talk to to share information as share_of_information"

ren q1_how_many_people_f2 Share_of_information
ren kebele_f2 kebele
ren ftc_gote_f2 ftc_gote
ren household_f2 household
ren region_f2 region
ren zone_f2 zone
ren woreda_f2 woreda
*B) Drop unnecessary variables
drop type_of_household_f2
sort household
 
 *JOIN DATASET FOR SHARE OF INFO FOR BASE- & MIDLINE
 use "C:\Users\User\Desktop\data1\2010men_network.dta", clear
 append using "C:\Users\User\Desktop\data1\\2012men_network.dta", generate(year) force
sort household
gen id=_n
*END OF NETWORK*
************************************************************
use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\SAVINGS_AND_RISK_men.dta", clear
ren q14_training_credit_mngmnt training_credit_mngmnt 
ren q1_bank_account_mfi have_bank_acc
ren q5_cash_savings savings_other_mfi
ren q9_member_of_eqqub member_eqqub
ren q10_member_of_iddir member_iddir
ren q11_member_rural_savings member_coop
*A) Drop unnecessary Variables
keep region zone woreda kebele ftc_gote household training_credit_mngmnt have_bank_acc savings_other_mfi member_eqqub member_iddir member_coop
sort household

use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_SAVINGS_AND_RISK_f2.dta",clear
ren Q14_TRAINING_CREDIT_MNGMNT training_credit_mngmnt 
ren Q1_BANK_ACCOUNT_MFI have_bank_acc
ren Q5_CASH_SAVINGS savings_other_mfi
ren Q9_MEMBER_OF_EQQUB member_eqqub
ren Q10_MEMBER_OF_IDDIR member_iddir
ren Q11_MEMBER_RURAL_SAVINGS member_coop
ren KEBELE kebele
ren FTC_GOTE ftc_gote
ren HOUSEHOLD household
ren REGION region
ren ZONE zone
ren WOREDA woreda
*A) Drop unnecessary Variables
keep region zone woreda kebele ftc_gote household training_credit_mngmnt member_coop member_iddir member_eqqub savings_other_mfi have_bank_acc
sort household
*JOIN BASELINE TO MIDLINE
use "C:\Users\User\Desktop\data1\riskshare_2010.dta", clear
append using "C:\Users\User\Desktop\data1\risksharemen_2012.dta", generate(year) force
sort household
gen id=_n

*END OF RISK-SHARE
************************************************************
use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\INTERVIEW_INFORMATION_men.dta", clear
keep fif_membership region zone woreda kebele ftc_gote household



*APPEND
use "C:\Users\User\Desktop\data1\fif_membership2010.dta", clear
append using "C:\Users\User\Desktop\data1\fif_membership2012.dta",generate(year) force
sort household
gen id=_n
 **********************************************************
use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\CREDIT_men.dta", clear
*A) Drop unnecessary Variables
keep q1_taken_loan region zone woreda kebele ftc_gote household 
*B) Rename
ren q1_taken_loan Credit_access
sort household

use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_CREDIT_f2.dta", clear


*B) Rename variable
ren q1_taken_loan_f2 Credit_access
ren kebele_f2 kebele
ren ftc_gote_f2 ftc_gote
ren household_f2 household
ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
keep  Credit_access region zone woreda kebele ftc_gote household
sort household

*JOIN BASELINE_MIDLINE
use "C:\Users\User\Desktop\data1\Credit_access2010.dta"
append using "C:\Users\User\Desktop\data1\credit_access2012.dta",generate(year) force
sort household
gen id=_n

*END OF CREDIT ACCESS
************************************************************

use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\BUSINESS_ACTIVITY1_men.dta", clear
*A) Drop unnecessary Variables
keep q1_other_income_acts region zone woreda kebele ftc_gote household 
*B) Rename
ren q1_other_income_acts income_from_other_businesses
sort household
use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_BUSINESS_ACTIVITY1_f2.dta", clear

*B) Rename variable
ren q1_other_income_acts_f2 income_from_other_businesses
ren kebele_f2 kebele
ren ftc_gote_f2 ftc_gote
ren household_f2 household
ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
*A) Drop unnecessary variable
keep income_from_other_businesses region zone woreda kebele ftc_gote  household
sort household
*JOIN BASE-MIDLINE
 use "C:\Users\User\Desktop\data1\income_from_other_buz2010.dta", clear
 append using "C:\Users\User\Desktop\data1\income_from_other_buz2012.dta", generate(year) force
sort household
gen id=_n

*END OF INCOME FROM OTHER BUSINESS
************************************************************
use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\FARMER_INNOVATION_FUND_men.dta", clear
 
 *A) Rename
ren q45_size_fif_grouq size_of_fifgroup
ren q57_level_of_participatioo level_of_participation
 ren q55_pple_already_friendt Friends_in_fifgroup
 ren q61_get_farming_advicf farming_advise
 ren q43_proposal_acceptee fif_non_fif
 ren q60_how_much_moare how_much_group
 ren q59_receive_cash_goodt receive_goods_cash
	replace receive_goods_cash=0 if receive_goods_cash==999
	gen receive_cash_goods= 1
 replace receive_cash_goods=0 if receive_goods_cash<1
 *B) KEEP
 keep region zone woreda kebele ftc_gote household size_of_fifgroup level_of_participation Friends_in_fifgroup farming_advise receive_cash_goods fif_non_fif how_much_group
 sort household
 label variable receive_cash_goods "receive_cash_goods_from_group"
label values receive_cash_goods receive_cash_goods
label define receive_cash_goods 1 "Yes" 0 "No"

 
 
 use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_FARMER_INNOVATION_FUND_f2_new.dta", clear
 
 *A) Rename
 ren kebele_f2 kebele
 ren ftc_gote_f2 ftc_gote
 ren household_f2 household
 ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
ren q45_size_fif_grouq_f2 size_of_fifgroup
ren q43_proposal_acceptee_f2 fif_non_fif
ren q43aa_group_receive_morad_f2 your_group_receive
 egen how_much_group=rowtotal(q43a_recived_moard_f2 q43b_recived_other_f2 q43c_how_much_did_your_receive_f)
 ren q55_pple_already_friendt_f2 Friends_in_fifgroup
 ren q61_get_farming_advicf_f2 farming_advise
 ren q59_receive_cash_goodt_f2 receive_cash_goods
 *B) DROP 
 keep region zone woreda kebele ftc_gote household size_of_fifgroup receive_cash_goods Friends_in_fifgroup farming_advise fif_non_fif your_group_receive how_much_group
 sort household
 *Label
 label variable receive_cash_goods "receive_cash_goods_from_group"
 label values receive_cash_goods receive_cash_goods
 label define receive_cash_goods 1 "Yes" 0 "No"
  label drop q59_receive_cash_goodt_f2
	recode receive_cash_goods(2=0)

 *JOIN BASE-MIDLINE
  use "C:\Users\User\Desktop\data1\fif2010.dta", clear

 append using "C:\Users\User\Desktop\data1\fif2012.dta", generate(year) force
 sort household
 gen id=_n
 *END OF FIF FILE
 *********************************************************
 
 use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\FARMER_TRAINING_CENTER_men.dta", clear
  
 *A) Rename
ren q16_participate_in_ftc FARMER_TRAINING
 *B) keep necessary Variables
 keep region zone woreda kebele ftc_gote household FARMER_TRAINING
 sort household
 use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_FARMER_TRAINING_CENTER_f2.dta", clear
 
  *A) Rename
ren q16_participate_in_ftc_f2 FARMER_TRAINING
 ren kebele_f2 kebele
 ren ftc_gote_f2 ftc_gote
 ren household_f2 household
ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
 
 *B) keep necessary Variables
 keep region zone woreda kebele ftc_gote household FARMER_TRAINING
 sort household
 *JOIN BASE-MIDLINE
 use "C:\Users\User\Desktop\data1\FARMER_TRAINING2010.dta"

 append using "C:\Users\User\Desktop\data1\farmer_training2012.dta", generate(year) force
sort household
 gen id=_n
 
 *END OF FARMER TRAINING FILE
 ********************************************************
use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\GROUP_PARTICIPATION1_men.dta", clear
  *A) Drop unnecessary Variables
keep region zone woreda kebele ftc_gote household q1_participate_in_groups
 *B) Rename
ren q1_participate_in_groups participation_in_farminggroups
 
 use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_GROUP_PARTICIPATION1_f2.dta", clear
 
 *A) Rename variable
ren q1_participate_in_groups_f2 participation_in_farminggroups
 ren kebele_f2 kebele
 ren ftc_gote_f2 ftc_gote
 ren household_f2 household
 ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
 *B) Drop unnecessary variable
keep participation_in_farminggroups region zone woreda kebele ftc_gote household
sort household
*JOIN BASE-MIDLINE
use "C:\Users\User\Desktop\data1\part_in_farminggroups2010.dta"

 append using "C:\Users\User\Desktop\data1\part_in_farminggroups2012.dta", generate(year) force
sort household
 gen id=_n
*END OF FARMING GROUP PARTICIPATION
***********************************************************
use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\USE_OF_EXTENSION_SERVICES_men.dta", clear
 *A) Rename
 ren q2_vegtble_horticulture use_vegetable_horticulture
 ren q3_field_crops use_field_crop
 ren q4_small_livestock use_small_livestock
 ren q5_large_livestock use_large_livestock
 ren q6_ntrl_rsrce_mngmnt natural_resource_mgt
 ren q8_visit_how_often Neigh_interaction
 
 *B) KEEP IMPORTANT VARIABLES
 keep region zone woreda kebele ftc_gote household Neigh_interaction natural_resource_mgt use_large_livestock use_small_livestock use_field_crop use_vegetable_horticulture
 sort household
 
 
use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_USE_OF_EXTENSION_SERVICES_f2.dta",clear
 *A) Rename
 ren kebele_f2 kebele
 ren ftc_gote_f2 ftc_gote
 ren household_f2 household
  ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
 ren q2_vegtble_horticulture_f2 use_vegetable_horticulture
 ren q3_field_crops_f2 use_field_crop
 ren q4_small_livestock_f2 use_small_livestock
 ren q5_large_livestock_f2 use_large_livestock
 ren q6_ntrl_rsrce_mngmnt_f2 natural_resource_mgt
 ren q8_visit_how_often_f2 Neigh_interaction
 
 *B) KEEP IMPORTANT VARIABLES
 keep region zone woreda kebele ftc_gote household Neigh_interaction natural_resource_mgt use_large_livestock use_small_livestock use_field_crop use_vegetable_horticulture
 sort household
 *JOIN BASE-MIDLINE
 use "C:\Users\User\Desktop\data1\extension2010.dta"

 append using "C:\Users\User\Desktop\data1\extension2012.dta", generate(year) force
sort household
 gen id=_n

*END OF EXTENSION SERVICES FILE ************************************************************
 use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\FAMILY_HISTORY_men.dta", clear

  ren q1b10_fathers_education Head_Education_level
keep Head_Education_level region zone woreda kebele ftc_gote household
sort household

  use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_FAMILY_HISTORY_f2.dta"
ren kebele_f2 kebele
ren ftc_gote_f2 ftc_gote
ren household_f2 household
 ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
keep region zone woreda kebele ftc_gote household
sort household

  use "C:\Users\User\Desktop\data1\education2010.dta", clear
 append using "C:\Users\User\Desktop\data1\education2012.dta", generate(year) force
sort household
 gen id=_n
  
  *END OF HEAD EDUCATION
  **********************************************************
  
  ******************************************************
 ***********************************************************
 use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\LAND_CHARACTERISTICS_AND_TENURE_men.dta", clear

 ren q7_slope land_slope
 ren q8_soil_quality soil_quality
 ren q6_agro_ecology agro_ecology
 ren q5_walking_time walking_time
 keep land_slope soil_quality agro_ecology walking_time region zone woreda kebele ftc_gote household
 
 use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_LAND_CHARACTERISTICS_AND_TENURE_f2.dta", clear
 ren q7_slope_f2 land_slope
 ren q8_soil_quality_f2 soil_quality
 ren q6_agro_ecology_f2 agro_ecology
 ren q5_walking_time_f2 walking_time
 ren kebele_f2 kebele 
 ren ftc_gote_f2 ftc_gote
 ren household_f2 household
 ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
 keep land_slope soil_quality agro_ecology walking_time region zone woreda kebele ftc_gote household
 
 *JOIN BASE-MIDLINE
 use "C:\Users\User\Desktop\data1\land2010.dta", clear

. append using "C:\Users\User\Desktop\data1\land2012.dta", generate(year) force
sort household
 gen id=_n
 
*END OF LANDPROFILE ************************************************************
************************************************************
 use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\NEW_AGRICULTURAL_ACTIVITIES_men.dta", clear
ren q19_tried_new_actu new_agric_tech
ren q22_new_crop_techniqueu new_crop_tech
ren q25_new_livestock_technis new_livestock_tech
 ren q28_tried_new_methodu new_farming_method
 ren q31_new_marketing_approacj new_market_approach
 ren q34_new_natural_resourcg new_naturalres_mgt
 keep region zone woreda kebele ftc_gote household new_agric_tech new_crop_tech new_livestock_tech new_farming_method new_market_approach new_naturalres_mgt
 
 use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_NEW_AGRICULTURAL_ACTIVITIES_f2.dta", clear
 ren q19_tried_new_actv_f2 new_agric_tech
ren q22_new_crop_technique_f2 new_crop_tech
ren q25_new_livestock_technis_f2 new_livestock_tech
 ren q28_tried_new_methodu_f2 new_farming_method
 ren q31_new_marketing_approacj_f2 new_market_approach
 ren q34_new_natural_resourc_f2 new_naturalres_mgt
 ren kebele_f2 kebele 
 ren ftc_gote_f2 ftc_gote
 ren household_f2 household
 ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
 keep region zone woreda kebele ftc_gote household new_agric_tech new_crop_tech new_livestock_tech new_farming_method new_market_approach new_naturalres_mgt
 
 *JOIN BASELINE-MIDLINE
 use "C:\Users\User\Desktop\data1\tech2010.dta"

 append using "C:\Users\User\Desktop\data1\tech2012.dta", generate(year) force
 sort household
gen id = _n
 
 *END OF TECH FILE*
 ********************************************************
 use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\OWNERSHIP_OF_PRODUCTION_EQUIP_men.dta", clear

  ren q3_total_value_in_birr value_production_asset
  keep region zone woreda kebele ftc_gote household value_production_asset
 
 use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_OWNERSHIP_OF_PRODUCTION_EQUIP_f2.dta", clear
ren q3_total_value_in_birr_f2 value_production_asset
ren kebele_f2 kebele 
 ren ftc_gote_f2 ftc_gote
 ren household_f2 household
 ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
 keep region zone woreda kebele ftc_gote household value_production_asset
 
 *JOIN BASE-MIDLINE
 use "C:\Users\User\Desktop\data1\prod_asset2010.dta", clear

 append using "C:\Users\User\Desktop\data1\prod_asset2012.dta", generate(year) force
 sort household
 gen id=_n
 *END OF PRODUCTION ASSET
 ***********************************************************
  use "C:\Users\User\Desktop\2010_stata\ETH_2010_FIFIE-BL_v01_M_Stata8\TRANSFERS1_men.dta", clear
ren q1_received_income relative_support
keep region zone woreda kebele ftc_gote household relative_support

use "C:\Users\User\Desktop\2012_stata\ETH_2012_FIFIE-ML_v01_M_Stata8\M_TRANSFERS1_f2.dta", clear

ren q1_received_income_f2 relative_support
ren kebele_f2 kebele 
 ren ftc_gote_f2 ftc_gote
 ren household_f2 household
 ren region_f2 region 
ren zone_f2 zone 
ren woreda_f2 woreda
keep region zone woreda kebele ftc_gote household relative_support

*JOIN BASE-MIDLINE
use "C:\Users\User\Desktop\data1\relativesupport_2010.dta", clear

 append using "C:\Users\User\Desktop\data1\relativesupport_2012.dta", generate(year) force
 sort household
 gen id=_n	  
	  
	  *MERGING ALL THE SLICED FILED TOGETHER
  **********************************************************
  use "C:\Users\User\Desktop\file\fif_file.dta", clear
  merge m:m household using "C:\Users\User\Desktop\file\cropsale.dta", nogen update
  merge m:m household using "C:\Users\User\Desktop\file\extension_file.dta", nogen update
  merge m:m household using "C:\Users\User\Desktop\file\credit_access.dta", nogen update
   merge m:m household using"C:\Users\User\Desktop\file\farmers_part_training.dta", nogen update
   merge m:m household using "C:\Users\User\Desktop\file\head_education.dta", nogen update
   merge m:m household using "C:\Users\User\Desktop\file\income_from_other_buz.dta", nogen update
   merge m:m household using "C:\Users\User\Desktop\file\land.dta", nogen update
   merge m:m household using "C:\Users\User\Desktop\file\livestock.dta", nogen update
   merge m:m household using "C:\Users\User\Desktop\file\part_in_farminggroups.dta", nogen update
    merge m:m household using "C:\Users\User\Desktop\file\prod_asset.dta", nogen update
    merge m:m household using "C:\Users\User\Desktop\file\BELGFILE.dta", nogen update
	merge m:m household using "C:\Users\User\Desktop\file\MEHRFILE.dta", nogen update
    merge m:m household using "C:\Users\User\Desktop\file\relativesupport.dta", nogen update
   merge m:m household using "C:\Users\User\Desktop\file\riskshare.dta", nogen update
   merge m:m household using "C:\Users\User\Desktop\file\shareinfo.dta", nogen update
   merge m:m household using "C:\Users\User\Desktop\file\tech.dta", nogen update

  
  
  
  *rename long variables
  ren participation_in_farminggroups part_in_farmgroup
ren income_from_other_businesses inc_other_biz
	*ARRANGE VARIABLES
 order id year household how_much_group TREATMENT your_group_receive  fif_non_fif region ftc_gote market_part_rate crops_1_sale Qty_sold Qty_unit sellingprice receive_cash_goods Neigh_interaction FARMER_TRAINING size_of_fifgroup Friends_in_fifgroup level_of_participation part_in_farmgroup farming_advise relative_support have_bank_acc savings_other_mfi member_eqqub member_iddir member_coop training_credit_mngmnt Share_of_information Head_Education_level inc_other_biz Credit_access walking_time agro_ecology land_slope soil_quality where_crop_was_sold Mode_of_transport Market_Distance use_vegetable_horticulture use_field_crop use_small_livestock use_large_livestock natural_resource_mgt new_agric_tech new_crop_tech new_livestock_tech new_farming_method new_market_approach new_naturalres_mgt livestock_owned livestock_qty_sold value_production_asset b_type_of_crop b_Farm_size b_Farm_unit b_Qty_produced b_Qty_unit b_value_of_crops_produced Improved_seed b_source_of_seed b_seed_exp value_of_dap value_of_urea b_irrigation1 b_fertilizer_exp b_use_fertlizer b_Expenditure_input m_type_of_crop m_Farm_size m_Farm_unit m_Qty_produced m_Qty_unit m_value_of_crops_produced m_Improved_seed m_source_of_seed m_seed_exp mvalue_of_dap mvalue_of_urea m_irrigation1 m_fertilizer_exp m_use_fertlizer m_Expenditure_input, first
 
  *FIRST, WE ARE INTERESTED IN THOSE WHOSE APPLICATIONS ARE ACCEPTED TO SUBMIT PROPOSAL
   drop if fif_non_fif==999
   drop if missing(fif_non_fif)
   sort id
duplicates drop household year, force
 *SECOND, WE ARE INTERESTED IN THOSE WHO ARE ACCEPTED INTO FIF
drop if fif_non_fif==2
drop if fif_non_fif==777
 gen TREATMENT=how_much_group>0
 label define treatment_var 0 "Control" 1 "Treatment"
 label values TREATMENT treatment_var
label variable b_use_fertlizer "Use_fertilizer"
label values b_use_fertlizer use_fertilizer
label define use_fertilizer 1 "Yes" 0 "No"
label variable m_use_fertlizer "use_fertilizer"
label values m_use_fertlizer use_fertilizer
recast byte TREATMENT
*LABEL YEAR VARIABLE
 label variable year "base_midline"
label values year base_midline
label define base_midline 0 "baseline" 1 "midline"
drop id
gen id=_n

*relable variable for easy computation by the machine
 label define q10_member_of_iddir 1 "yes" 0 "no", replace
 label define q11_member_rural_savings 1 "yes" 0 "no", replace
label define q14_training_credit_mngmnt 1 "yes" 0 "no", replace
label define q16_participate_in_ftc 1 "yes" 0 "no", replace
label define q19_tried_new_actu 1 "yes" 0 "no", replace
label define q1_bank_account_mfi 1 "yes" 0 "no", replace
label define q1_other_income_acts 1 "yes" 2 "no", replace
label define q1_other_income_acts 1 "yes" 0 "no", replace
label define q1_participate_in_groups 1 "yes" 0 "no" 9 "Missing", replace
label define q1_received_income 1 "yes" 0 "no", replace
label define q1_taken_loan 1 "yes" 0 "no", replace
label define q20_improved_seed 1 "yes" 0 "no", replace
label define q19_tried_new_actv_f2 1 "yes" 0 "no", replace
label define q22_new_crop_technique_f2 1 "yes" 0 "no", replace
label define q25_new_livestock_technis_f2 1 "yes" 0 "no", replace
label define q28_tried_new_methodu_f2 1 "yes" 0 "no", replace
label define q2_vegtble_horticulture 1 "yes" 0 "no", replace
label define q31_new_marketing_approacj_f2 1 "yes" 0 "no", replace
label define q34_new_natural_resourc_f2 1 "yes" 0 "no", replace
label define q3_field_crops 1 "yes" 0 "no", replace
label define q43_proposal_acceptee 1 "yes" 0 "no", replace
label define q43aa_group_receive_morad_f2 1 "Yes" 0 "No", replace
label define q4_small_livestock 1 "yes" 0 "no", replace
label define q5_cash_savings 1 "yes" 0 "no", replace
label define q5_large_livestock 1 "yes" 0 "no", replace
label define q6_improved_seed 1 "yes" 0 "no", replace
label define q6_ntrl_rsrce_mngmnt 1 "yes" 0 "no", replace
label define q9_member_of_eqqub 1 "yes" 0 "no", replace
label define q1_participate_in_groups 0 "no" 1 "yes", replace
label define q43_proposal_acceptee 0 "no" 1 "yes", replace
label define region 1 "Amhara" 0 "Tigray", replace

recode savings_other_mfi have_bank_acc member_eqqub member_iddir member_coop training_credit_mngmnt relative_support receive_cash_goods inc_other_biz Credit_access  use_vegetable_horticulture use_field_crop use_small_livestock use_large_livestock natural_resource_mgt new_agric_tech new_crop_tech new_livestock_tech new_farming_method new_market_approach new_naturalres_mgt part_in_farmgroup your_group_receive Improved_seed m_Improved_seed region FARMER_TRAINING(2=0)
SAVE AS AT 26/10/2020
recode your_group_receive market_part_rate crops_1_sale Qty_sold Qty_unit sellingprice receive_cash_goods Neigh_interaction part_in_farmgroup FARMER_TRAINING size_of_fifgroup Friends_in_fifgroup level_of_participation farming_advise relative_support have_bank_acc savings_other_mfi member_eqqub member_iddir member_coop training_credit_mngmnt Share_of_information Head_Education_level inc_other_biz Credit_access walking_time agro_ecology land_slope soil_quality where_crop_was_sold Mode_of_transport Market_Distance use_vegetable_horticulture use_field_crop use_small_livestock use_large_livestock natural_resource_mgt new_agric_tech new_crop_tech new_livestock_tech new_farming_method new_market_approach new_naturalres_mgt livestock_qty_sold value_production_asset b_type_of_crop b_Farm_size b_Farm_unit b_Qty_produced b_Qty_unit b_value_of_crops_produced Improved_seed b_source_of_seed b_seed_exp value_of_dap value_of_urea b_irrigation1 b_fertilizer_exp b_use_fertlizer b_Expenditure_input m_type_of_crop m_Farm_size m_Farm_unit m_Qty_produced m_Qty_unit m_value_of_crops_produced m_Improved_seed m_source_of_seed m_seed_exp mvalue_of_dap mvalue_of_urea m_irrigation1 m_fertilizer_exp m_use_fertlizer m_Expenditure_input (999 777 888=.)

drop your_group_receive 
save 30/10/2020

//market_part_rate Qty_sold sellingprice FARMER_TRAINING part_in_farmgroup size_of_fifgroup Friends_in_fifgroup farming_advise relative_support have_bank_acc  member_eqqub member_iddir member_coop training_credit_mngmnt Share_of_information Head_Education_level inc_other_biz Credit_access walking_time agro_ecology land_slope where_crop_was_sold Mode_of_transport Market_Distance livestock_qty_sold value_production_asset b_Farm_size b_Qty_produced b_value_of_crops_produced b_source_of_seed value_of_dap b_irrigation1 b_use_fertlizer m_Farm_size m_Qty_produced m_value_of_crops_produced m_source_of_seed m_seed_exp new_market_approach new_naturalres_mgt

*testing whether our dataset is MCAR or MAR. Create a new indicator variable for each existing variable (which is 1 if a given observation is missing that variable and 0 if it is not. The misstable command does this part automatically with the gen() option. then run logit models to test if any of the other variables predict whether a given variable is missing. if they do, then the data is MAR rather than MCAR. The greater the standard deviation, the more likely we are using imputation. Our result shows that, the missing observtions are at random, except new_agric_tech, new_market_approach and new_naturalres_mgt where mssing are completely at random so we need to use imputation.
local numvars how_much_group region TREATMENT
local missvars your_group_receive market_part_rate crops_1_sale Qty_sold Qty_unit sellingprice receive_cash_goods Neigh_interaction part_in_farmgroup FARMER_TRAINING size_of_fifgroup Friends_in_fifgroup level_of_participation farming_advise relative_support have_bank_acc savings_other_mfi member_eqqub member_iddir member_coop training_credit_mngmnt Share_of_information Head_Education_level inc_other_biz Credit_access walking_time agro_ecology land_slope soil_quality where_crop_was_sold Mode_of_transport Market_Distance use_vegetable_horticulture use_field_crop use_small_livestock use_large_livestock natural_resource_mgt  new_crop_tech new_livestock_tech new_farming_method  livestock_qty_sold value_production_asset b_type_of_crop b_Farm_size b_Farm_unit b_Qty_produced b_Qty_unit b_value_of_crops_produced Improved_seed b_source_of_seed b_seed_exp value_of_dap value_of_urea b_irrigation1 b_fertilizer_exp b_use_fertlizer b_Expenditure_input m_type_of_crop m_Farm_size m_Farm_unit m_Qty_produced m_Qty_unit m_value_of_crops_produced m_Improved_seed m_source_of_seed m_seed_exp mvalue_of_dap mvalue_of_urea m_irrigation1 m_fertilizer_exp m_use_fertlizer m_Expenditure_input
misstable sum, gen(miss_)
foreach var of local missvars {
local covars: list numvars - var
display _newline(3) "logit missingness of `var' on `covars'"
logit miss_`var' `covars'
foreach nvar of local covars {
display _newline(3) "ttest of `nvar' by missingness of `var'"
ttest `nvar', by(miss_`var')
}
}


 // set up trial imputation command just to get the individual regression commands
 
//checking for convergence and perfect prediction. remove i.training_credit_mngmnt i.Credit_access i.new_crop_tech i.use_small_livestock i.member_iddir i.m_Improved_seed i.use_large_livestock i.Improved_seed i.m_use_fertlizer i.new_farming_method i.new_market_approach i.FARMER_TRAINING i.part_in_farmgroup i.receive_cash_goods i.savings_other_mfi i.use_field_crop i.new_agric_tech
logit your_group_receive i.b_use_fertlizer i.use_vegetable_horticulture  i.member_coop i.member_eqqub i.inc_other_biz i.relative_support i.natural_resource_mgt i.have_bank_acc i.new_livestock_tech i.new_naturalres_mgt 

//convergence achieved 
mlogit Friends_in_fifgroup i.level_of_participation i.soil_quality i.agro_ecology 


//convergence achieved
ologit  Neigh_interaction i.Head_Education_level i.m_source_of_seed i.where_crop_was_sold i.Mode_of_transport i.land_slope 
//the following variables do not allow for convergence  i.b_source_of_seed  i.b_irrigation1 i.b_type_of_crop i.m_type_of_crop


//checking for covergence for continuous variables, we first run a linear regression because the variables are continuous. the R2 (80.70) has high explanatory power
regress market_part_rate crops_1_sale how_much_group sellingprice  value_production_asset b_value_of_crops_produced  m_value_of_crops_produced m_seed_exp Qty_sold size_of_fifgroup farming_advise Share_of_information walking_time Market_Distance livestock_owned value_of_dap b_Farm_size m_Farm_size b_Qty_produced m_Qty_produced , vce(robust)
//checking for collinearity
 estat vif
 //we drop livestock_qty_sold  b_seed_exp  m_fertilizer_exp b_Expenditure_input m_Expenditure_input b_fertilizer_exp for colinearity 
//checking for convergence using glm
glm market_part_rate crops_1_sale how_much_group sellingprice  value_production_asset b_value_of_crops_produced  m_value_of_crops_produced m_seed_exp Qty_sold size_of_fifgroup farming_advise Share_of_information walking_time Market_Distance livestock_owned value_of_dap b_Farm_size m_Farm_size b_Qty_produced m_Qty_produced, vce(robust)
 rvfplot  

//We have been able to establish that missing values are missing at random so we apply imputation to fill the missing values. Taking care of missing values
// first, we set our dataset style and register the variables that need imputation.
mi set flong
mi register imputed market_part_rate crops_1_sale Qty_sold Qty_unit sellingprice receive_cash_goods Neigh_interaction part_in_farmgroup FARMER_TRAINING size_of_fifgroup Friends_in_fifgroup level_of_participation farming_advise relative_support have_bank_acc savings_other_mfi member_eqqub member_iddir member_coop training_credit_mngmnt Share_of_information Head_Education_level inc_other_biz Credit_access walking_time agro_ecology land_slope soil_quality where_crop_was_sold Mode_of_transport Market_Distance use_vegetable_horticulture use_field_crop use_small_livestock use_large_livestock natural_resource_mgt new_agric_tech new_crop_tech new_livestock_tech new_farming_method new_market_approach new_naturalres_mgt livestock_qty_sold value_production_asset b_type_of_crop b_Farm_size b_Farm_unit b_Qty_produced b_Qty_unit b_value_of_crops_produced Improved_seed b_source_of_seed b_seed_exp value_of_dap value_of_urea b_irrigation1 b_fertilizer_exp b_use_fertlizer b_Expenditure_input m_type_of_crop m_Farm_size m_Farm_unit m_Qty_produced m_Qty_unit m_value_of_crops_produced m_Improved_seed m_source_of_seed m_seed_exp mvalue_of_dap mvalue_of_urea m_irrigation1 m_fertilizer_exp m_use_fertlizer m_Expenditure_input

// second, we check for model specification
mi impute chained (logit, aug) FARMER_TRAINING part_in_farmgroup receive_cash_goods member_coop member_eqqub inc_other_biz relative_support natural_resource_mgt have_bank_acc new_livestock_tech new_naturalres_mgt your_group_receive member_iddir training_credit_mngmnt Credit_access new_crop_tech new_farming_method new_market_approach b_use_fertlizer m_use_fertlizer use_vegetable_horticulture use_small_livestock use_large_livestock Improved_seed m_Improved_seed (mlogit)  Friends_in_fifgroup level_of_participation soil_quality agro_ecology (ologit)  Neigh_interaction Head_Education_level m_source_of_seed where_crop_was_sold Mode_of_transport land_slope (regress) crops_1_sale market_part_rate  sellingprice  value_production_asset b_value_of_crops_produced  m_value_of_crops_produced m_seed_exp b_seed_exp b_fertilizer_exp m_fertilizer_exp, dryrun



       
 //variables not allow for convergence     
member_coop member_eqqub relative_support inc_other_biz
natural_resource_mgt new_livestock_tech have_bank_acc your_group_receive use_vegetable_horticulture b_use_fertlizer part_in_farmgroup FARMER_TRAINING new_market_approach new_farming_method m_use_fertlizer use_large_livestock  m_Improved_seed use_small_livestock new_crop_tech Credit_access training_credit_mngmnt Improved_seed 
savings_other_mfi use_field_crop new_agric_tech receive_cash_goods
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Carrying out imputation to fill up missing values. we add augment to correct for perfect prediction
mi impute chained (logit, aug) new_naturalres_mgt member_iddir  (ologit, aug)Friends_in_fifgroup level_of_participation soil_quality agro_ecology Neigh_interaction Head_Education_level m_source_of_seed where_crop_was_sold Mode_of_transport land_slope (regress) market_part_rate crops_1_sale sellingprice  value_production_asset b_value_of_crops_produced  m_value_of_crops_produced m_seed_exp Qty_sold size_of_fifgroup farming_advise Share_of_information walking_time Market_Distance  value_of_dap b_Farm_size m_Farm_size b_Qty_produced m_Qty_produced = how_much_group livestock_owned region zone woreda TREATMENT kebele, add(5) rseed(5000)

save 14/Nov/2020
 use "C:\Users\User\Desktop\clement\WORKING_DATA.dta"
 mi xtset household year
 
//mi estimate, level(90) : xtreg market_part_rate new_naturalres_mgt member_iddir Friends_in_fifgroup level_of_participation soil_quality agro_ecology Neigh_interaction Head_Education_level m_source_of_seed where_crop_was_sold Mode_of_transport land_slope crops_1_sale sellingprice value_production_asset b_value_of_crops_produced m_value_of_crops_produced m_seed_exp Qty_sold size_of_fifgroup farming_advise Share_of_information walking_time Market_Distance value_of_dap b_Farm_size m_Farm_size b_Qty_produced m_Qty_produced how_much_group livestock_owned TREATMENT region zone woreda kebele, fe
//estimates store fix

mi estimate, citable dftable vartable level(90) : xtreg market_part_rate new_naturalres_mgt member_iddir training_credit_mngmnt Credit_access m_Improved_seed m_use_fertlizer new_market_approach FARMER_TRAINING part_in_farmgroup savings_other_mfi new_agric_tech member_coop member_eqqub inc_other_biz relative_support have_bank_acc Friends_in_fifgroup level_of_participation soil_quality agro_ecology Neigh_interaction Head_Education_level m_source_of_seed where_crop_was_sold Mode_of_transport land_slope crops_1_sale sellingprice value_production_asset b_value_of_crops_produced m_value_of_crops_produced m_seed_exp Qty_sold size_of_fifgroup farming_advise Share_of_information walking_time Market_Distance value_of_dap b_Farm_size m_Farm_size b_Qty_produced m_Qty_produced how_much_group livestock_owned TREATMENT region zone woreda kebele, re


 hausman fix, sigmamore
 
 //We settle for random-effect model as it shows that it is more efficient