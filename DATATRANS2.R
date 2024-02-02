### DATA TRANSFORMATION #####
setwd( "C:/Users/irfan/Documents/GitHub/DATA-TRANSFORMATION-")
library(tidyverse)
library(tidyr)

### DATA SET ###
data()
msleep
view(msleep)

### REMOVE MISSING DATA ####
sum(is.na(msleep))

#### sleep total ###
sum(is.na(msleep$sleep_total))   ###No missing data

### sleep rem ####
sum(is.na(msleep$sleep_rem))
##Remove the 22 missing data
boxplot(msleep$sleep_rem) ## It is nearly distributed hence we impute missing values with median
## sleep_rm also has outliers
msleep$sleep_rem[is.na(msleep$sleep_rem)] <- mean(msleep$sleep_rem, na.rm = TRUE)

view(msleep$sleep_rem)
sum(is.na(msleep$sleep_rem))

##### sleep_cycle ####
sum(is.na(msleep$sleep_cycle)) ## It has 51 missing data
boxplot(msleep$sleep_cycle) ### Not normally distributed hence we impute wwith mode

msleep$sleep_cycle[is.na(msleep$sleep_cycle)] <- median(msleep$sleep_cycle, na.rm = TRUE)
sum(is.na(msleep$sleep_cycle))
view(msleep$sleep_cycle)

### awake #####
sum(is.na(msleep$awake)) ### Has no missing data

### brainwt #####
sum(is.na(msleep$brainwt)) ### Has 27 missing values

boxplot(msleep$brainwt) ##It is not normally distributed so we impute with median
msleep$brainwt[is.na(msleep$brainwt)] <- median(msleep$brainwt, na.rm = TRUE)
sum(is.na(msleep$brainwt))
view(msleep)

##### DETECTING OUTLIERS ####
### sleep total #####
boxplot(msleep$sleep_total) ### has no outliers

### sleep rem ####
boxplot(msleep$sleep_rem)  #### Has outliers
####### REMOVING #####
summary(msleep$sleep_rem)
IQR(msleep$sleep_rem)
Tmin = 1.150 - (1.5 *1.05)
Tmax = 2.200 + (1.5*1.05)
msleep$sleep_rem[which(msleep$sleep_rem < Tmin | msleep$sleep_rem > Tmax)]
msleep$sleep_rem[which(msleep$sleep_rem > Tmin | msleep$sleep_rem < Tmax)]
msleep$sleep_remNo_outliers <- msleep$sleep_rem[which(msleep$sleep_rem > Tmin | msleep$sleep_rem < Tmax)]

###### msleep_cycl #####
boxplot(msleep$sleep_cycle)
summary(msleep$sleep_cycle)
IQR(msleep$sleep_cycle)
#### msleep_cycle has no outliers

#### AWAKE ####
boxplot(msleep$awake) #No outliers

### Detecting outliers in brainwt #####
boxplot(msleep$brainwt)
summary(msleep$brainwt)
IQR(msleep$brainwt)
Tmin = 0.00635 - (1.5*0.0287)
Tmax = 0.3333 + (1.5*0.0287)
msleep$brainwt[which(msleep$brainwt < Tmin| msleep$brainwt > Tmax)]
msleep$brainwt[which(msleep$brainwt > Tmin| msleep$brainwt < Tmax)]
msleep$brainwt_no_outliers <- msleep$brainwt[which(msleep$brainwt > Tmin| msleep$brainwt < Tmax)]
view(msleep$brainwt_no_outliers)

#### DATA VISUALIZATION ####
msleep %>%
  drop_na(vore) %>%
  #filter(vore %in% c("herbi","omni")) %>%
  ggplot(aes(fct_infreq(vore))) +
  geom_bar(aes(fill = vore),show.legend = FALSE) +
  labs(title = "ANIMAL FEEDING RELATIONSHIP",x="Feeding class")
  

