
# Introduction #################################################################

# Tips #########################################################################
### Summary
#' You can load Cheat Sheets: Help > Cheat Sheets > (select a cheat sheet)



# Data Structures ##############################################################

# Vectors

## Atomic

## Lists

# DataFrames

# Grep
#' I need to add notes on the grep function #.

# Functions ####################################################################

# Statistical Analysis #########################################################
### Summary
lm(hp ~ disp, data = mtcars)
t.test(conc ~ Treatment, data = CO2)
aov(conc ~ Plant, data = CO2)



# Packages #####################################################################
library('tidyr') #.
library('data.table') #.
library('purrr') #.
library('dplyr') #.
# #.
# #############################################################################.
# Table - Calculations ########################################################.
# #############################################################################.

# Separate column ##############################################################
infert_dt <-setDT(copy(infert)) #.
infert_dt[, c("age_start", "age_end") := tstrsplit(education, "-", fixed = TRUE)] #.

# Combine Columns ##############################################################
infert_dt <-setDT(copy(infert)) #.
infert_dt[, age_parity := paste(age, parity, sep = "-connected-")] #.

# Apply function to elements ###################################################
### Summary
airquality %>% 
  purrr::map(~ sum(is.na(.))) # applies sum on multiple columns


# rowwise
airquality_DT[, Average := rowMeans(.SD), by = Month, .SDcols = c('Month', 'Day')] #.

# Mutate data ##################################################################

## New column based on calcs
CO2_DT <- setDT(copy(CO2))[, new_value := uptake/conc] #.

## Case statements
CO2_DT <- setDT(copy(CO2))             #.
CO2_DT[, new_value2 := case_when(      #.
  conc < 180 ~ "Small",                #.
  conc >= 180 & conc < 300 ~ "Medium", #.
  TRUE ~ "Large"                       #.
)]                                     #.

# Add a Ranking Column
CO2_DT <- setDT(copy(CO2))           #.
data.table::setorder(CO2_DT, uptake) #.
CO2_DT[, uptake_rank := .I]          #.
# #.
# #############################################################################.
# Table - Organising ##########################################################.
# #############################################################################.

# Filter #######################################################################
CO2_DT <- data.table::setDT(copy(CO2)) #.
CO2_DT[uptake > 30, ] #.

# Select columns ###############################################################

# Single column

# Multiple columns
Harman23_DT[, c('height', 'arm.span')] #.

# Select columns based on criteria
Harman23_DT[, .SD, .SDcols = patterns('^chest')] # "^ABC.*XYZ$" #.

# Group by #####################################################################
CO2_DT[, .(Mean_uptake_by_type = mean(uptake)), by = .(Type, conc == 95)] #.

# .SD stands for "Subset of Data." 

# Print the result

# Pivot data ###################################################################

# Longer
USJudgeRatings_DT <- setDT(copy(USJudgeRatings)) #.
USJudgeRatings_DT[, Judge := rownames(USJudgeRatings)] #.
USJudgeRatings_pivot <- USJudgeRatings_DT %>%  #.
  pivot_longer( #.
    cols = c(CONT, INTG, DMNR, DILG, CFMG, DECI, PREP, FAMI, ORAL, WRIT, PHYS, RTEN), #.
    names_to = "System", #.
    values_to = "Rating" #.
  ) #.
setDT(USJudgeRatings_pivot) #.
USJudgeRatings_pivot #.

# Wider
CO2_pivot <- CO2 %>%     #.
  pivot_wider(           #.
    names_from = conc,   #.
    values_from = uptake #.
  )                      #.
setDT(CO2_pivot)         #.
CO2_pivot                #.

# Table joins ##################################################################

# Inner Join:
result <- table1[table2, on = "key_id", nomatch = 0] #.

# Join on Multiple Columns:
result <- table3[table4, on = .(key_id, values)] #.

# Right Join:
result <- table1[table2, on = "key_id"] #.

# Multiple Columns:

# Join on Multiple Columns:
result <- merge(dt1, dt2, by = c("key_column1", "key_column2")) #.
result <- merge(dt1, dt3, by.x = "key_column2", by.y = "key_column2_v2") #.
