# Introduction #################################################################

#' TO do:
#' Read through: https://www.w3schools.com/r/default.asp
#' and add noted here too

#' What is R?
#' R is a programming language for statistical computing and graphics

#' What is a programming language?
#' A programming language is a system of notation for writing computer programs.
#' 
#' The description of a programming language is usually split into the two 
#' components of syntax (form) and semantics (meaning), which are usually 
#' defined by a formal language. Some languages are defined by a specification
#' document (for example, the C programming language is specified by an ISO 
#' Standard) while other languages (such as Perl) have a dominant implementation
#' that is treated as a reference. Some languages have both, with the basic 
#' language defined by a standard and extensions taken from the dominant 
#' implementation being common.


#' Why do we use programming languages?
#' Programming is like giving instructions to a computer. It's a way to tell the
#' computer what to do step by step. You use a special language, called a 
#' programming language, to communicate with the computer and make it perform
#' tasks or solve problems. It's a bit like writing a recipe for a robot chef;
#' you need to be clear and precise in your instructions. Learning to code opens
#' up a world of opportunities, from creating websites and apps to analyzing 
#' data and automating everyday tasks."
#' 
#' A real world example would be to perform routine calculations, for example if
#' we have to calculate the total distance a fleet of cars travels every week, 
#' we could be given a list of all the cars and the distance travel and then
#' just sum this up:
sum(cars$dist)
#' This seems simple enough, but using code you can automate it. E.g. if you 
#' have a database with this information updated every week - you could automate
#' a report every week to give you information about your fleet:
paste0("The number of cars was: ", nrow(cars))
paste0("The total distance travelled was: ", sum(cars$dist))
paste0("The average speed was: ", mean(cars$speed))
paste0("The numer of cars travelling >= 20 speed was: ", sum(cars$speed >= 20))
#' Once you define your code logic, you can repeat this with the next week's 
#' data. You can produce graphs, PDFs, Excels, and do many more things.


#' Download R

#' Download R Studio
#' Download VS Code


# Tips #########################################################################

### Summary
#' You can load Cheat Sheets: Help > Cheat Sheets > (select a cheat sheet)


#. Basic Math ##################################################################

##. Operators: Math
1 + 2
1 - 2
3 * 4
6 / 4
5 %% 4
2**3
6 / (2%%4)**2


##. Operators: Comparisons
1 > 2
1 < 2
1 >= 2
1 <= 2
1 >= 1
1 <= 1
1 == 2
1 == 1
"x"=="y"
"x"=="x"
"a"=="A"
"Text_1" == "Text_2"
"Text_1" == "Text_1"
"T1" == "t1"
toupper("T1") == toupper("t1")

21 != 12
"John" != "Joseph"

##. Operators: Logicals
0 < 1 & 0 < 3 # TRUE & TRUE = TRUE
2 < 1 & 2 < 3 # FALSE & TRUE = FALSE

0 < 1 | 0 < 3
4 < 1 | 4 < 3

10 + 5 > 5 + 20 | 5 + 20 < 10 + 20


#. Variables ###################################################################

#' In R the variable is an object. An object is a data structure having few 
#' attributes and methods which are applied to its attributes. Variables can be 
#' broadly divided in to two types such as Numerical and Character.


#. Variables

##. Assigning Variables
x <- 7
print(x)
x

##. Reassigning Variables
x <- 2
x

#. Atomic vectors (all same data types)
##. logical - TRUE or FALSE
y <- FALSE
y
str(y)


##. double - numeric - decimal
z <- 2.33
z
str(z)

##. character - string - "" or ''
a <- "Joseph"
print(a)
a
str(a)

#' all of these variables have only a single value, but it is possible to create
#' variables with multiple # values. the first way we will look at to do this, 
#' is with the c() function - combine, concatenate.

#' this will create an atomic vector - or a variable where each item has the 
#' same data type 

#' c() - short for combine to create a longer vector, same data type
b <- c(TRUE, FALSE)
b
str(b)

c("a", 1)
c(1, 2)
c(TRUE, 1)
c(TRUE, "a")
c(TRUE, 2, "1")

str(c("a", 1))


# Data Structures ##############################################################

# Vectors
#' two main types - atomic and lists

## Atomic

## Lists
list(TRUE, 2, "1")
str(list(TRUE, 2, "1"))

