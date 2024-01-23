#### Preamble ####
# Purpose: Conducts 4 tests to verify that the cleaned data works as expected.
# The purpose of each of the 4 tests are included under the "Test data" section
# below.
# Author: Abbass Sleiman
# Date: 20 January 2024
# Contact: abbass.sleiman@mail.utoronto.ca
# License: MIT
# Pre-requisites: This script requires the user to have access to the downloaded
# data from "01-download_data.R" as well as the cleaned data from 
# "02-data_cleaning.R".


#### Workspace setup ####
library(tidyverse)

#### Read data ####
cleaned_data <- read_csv("outputs/data/cleaned_lead_data.csv")

#### Test data ####
# Tests for the simulated data:
# test1: Tests that the postal codes are exclusively one of the 96 specified 
# below.
test1 <- cleaned_data$postal_code %in% c("M1N", "M4V", "M4J", "M6H", "M6R", "M6J", 
                                         "M6P", "M6S", "M9R", "M2R", "M4C", "M6C", 
                                         "M4R", "M8Y", "M6E", "M1R", "M5M", "M4K", 
                                         "M6G", "M4T", "M4E", "M4S", "M8W", "M9C", 
                                         "M4M", "M5P", "M3N", "M4N", "M4P", "M4L", 
                                         "M5A", "M8V", "M4G", "M2N", "M1H", "M5R", 
                                         "M5N", "M4W", "M9A", "M3H", "M6N", "M3L", 
                                         "M5S", "M6K", "M9P", "M6M", "M4B", "M9N", 
                                         "M1P", "M1E", "M4A", "M5K", "M9B", "M8Z", 
                                         "M2M", "M5G", "M5V", "M2K", "M4X", "M1J", 
                                         "M1L", "M8X", "M2H", "M6B", "M1B", "M9V", 
                                         "M2L", "M6A", "M1M", "M1G", "M3J", "M4Y", 
                                         "M9M", "M3A", "M9W", "M2P", "M6L", "M1K", 
                                         "M1S", "M3C", "M3B", "M1W", "M5T", "M1T", 
                                         "M1C", "M3M", "M2J", "M5B", "M5J", "M5C", 
                                         "M1V", "M9L", "M5E", "M1X", "M3K", "M5H"
                                         )

# Returns a value of TRUE if all of values passed test1
all(test1) 

# test2: Tests that the lead concentration is at least 0
test2 <- cleaned_data$lead_concentration_ppb >= 0

# Returns a value of TRUE if all of values passed test2
all(test2)

# test3: Tests that there are exactly 9302 houses in the data
num_rows <- nrow(cleaned_data)
num_rows == 9262

# test4: Tests whether all entries in the lead concentration column are numeric
cleaned_data$lead_concentration_ppb |> class() == "numeric"
