### SETTING THE WORKING DIRECTORATE ##
setwd("H:\\Big_Data_with_R\\Practise")

## Load the required libraries
library(tidyr)
library(tidyselect)
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("readxl")
installed.packages("readr")
library(readxl)
library(tidyverse)
library(readr)
library(data.table)

## Importing the required data set
df <- read.csv2("ida_credits_to_uganda_01-11-2024.csv")

df2 = fread("ida_credits_to_uganda_01-11-2024.csv", na.strings = "")
df2 %>% 
  view()

## QUESTIONS one
df2 %>% 
  select(`Credit Status`) %>% 
  filter(`Credit Status` %in% "Fully Repaid") %>% 
  count()

## Table
df2 %>% 
  select(`Credit Status`) %>% 
  table() %>% 
  view()

## Question Two
## subsetting the first 10 columns
df2_subset = df2[,0:10]
view(df2_subset)

#df2_subset2 = subset(df2,df2_subset2)

#view(df2_subset2)

## Question three
df2 %>%
  select(`Original Principal Amount (US$)`, `Project Name`) %>%
  group_by(`Project Name`) %>%
  summarize(mean_amount = median(`Original Principal Amount (US$)`, na.rm = TRUE)) %>% 
  view()
