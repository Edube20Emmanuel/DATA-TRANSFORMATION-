#####visualization practise#####
library(tidyverse)
data()
BOD
?BOD
ggplot(data = BOD,mapping = aes(x = Time,y = demand)) +
  geom_point(size = 4,alpha = 0.5) +
  geom_line(color = "red") +
  labs(X = "TIME",Y = "OXYGEN DEMAND", title = "BIOCHEMICAL DEMAND") +
  theme_bw()

#SECOND APPROACH
CO2
View(CO2)
?CO2
CO2 %>%
  ggplot(aes(conc,uptake, color = Treatment)) +
  geom_point(size = 3) +
  geom_smooth(method = lm,se = F) +
  facet_wrap(~Type) +
  labs(title = "CO2 CONCENTRATION")
  theme_bw()

CO2 %>%
  ggplot(aes(Treatment,uptake)) +
  geom_boxplot() +
  geom_point(aes(color = Plant, size = conc),alpha = 0.5) +
  coord_flip() +
  facet_wrap(~Type) +
  labs(title = "TREATNENT VS CONCENTRATION") +
  theme_bw()

data()
mpg
view(mpg)

mpg %>%
  filter(cty < 25) %>%
  ggplot(aes(displ,cty)) +
  geom_point(aes(color = drv, size = trans)) +
  geom_smooth(method = lm) +
  facet_wrap(~year) +
  labs(title = "Fuel Efficiency", x = "Engine size", y = "Efficiency in City")

msleep
view(msleep)
msleep %>%
  drop_na(vore) %>%
  ggplot(aes(vore)) +
  geom_bar(fill = "lightblue")
  

msleep %>%
  ggplot(aes(awake)) +
  geom_histogram(binwidth = 2, fill = "lightblue") +
  scale_fill_brewer(palette = "Dark2")

#MISSING DATA
summary(msleep$brainwt)
sum(is.na(msleep$brainwt))

boxplot(msleep$brainwt)
msleep$brainwt[is.na(msleep$brainwt)] <- median(msleep$brainwt, na.rm = TRUE)
msleep$New <- msleep$brainwt[is.na(msleep$brainwt)] <- median(msleep$brainwt, na.rm = TRUE)

sum(is.na(msleep$New))
view(msleep$New)
view(msleep)
