library(shiny)
library(tidyverse)
# Data Provided by New York State Department of Health
# https://health.data.ny.gov/Health/Influenza-Laboratory-Confirmed-Cases-By-County-Beg/jr8b-6gh6
# data <- fread("./Data/Influenza_Laboratory-Confirmed_Cases_By_County__Beginning_2009-10_Season.csv)
# Determine which columns contain numeric data
numeric_column_names <- function(df) {
  numeric_cols <- sapply(df, is.numeric)
  names(numeric_cols)[numeric_cols]
}

# looks like we are having trouble deploying because secret key is having 
# trouble being recognized due to leading with a number. 
# Have tried replacing apostrophes with quotation marks, only quotation marks, etc. 
# Next may try deploying on Heroku