# DataFrames
#' data.frame() - name-vector pairs to create a dataframe, default converts 
#' string to factors
#' $  notation
cities_df <- data.frame(
  cities = c("Vancouver", "Kyoto", "Toronto", "Tokyo", "Austin", "Osaka"),
  #country = c("Canada", "Japan", "Canada", "Japan", "USA", "Japan"),
  #region = c("North America", "Asia", "North America", "Asia", "North America", "Asia"),
  population = c(15, 100, 20, 500, 30, 400),
  rating = c(3, 2, 5, 1, 5, 2)
)

cities_df$cities

str(cities_df)

#' There are also built in data sets for practice, you can use:
data()
#' to view all of the ones available

mtcars # complete clean dataset
str(mtcars)

airquality # dataset with NA values
str(airquality)

# Grep
#' I need to add notes on the grep function #.
"^ABC.*XYZ$"
".*XYZ.*"
?grep

# Functions ####################################################################

#' What are the R functions?
#' A function in R is an object containing multiple interrelated statements that 
#' are run together in a predefined order every time the function is called.
#'
#' Basically, similar to algebraic functions, can take in inputs and give you a
#' result


##. Math Functions #############################################################
###. single variable analysis
###. Sum
sum(mtcars$vs)
mean(mtcars$disp)

##. distribution
sd(mtcars$disp)
var(mtcars$disp)
var(mtcars$disp) == sd(mtcars$disp)**2 # Slight difference in storage of values
round(var(mtcars$disp), 2) == round(sd(mtcars$disp)**2, 2) # need to round
dp <- 100
round(var(mtcars$disp), dp) == round(sd(mtcars$disp)**2, dp) # need to round
dp <- 10
round(var(mtcars$disp), dp) == round(sd(mtcars$disp)**2, dp) # need to round

##. correlation
cor(cities_df$population, cities_df$rating)


# Statistical Analysis #########################################################

#. simple linear regression model
#. review ~ syntax - formula
?lm
lm(mtcars$hp ~ mtcars$disp)
lm(hp ~ disp, data = mtcars)

#. compare the mean of two samples
?t.test
t.test(hp ~ disp, data = mtcars) # need to have 2 samples only!
t.test(conc ~ Treatment, data = CO2)

#. compare the mean of multiple samples
CO2_aov <- aov(conc ~ Plant, data = CO2)
CO2_aov
summary(CO2_aov)

### Summary
lm(hp ~ disp, data = mtcars)
t.test(conc ~ Treatment, data = CO2)
aov(conc ~ Plant, data = CO2)


# Packages #####################################################################

#' to use packages you need to install them
install.packages('tidyr')
#' Once installed you don't need to install it again, you will just need to load
#' it to your environment:
library('tidyr') #.

install.packages('data.table')

library('data.table') #.
library('purrr') #.
library('dplyr') #.


# #.
# #############################################################################.
# Table - Calculations ########################################################.
# #############################################################################.
#' This section relates to working with tables to generate new columns

# Separate column ##############################################################
infert_copy <- infert

infert_split <- infert_copy %>% 
  unite(col = age_parity, c(age, parity), sep = "-connected-")

infert_split <- infert_split %>% 
  separate(col = age_parity, sep = "-connected-", into = c('age', 'parity'))

infert_split <- infert_split %>% 
  separate(col = education, sep = -3, into = c("range", "range_measure"))

infert %>% 
  separate(col = education, sep = "-", into = c('age_start', 'age_end'))

infert_dt <-setDT(copy(infert)) #.
infert_dt[, c("age_start", "age_end") := tstrsplit(education, "-", fixed = TRUE)] #.


# Combine Columns ##############################################################
infert %>% 
  unite(col = age_parity, c(age, parity), sep = "-connected-")

infert_dt <-setDT(copy(infert)) #.
infert_dt[, age_parity := paste(age, parity, sep = "-connected-")] #.


# Apply function to elements ###################################################
library('purrr')
help(map)
?map
purrr::map()

sum(is.na(airquality$Ozone))

airquality %>% 
  purrr::map(~ sum(is.na(.))) # . means all the columns

airquality_DT <- copy(airquality)
airquality_DT %>% 
  map(~ sum(is.na(.))) # works on DTs as well

USJudgeRatings %>%
  purrr::map(~ mean(nchar(., keepNA = FALSE)))

### Summary
airquality %>% 
  purrr::map(~ sum(is.na(.))) # applies sum on multiple columns

# rowwise
#' This is wrong and gets the average of the full columns
airquality %>%
  mutate(average_of_cols = mean(c(Month, Day)))

#' This is the average by row
airquality %>%
  rowwise() %>%
  mutate(average_of_cols = mean(c(Month, Day)))

airquality_DT <- setDT(copy(airquality))
airquality_DT[, Average := rowMeans(.SD), .SDcols = c('Month', 'Day')]

