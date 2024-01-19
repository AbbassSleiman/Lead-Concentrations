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
# [...UPDATE THIS...]

#### Download data ####
raw_lead_data <- 
  read_csv(
  file =
    "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/8171f7ab-364e-46a7-8a62-08f073ca6d96/resource/4b141457-e2a5-43e9-b5a4-25629419521d/download/Non%20Regulated%20Lead%20Samples.csv",
  show_col_types = FALSE,
  skip = 1
  
)



#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_lead_data, "inputs/data/raw_data.csv") 

         
