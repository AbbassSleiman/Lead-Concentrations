#### Preamble ####
# Purpose: Here we download the data for the study directly from opendatatoronto,
# in particular the downloaded data is "Non Regulated Lead Sample".
# Author: Abbass Sleiman
# Date: 18 January 2024
# Contact: abbass.sleiman@mail.utoronto.ca
# License: MIT
# Pre-requisites: None required


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(janitor)

#### Download data ####
raw_lead_data <- 
  list_package_resources("8171f7ab-364e-46a7-8a62-08f073ca6d96") |>
  filter(name == "Non Regulated Lead Samples.csv") |>
  get_resource()

#### Save data ####
write_csv(raw_lead_data, "inputs/data/raw_data.csv")

         