airquality_DT[, Average := rowMeans(.SD), by = Month, .SDcols = c('Month', 'Day')] #.
airquality_DT[, Average := mean(.SD), by = as.character(Month), .SDcols = c('Month', 'Day')]



# Mutate data ##################################################################

## New column based on calcs
CO2_DT <- setDT(copy(CO2))[, new_value := uptake/conc] #.

CO2 %>%
  dplyr::mutate(new_value = uptake/conc)


## Case statements
CO2 %>%
  dplyr::mutate(new_value = case_when(
    conc < 180 ~ "Small",
    conc >= 180 & conc < 300 ~ "Medium",
    TRUE ~ "Large"
  ))

CO2_DT <- setDT(copy(CO2))             #.
CO2_DT[, new_value2 := case_when(      #.
  conc < 180 ~ "Small",                #.
  conc >= 180 & conc < 300 ~ "Medium", #.
  TRUE ~ "Large"                       #.
)]                                     #.


# Add a Ranking Column
CO2 %>%
  dplyr::mutate(uptake_rank = dense_rank(-uptake))
CO2 %>%
  dplyr::mutate(uptake_rank = dense_rank(+uptake))

CO2 %>%
  dplyr::mutate(uptake_rank = dense_rank(+uptake)) %>%
  dplyr::arrange(uptake_rank)

CO2_DT <- setDT(copy(CO2))           #.
data.table::setorder(CO2_DT, uptake) #.
CO2_DT[, uptake_rank := .I]          #.




# #.
# #############################################################################.
# Table - Organising ##########################################################.
# #############################################################################.
#' This section involves working with tables to organise data, for example by
#' filtering, combining two tables together and pivoting data


# Filter #######################################################################
library('dplyr')
?dplyr::filter
dplyr::filter(CO2, uptake > 30)

#' Same thing using DT
CO2_DT <- data.table::setDT(copy(CO2)) #.
CO2_DT[uptake > 30, ] #.

?dplyr::slice
dplyr::slice(CO2, 1:30)

CO2_DT[1:30, ]


CO2 %>%
  dplyr::filter(uptake > 30) %>%
  dplyr::slice(1:30)

(CO2_DT[uptake > 30, ])[1:30, ]  
(CO2_DT[1:30, ])[uptake > 30, ]


# Select columns ###############################################################
#' Keep or drop columns using their names and types

Harman23_copy <- (copy(Harman23.cor$cov))
Harman23_copy <- as.data.frame(Harman23_copy)
Harman23_DT <- copy(Harman23_copy)
Harman23_DT$rownames <- row.names(Harman23_DT)
Harman23_DT <- setDT(Harman23_DT)
col_order <- c("rownames", "height", "arm.span", "forearm", "lower.leg", "weight", "bitro.diameter", "chest.girth", "chest.width")
data.table::setcolorder(Harman23_DT, col_order)


# Single column
Harman23_copy %>%
  dplyr::select(height)
Harman23_copy$height

Harman23_DT[, height]
Harman23_DT$height

Harman23_copy %>%
  dplyr::select(dplyr::last_col())


# Multiple columns
Harman23_copy %>%
  dplyr::select(height, arm.span)
Harman23_copy[c('height', 'arm.span')]

Harman23_DT[, c('height', 'arm.span')] #.


Harman23_copy %>%
  dplyr::select(dplyr::everything())


# Select columns based on criteria
Harman23_copy %>%
  dplyr::select(dplyr::starts_with('chest'))

swiss %>%
  dplyr::select(dplyr::starts_with('E')) # Works on DT too

selected_cols <- names(Harman23_DT)[like(names(Harman23_DT), 'chest')]
Harman23_DT[, ..selected_cols]

selected_cols <- grep(paste0("^", 'chest'), names(Harman23_DT), value = TRUE)
Harman23_DT[, .SD, .SDcols = selected_cols]

Harman23_DT[, .SD, .SDcols = patterns('^chest')]



Harman23_copy %>%
  dplyr::select(dplyr::ends_with('h'))

Harman23_DT[, .SD, .SDcols = patterns('chest*')]
Harman23_DT[, .SD, .SDcols = patterns('*h')]
Harman23_DT[, .SD, .SDcols = patterns('*h$')]


#' Specify the prefix you want to match
prefix_to_match <- "start_with_"

#' Use .SDcols to select columns that match the prefix
selected_cols <- grep(paste0("^", prefix_to_match), names(my_dt), value = TRUE)
result_dt <- my_dt[, .SD, .SDcols = selected_cols]

