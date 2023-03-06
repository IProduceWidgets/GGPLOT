### This is a script that checks the validity of Kynetec Data 
# brand ownership tranformations recieved from coauthors.

# load packages
require(tidyverse)
require(dplyr)
require(haven)
require(readxl)

# load data ####

Corn <- read_dta("C:\\Users\\avery\\Downloads\\corn_kynetec_data.dta")
Soy <- read_dta("C:\\Users\\avery\\Downloads\\soy_kynetec_data.dta")


# Data Cleaning for comparisons #####
# cut down the data to just what is needed to evaluate the recieved code.
# Add crop var, Add uid var
# remove all except:
# CompanyBrand, HybridVariety, year, CompanyParent

Corn_Cut <- Corn %>%
  transmute(
    uid = row_number(),
    crop = "Corn",
    year,
    HybridVariety,
    brandcompany = CompanyBrand, # Stata file will change this
    Origbrandcompany = CompanyBrand, # Our variable that will remain the same
    companyparent = CompanyParent, # Stata file will change this
    OrigcompanyparentLevels = zap_labels(CompanyParent), # preserves the # assignment
    OrigcompanyparentFactor = as_factor(CompanyParent) # Shows the company parent name
  ) %>%
  write_dta(path = "C:\\Users\\avery\\Downloads\\CUT_corn_kynetec_data.dta")

Soy_Cut <- Soy %>%
  transmute(
    uid = row_number(),
    crop = "Soy",
    year,
    HybridVariety,
    brandcompany = CompanyBrand, # Stata file will change this
    Origbrandcompany = CompanyBrand, # Our variable that will remain the same
    companyparent = CompanyParent, # Stata file will change this
    OrigcompanyparentLevels = zap_labels(CompanyParent), # preserves the # assignment
    OrigcompanyparentFactor = as_factor(CompanyParent) # Shows the company parent name
  ) %>%
  write_dta(path = "C:\\Users\\avery\\Downloads\\CUT_soy_kynetec_data.dta")

# Load New Data from Ed.P #####
#Corn
Corn_Mask_EdP <- read_dta("C:\\Users\\avery\\Downloads\\Corn_Mask_EdP.dta") %>%
  filter(!is.na(acquired)) %>% #Step needed to replace acquired NAs with 1995/6
  transmute(
         crop,
         Origbrandcompany,
         OrigcompanyparentLevels = zap_labels(OrigcompanyparentFactor),
         OrigcompanyparentFactor = as_factor(OrigcompanyparentFactor),
         acquired = acquired+1, # this is for "previously purchased seeds"
         orig_comp
         ) %>%
  unique()

#Soy
Soy_Mask_EdP <- read_dta("C:\\Users\\avery\\Downloads\\Soy_Mask_EdP.dta") %>%
  filter(!is.na(acquired)) %>% #Step needed to replace acquired NAs with 1995/6
  transmute(
         crop,
         Origbrandcompany,
         OrigcompanyparentLevels = zap_labels(OrigcompanyparentFactor),
         OrigcompanyparentFactor = as_factor(OrigcompanyparentFactor),
         acquired = acquired+1, # this is for "previously purchased seeds",
         orig_comp
         ) %>%
  unique()

# Load Phil Howard Data #####

PH_SalesData <- read_xls(
  path = "C:\\Users\\avery\\Desktop\\Research\\Herbicide_Resistance\\BrandWorkspace\\GlobalSeed2018.xls",
  sheet = "Sheet3",
  range = "A1:C400"
) %>%
  transmute(
    Owner = toupper(Firm),
    Owned = toupper(.[[2]]), # index instead of that awful var name.
    Year
  ) %>%
  drop_na() # Drops one obs on line 130 of the .xls

N <- nrow(PH_SalesData)
for (i in 1:N){
  a <- PH_SalesData[i,1]
  b <- PH_SalesData[i,2]
  
  for (j in i:N) {
    if(PH_SalesData[j,1] == b){
      PH_SalesData[j,1] <- a
    }
  }
}

