#### Preamble ####
# Purpose: Cleans the raw lead concentration data by renaming the headers and
# ensuring all values are physically plausible. Moreover, any data that is
# missing from any one of the columns of interest (in this particular data set,
# such rows will feature an "NA" as a value for whatever data is missing) will 
# be removed entirely.
# Author: Abbass Sleiman
# Date: 18 January 2024
# Contact: abbass.sleiman@mail.utoronto.ca
# License: MIT
# Pre-requisites: None required

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_lead_data <- read_csv("inputs/data/raw_data.csv")

cleaned_data <-
  raw_lead_data |>
  janitor::clean_names() |>
  rename(
    postal_code = partial_postal_code,
    lead_concentration_ppb = lead_amount_ppm
  ) |>
  select(
    postal_code,
    lead_concentration_ppb
  ) |>
  na.omit()

cleaned_data <- cleaned_data |>
  mutate(lead_concentration_ppb = str_remove(lead_concentration_ppb, "<")) |>
  mutate(lead_concentration_ppb = as.numeric(lead_concentration_ppb)) |>
  mutate(postal_code = str_replace(postal_code, "m2l", "M2L")) |>
  mutate(lead_concentration_ppb = lead_concentration_ppb * 1000)

#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_lead_data.csv")