#' Print the result
print(result_dt)

Harman23_DT[, .SD, .SDcols = patterns('^chest')] # "^ABC.*XYZ$" #.
Harman23_DT[, .SD, .SDcols = patterns('chest*')]
Harman23_DT[, .SD, .SDcols = patterns('*h')]
Harman23_DT[, .SD, .SDcols = patterns('*h$')]



# Group by #####################################################################
CO2 %>%
  group_by(Type)  %>%
  summarise(Avg_update = mean(uptake))

CO2_DT[, .(Mean_uptake_by_type = mean(uptake)), by = .(Type)]
CO2_DT[, .(Mean_uptake_by_type = mean(uptake)), by = .(Type, conc == 95)] #.
CO2_DT[, .(Mean_uptake_by_type = mean(uptake)), by = .(Type, conc == 1000)]


CO2_DT[, .(mean_uptake = mean(uptake)), by = .(Type, conc)]
CO2_DT[, mean_uptake := mean(uptake), by = .(Type, conc)] # note the difference (adds a row)
CO2_DT[, lapply(uptake, mean), by = .(Type, conc)] # doesnt apply it correctly

CO2_DT <- setDT(copy(CO2))
#' Define a custom function you want to apply to each group
custom_function <- function(x) {
  #' Your custom logic here
  return(mean(x))
}
#' Apply the custom function to each group using lapply and by
result <- CO2_DT[, lapply(.SD, custom_function), by = .(Type, conc)]
# .SD stands for "Subset of Data." 
#' When you use .SD inside a data.table operation, it represents all the columns
#' in the current group, excluding the grouping column(s).
#' 
# Print the result
print(result) # note the issue with non-numeric columns


#' Group by doesnt actually change the data structure though, you can use nest 
#' to do this.
CO2 %>%
  group_by(Type, Treatment)

CO2_nest <- CO2 %>%
  nest(data = conc:uptake)
#' Now the data is grouped into nests
CO2_nest
CO2_nest$data
CO2_nest$data[[1]]

CO2_nest_v2 <- CO2 %>%
  group_by(Type, Treatment) %>%
  nest()



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
?pivot_wider
CO2_pivot <- CO2 %>%     #.
  pivot_wider(           #.
    names_from = conc,   #.
    values_from = uptake #.
  )                      #.
setDT(CO2_pivot)         #.
CO2_pivot                #.



# Table joins ##################################################################

table1 <- data.table(
  key_id = c(1,2,3),
  values = c("A","B","C")
)

table2 <- data.table(
  key_id = c(2,3, 4),
  items = c("B2","C2", "D2")
)

table3 <- data.table(
  key_id = c(4,5,6,7),
  values = c("D","E", "F", "G"),
  items_1 = c(1,2,3,4)
)

table4 <- data.table(
  key_id = c(4,5,6,7),
  values = c("D","E", "F", "G"),
  items_2 = c(4,5,6,7)
)




#' If you want to perform joins using the built-in functionality of data.table,
#' you can use the `[.data.table` method to achieve the same results. Here are 
#' examples of different types of joins using the data.table syntax:
#' 
#' The nomatch = 0 argument is used to exclude non-matching rows, effectively 
#' making it a left or right join.

# Inner Join:
result <- table1[table2, on = "key_id", nomatch = 0] #.

# Join on Multiple Columns:
result <- table3[table4, on = .(key_id, values)] #.

# Right Join:
result <- table1[table2, on = "key_id"] #.



#' The below hasnt been checked:

#' Full (Outer) Join:
#' To perform a full outer join in data.table, you can first perform a left join and then union it with a right join:
left_join <- dt1[dt2, on = "key_column", nomatch = 0]
right_join <- dt2[dt1, on = "key_column", nomatch = 0]
result <- rbindlist(list(left_join, right_join), use.names = TRUE, fill = TRUE)


#' Join on Different Column Names:
#' If the key columns in the two data.tables have different names:
result <- dt1[dt2, on = .(key_column_dt1 = "key_column_dt2")]

#' Cross Join (Cartesian Join):
#' To create all possible combinations of rows from both data.tables:
result <- dt1[CJ(NULL, NULL)]

#' In R's data.table package, you can join two or more data.tables using various
#' conditions. The key function for joining data.tables is data.table::merge().
#' You specify the conditions for joining using the by, on, all.x, and all.y 
#' arguments. Here are some common types of joins you can perform:

dt1 <- data.table(
  key_column = c(1,2,3),
  values = c("A","B","C")
)

