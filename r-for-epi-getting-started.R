# Getting started with R for Epidemiology
# 19 October 2022
# For Coconino County Health and Human Services
# rherrera@coconino.az.gov

# introduction ####
# before starting, create an RStudio project and give it a unique name 
# then save this script as an .R file in the RStudio project 
# open this script from within the project

# 1. install packages #### 

# sources for packages
# ropensci: https://ropensci.org/packages/ "Our packages are carefully vetted, staff- and community-contributed R software tools that in particular lower barriers to working with local and remote scientific data sources"
# cran task views: https://cran.r-project.org/
# github: https://github.com/topics/r-packages 

# function to check if packages are installed and if not install them
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# list the packages I want to check/install
packages <- c(
  "here",
  "tidyverse",
  "janitor",
  "haven",
  "readxl",
  "lubridate",
  "rmarkdown",
  "knitr",
  "gt",
  "pacman",
  "qualtRics",
  "tidycensus",
  "flexdashboard",
  "pins",
  "Rnssp",
  "curl"
)

# run/call the function
ipak(packages)


# 2. update packages ####

update.packages(ask = FALSE, checkBuilt = TRUE)


# 3. load packages ####

library(here) # project oriented workflow 
library(tidyverse) # helper packages
library(haven)
library(readxl)
library(datasets) # sample datasets to practice 
library(janitor)
library(curl)


# 4. download data ####
# using the tidyverse::read_ series of packages we can read and import data to our R environment
# for example: object_name <- read_csv()

# datasets are here:
# https://github.com/renedarioherrera/r-for-epidemiology/tree/main/data-raw

# 4.1 CSV
# csv: https://github.com/renedarioherrera/r-for-epidemiology/blob/main/data-raw/us-covid-19-community-level-by-county.csv
# use read_csv to load the data url above

# but first create folder named 'data-raw'
dir.create(path = "data-raw")

# because I am loading from a URL I need to use CURL to download the file
csv_file <- curl_download(
  url = "https://raw.githubusercontent.com/renedarioherrera/r-for-epidemiology/main/data-raw/us-covid-19-community-level-by-county.csv",
  destfile = "data-raw/csv-data.csv"
)

# try using read_csv to import the csv file to your environment


# 4.2 SAS
# sas: https://github.com/renedarioherrera/r-for-epidemiology/blob/main/data-raw/us-covid-19-community-level-by-county.sas7bdat
# use read_sas to load the data url above
# because I am loading from a URL I need to use CURL to download the file
sas_file <- curl_download(
  url = "https://raw.githubusercontent.com/renedarioherrera/r-for-epidemiology/main/data-raw/us-covid-19-community-level-by-county.sas7bdat",
  destfile = "data-raw/csv-data.sas"
)

# try using read_sas to import the sas7bdat file to your environment




## 4.3 Excel Workbook 
# excel: https://github.com/renedarioherrera/r-for-epidemiology/blob/main/data-raw/us-covid-19-community-level-by-county.xlsx
# use read_excel to load the data url above
# because I am loading from a URL I need to use CURL to download the file
excel_file <- curl_download(
  url = "https://raw.githubusercontent.com/renedarioherrera/r-for-epidemiology/main/data-raw/us-covid-19-community-level-by-county.xlsx",
  destfile = "data-raw/csv-data.xlsx"
)

# try using read_excel to import the xlsx file to your environment


