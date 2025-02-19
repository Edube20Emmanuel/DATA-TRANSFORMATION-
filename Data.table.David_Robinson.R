### Set my working directorate ###
setwd("H:\\2024-25-R-Analysis\\2025-Analysis\\Practise")

## Load the required libraries ##
library(tidyverse)
library(tidyselect)
library(ggplot2)
library(data.table)
library(readr)
library(readxl)

### Loading my data set from the internet by using the url ---
salaries <- fread("http://dgrtwo.github.io/pages/lahman/Salaries.csv",na.strings = "")
View(salaries)
class(salaries)

### Checking for the shape of the data set
dim(salaries)

## selecting and filtering rows and columns
# Using the index method
salaries[1,]

## Mutliple rows
salaries[1:10, ]

### Selecting a column
salaries[,1:3]
salaries[,yearID,lgID]
## Using the list(.) to return results in data.table
seleected <- salaries[,list(yearID,teamID,lgID)]
seleected %>% 
  view()
salaries[,.(yearID,teamID)]

## Filtering rows based on a single or many colunms ---
# years above 2000
salaries[yearID > 2000, ]

## Only players of 2010
salaries[yearID == 2010, ]

## Players in AL legeau
salaries[lgID == "AL",]

## Players in BAL team and in AL
salaries[teamID == "BAL" & lgID == "AL", ]

## Players in AL lgID or year above 2010
salaries[lgID == "AL" | yearID > 2010, ]

## Ordering the data by a given column using the order function
salaries[order(salary)]

## ordering the filtered data
salary2010 = salaries[lgID == "AL" & yearID == 2010,]
salary2010[order(salary)]

## Ordering basing on two couns
salaries[order(yearID,salary)]