dt2 <- data.table(
  key_column = c(2,3, 4),
  items = c("B2","C2", "D2")
)

#' Inner Join (default):
#' This keeps only the rows that have matching keys in both data.tables.
result <- merge(dt1, dt2, by = c('key_column'))
result <- data.table::merge.data.table(dt1, dt2, by = c('key_column'))

#' Left Join:
#' This keeps all the rows from the left data.table and the matching 
#' rows from the right data.table. Non-matching rows from the left data.table 
#' will have NAs in the columns from the right data.table.
result <- merge(dt1, dt2, by = "key_column", all.x = TRUE)


#' Right Join: This is similar to a left join but keeps all the rows from the 
#' right data.table.
result <- merge(dt1, dt2, by = "key_column", all.y = TRUE)


#' Full (Outer) Join:
#' This keeps all rows from both data.tables. Non-matching rows will have NAs in
#' the columns from the non-matching data.table.
result <- merge(dt1, dt2, by = "key_column", all.x = TRUE, all.y = TRUE)

# Multiple Columns:
dt1 <- data.table(
  key_column1 = c(4,5,6,7),
  key_column2 = c("D","E", "F", "G"),
  items_1 = c(1,2,3,4)
)

dt2 <- data.table(
  key_column1 = c(4,5,6,7),
  key_column2 = c("D","E", "F", "G"),
  items_2 = c(4,5,6,7)
)

dt3 <- data.table(
  key_column1 = c(4,5,6,7),
  key_column2_v2 = c("D","E", "F", "G"),
  items_2 = c(4,5,6,7)
)



# Join on Multiple Columns:
#' You can join data.tables on multiple columns by passing a vector of column 
#' names to the by argument.
result <- merge(dt1, dt2, by = c("key_column1", "key_column2")) #.

#' Join on Different Column Names:
#' If the key columns in the two data.tables have different names, you can use 
#' the by.x and by.y arguments to specify the columns to join on.
result <- merge(dt1, dt3, by.x = "key_column2", by.y = "key_column2_v2") #.

#' Cross Join (Cartesian Join): 
#' This creates all possible combinations of rows from both data.tables.
result <- merge(dt1, dt2, by = NULL)



#. dplyr joins

dt1 <- dplyr::tibble(
  key_column1 = c(4,5,6,7),
  key_column2 = c("D","E", "F", "G"),
  items_1 = c(1,2,3,4)
)

dt2 <- dplyr::tibble(
  key_column1 = c(4,5,6,7),
  key_column2 = c("D","E", "F", "G"),
  items_2 = c(4,5,6,7)
)


t1 <- dplyr::tibble(
  key_column = c(1,2,3),
  values = c("A","B","C")
)

t2 <- dplyr::tibble(
  key_column = c(2,3, 4),
  items = c("B2","C2", "D2")
)

dplyr::left_join(t1,t2, by = 'key_column')
dplyr::left_join(dt1,dt2, by = 'key_column1')

dplyr::right_join(t1,t2, by = 'key_column')
dplyr::right_join(dt1,dt2, by = 'key_column1')

dplyr::inner_join(t1,t2, by = 'key_column')
dplyr::inner_join(dt1,dt2, by = 'key_column1')












AirPassengers
BJsales
BJsales.lead
BOD
CO2
ChickWeight
DNase
EuStockMarkets
Formaldehyde
HairEyeColor
Harman23.cor
Harman74.cor
Indometh
InsectSprays
JohnsonJohnson
LakeHuron
LifeCycleSavings
Loblolly
Nile
Orange
OrchardSprays
PlantGrowth
Puromycin
Seatbelts
Theoph
Titanic
ToothGrowth
UCBAdmissions
UKDriverDeaths
UKgas
USAccDeaths
USArrests
USJudgeRatings
USPersonalExpenditure
UScitiesD
VADeaths
WWWusage
WorldPhones
ability.cov
airmiles
airquality
anscombe
attenu
attitude
austres
beaver1
beaver2
cars
chickwts
co2
crimtab
discoveries
esoph
euro
euro.cross
eurodist
faithful
fdeaths
freeny
freeny.x
freeny.y
infert
iris
iris3
islands
ldeaths
lh
longley
lynx
mdeaths
morley
mtcars
nhtemp
nottem
npk
occupationalStatus
precip
presidents
pressure
quakes
randu
rivers
rock
sleep
stack.loss
stack.x
stackloss
state.abb
state.area
state.center
state.division
state.name
state.region
state.x77
sunspot.month
sunspot.year
sunspots
swiss
treering
trees
uspop
volcano
warpbreaks
women     
