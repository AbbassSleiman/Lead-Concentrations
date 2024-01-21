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
test1 <- cleaned_data$postal_code %in% c("M4E", "M4K", "M1L", "M3B", "M6H", 
                                         "M4J", "M4M", "M4G", "M4C", "M6E", 
                                         "M6P", "M6N", "M4L", "M4R", "M2M", 
                                         "M9B", "M6J", "M8Z", "M5N", "M5R", 
                                         "M6C", "M1G", "M6M", "M6R", "M4P", 
                                         "M5M", "M1R", "M2J", "M6S", "M9A", 
                                         "M1N", "M3H", "M2N", "M1E", "M6A", 
                                         "M5T", "M4S", "M6G", "M4N", "M1M", 
                                         "M3M", "M4B", "M6K", "M5P", "M3J", 
                                         "M1P", "M8V", "M8W", "M1H", "M9C", 
                                         "M9R", "M4V", "M4T", "M6B", "M4W", 
                                         "M5S", "M9P", "M5A", "M2P", "M1S", 
                                         "M8Y", "M3A", "M2H", "M8X", "M1B", 
                                         "M2R", "M9W", "M3K", "M1V", "M4Y", 
                                         "M1T", "M5V", "M2L", "M2K", "M1K", 
                                         "M9M", "M9N", "M4X", "M1J", "M1C", 
                                         "M9V", "M3C", "M5H", "M5B", "M5G", 
                                         "M6L", "M3L", "M4A", "M1X", "M3N", 
                                         "M5J", "M5K", "M1W", "M5C", "M9L",
                                         "M5E"
                                         
)

# Returns a value of TRUE if all of values passed test1
all(test1) 

# test2: Tests that the lead concentration is at least 0
test2 <- cleaned_data$lead_concentration_ppm >= 0

# Returns a value of TRUE if all of values passed test2
all(test2)

# test3: Tests that there are exactly 12802 houses in the data
num_rows <- nrow(cleaned_data)
num_rows == 12802

# test4: Tests whether all entries in the lead concentration column are numeric
cleaned_data$lead_concentration_ppm |> class() == "numeric"