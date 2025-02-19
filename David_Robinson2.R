#### SETTING THE WORKING DIRECTORATE ---
setwd("H:/2024-25-R-Analysis/2025-Analysis/Practise")

## Loading the required library ---
library(tidyverse)
library(tidyselect)
library(readr)
library(readxl)
library(data.table)
library(ggplot2)

### Loading the data set ---
salaries <- fread("http://dgrtwo.github.io/pages/lahman/Salaries.csv",na.strings = "")
salaries %>% 
  view()

### Grouping and summarizing ---
# Mean of salary --
salaries$salary %>% 
  mean()              # mean ----------> 1864357

# Median of salary --
salaries$salary %>% 
  median()           # median ----------> 507950

# max of salary--
salaries$salary %>% 
  max()               # maximum ---------> 33000000

## summary stats in data.table ---
## mean by year
salaries[,mean(salary),by="yearID"]

## change the name of the columns
salaries[,.(Average = mean(salary)),by="yearID"]

## Find the average and maximum salary by year
summarized.year = salaries[,list(Average = mean(salary),Maximum = max(salary)),by="yearID"]
summarized.year

## Find the average and median salary by lgID
summarized.lg = salaries[,.(Average = mean(salary),Median = median(salary),Maximum = max(salary)),by="lgID"]
summarized.lg %>% 
  view()

## Filter all rows greater than 2000 from summarized.year
summarized.year %>% 
  filter(yearID > 2000)

# We can also do this
summarized.year[yearID > 2000,] %>% 
  view()

## Sort the summerized data set to find the highest salary
summarized.year[order(Maximum,Average,decreasing = TRUE),]

## Find the mean and maximum salary based on year and lgID
summerized.year.lg = salaries[,.(Average = mean(salary),Maximum = max(salary)),by = c("yearID","lgID")]
summerized.year.lg %>% 
  view()

## Find the mean and maximum salary based on lgID and teamID
summerized.lg.team = salaries[,.(Average = mean(salary),Maximum = max(salary)),by = c("lgID","teamID")]
summerized.lg.team

## Summary stats on the entire data set
summary(salaries)

## Counting the number of players in each league and teamID
lg_team_count = salaries[,.(count_value= .N),by=c("lgID","teamID")]
lg_team_count %>% 
  View()

## Count the number of players in each league
lg_count2 = salaries[,.(Value_count = .N),by = "lgID"]
lg_count2

## Using another column to retuurn another columns
salaries %>% 
  head(4) %>% 
  view()

# Row with maximum salary
salaries[salary == max(salary),] %>% 
  view()

## Checking for the trends
salaries %>% 
  ggplot(aes(yearID,salary)) + 
  geom_point()

# Using boxplot
salaries %>% 
  ggplot(aes(yearID, salary)) +
  geom_bar()

## Using the summerized data to see te trend
summarized.year %>% 
  ggplot(aes(yearID,Average,colour = Maximum)) + 
  geom_line()

ggplot(summerized.year.lg,aes(yearID,Average,colour = lgID)) + geom_line()
