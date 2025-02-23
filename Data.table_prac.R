### CREATING THE WORKING DIRECTORATE ###
setwd("H:\\2024-25-R-Analysis\\2025-Analysis\\Practise")

## Loading the required libraries
library(tidyverse)
library(readr)
library(readxl)
library(ggplot2)
library(data.table)

## loading my data set
salaries3 <- fread("http://dgrtwo.github.io/pages/lahman/Salaries.csv",na.strings = "")
salaries3

## EDA
dim(salaries3) #rows ------> 23956, columns -------> 5

## Selection of rows and columns in data.table
# First 10 rows
salaries3[1:10, ]

# filtering only playes in AL lgID
salaries3[lgID == "AL",]

## Filtering a given row
salaries3[1,]

# Filtering multiple rows and columns
salaries3[10:20,]

## Selectig specific columns
salaries3[1:5,.(lgID,salary)]

# Using the index format
salaries3[50:100,2:5]

# Filtering by logical functions
salaries3[yearID > 2010, ]
salaries3[yearID > 2012, ]$salary

## Using the list(.) to return results in data.table
seleced <- salaries3[,.(yearID,lgID,salary)]
seleced %>% view()

## Filtering rows based on a single or many colunms ---
# years above 2000
salaries3[yearID > 2000]

## Only players of 2010
salaries3[yearID == 2000, ][1:10,] 
salaries3[yearID == 2000, ][1:10,] %>% view()

## Players in AL legeau
AL_DF <- salaries3[lgID == "AL"]
head(AL_DF,10)

# Combining of logical functions
## Players in BAL team and in AL
salaries3[teamID == "BAL" & lgID == "AL"][5:15,]

## Players in AL lgID or year above 2010
salaries3[lgID == "AL" & yearID > 2010][1:10,]

## Ordering the data by a given column using the order function
salaries3[order(salary)]
salaries3[order(salary,decreasing = TRUE),][1:10,]

## ordering the filtered data
salaries2010 = salaries3[yearID == 2010 & lgID == "AL"][1:20,]
salaries2010
salaries2010[order(salary)]

## Ordering basing on two columns
salaries3[order(yearID,salary)][1:10,]

