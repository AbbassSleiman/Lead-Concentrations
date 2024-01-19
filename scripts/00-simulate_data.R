#### Preamble ####
# Purpose: Simulates the lead concentration (in ppm) of water in 1000 houses in 
# the Toronto area using a normal distribution with a mean of 0.05 ppm and a 
# standard deviation of 0.02. This simulation will also delete any entries with 
# a lead ppm below 0 as well as incorporating a postal code for each house.
# Author: Abbass Sleiman
# Date: 18 January 2024
# Contact: abbass.sleiman@mail.utoronto.ca
# License: MIT
# Pre-requisites: None required


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(tibble)

#### Simulate data ####
set.seed(9)

# Simulate 1000 random values from a normal distribution
simulated_values <- rnorm(1000, mean = 0.005, sd=0.002)

# Eliminate values below 0 as it is impossible in reality for a lead 
# concentration to be below 0.
simulated_values <- pmax(simulated_values, 0)

# Create a table that displays the values of each house and includes a postal 
# code for each.
simulated_data <- 
  tibble(
    "House number" = c(1:1000),
    "Postal code" = sample(
      x = c("M4E", "M4K", "M5S", "M1L", "M6H"),
      size = 1000,
      replace = TRUE
    ),
    "Lead concentration (ppm)" = sample(
      x = simulated_values,
      size = 1000,
      replace = FALSE
  )
)

simulated_data

# Tests for the simulated data:
# test1: Tests that the postal codes are exclusively one of the 5 specified in 
# the tibble
test1 <- simulated_data$"Postal code" %in% c("M4E", "M4K", "M5S", "M1L", "M6H")

# Returns a value of TRUE if all of values passed test1
all(test1) 

# test2: Tests that the lead concentration is at least 0
test2 <- simulated_data$"Lead concentration (ppm)" >= 0

# Returns a value of TRUE if all of values passed test2
all(test2)

# test3: Tests that there are 1000 simulated houses
num_rows <- nrow(simulated_data)
num_rows == 1000

# test4: Tests whether all entries in the lead concentration column are numeric
simulated_data$"Lead concentration (ppm)" |> class() == "numeric"
