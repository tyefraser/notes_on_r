################################################################################
# GRAPHING #####################################################################
################################################################################
#' This script will go through information on graphing data
install.packages('ggplot2')
library('ggplot2') #.

# Bar charts ###################################################################

## Basic Bar chart
CO2_s <- CO2 %>%
  dplyr::filter(
    Type == 'Quebec',
    Treatment == 'nonchilled',
    Plant == 'Qn1')

ggplot(
  data = CO2_s,
  aes(x = conc, y = uptake)) +
  geom_col()

ggplot(
  data = CO2_s,
  aes(x = conc, y = uptake)) +
  geom_bar(stat = "identity", fill = "blue")


# Scatter plot
ggplot(
  data = CO2_s,
  aes(x = conc, y = uptake)) +
  geom_point()

ggplot(
  data = CO2_s,
  aes(x = conc, y = uptake)) +
  geom_point(color = 'red', shape = 'triangle', size = 4)


# histogram
ggplot(data = dt, aes(x = x_values)) +
  geom_histogram(bins = 10)




# multiple layers
ggplot(data = dt1, aes(x = x_vals, y= y_vals)) +
  geom_point() +
  geom_smooth()

ggplot(data = dt1, aes(x = x_vals, y= y_vals)) +
  geom_point(colour = "red", size = 1, position = 'jitter') +
  geom_col(aes(y= y_diff), fill = 'blue')
  

# Save 
ggsave()














# Scatter Plot #################################################################
#' Scatter plot of Sepal Length vs. Sepal Width, colored by species
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(
    title = "Scatter Plot of Sepal Length vs. Sepal Width",
    x = "Sepal Length",
    y = "Sepal Width"
  )



# Histogram
#' Histogram of car MPG (miles per gallon)
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "black") +
  labs(
    title = "Histogram of Car MPG",
    x = "MPG"
  )

# Box Plot
#' Box plot of car MPG by number of cylinders
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = "green", color = "black") +
  labs(
    title = "Box Plot of Car MPG by Number of Cylinders",
    x = "Number of Cylinders",
    y = "MPG"
  )

# Line Plot
as.data.frame(AirPassengers)
ggplot(as.data.frame(AirPassengers), aes(x = time, y = AirPassengers)) +
  geom_line(color = "red") +
  labs(
    title = "Monthly Airline Passenger Counts",
    x = "Time",
    y = "Passenger Count"
  )


# Bar Plot
#' Bar plot of car counts by number of gears
ggplot(mtcars, aes(x = factor(gear))) +
  geom_bar(fill = "purple") +
  labs(
    title = "Bar Plot of Car Counts by Number of Gears",
    x = "Number of Gears",
    y = "Count"
  )

?select
select(mtcars, contains("t"))
mutate?
mutate()?
# Labels

# Legends
