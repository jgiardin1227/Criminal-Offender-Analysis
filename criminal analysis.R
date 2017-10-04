
offender_data <- read_dta("~/Downloads/ICPSR_09325-5/DS0001/09325-0001-Data.dta")
offender_data$V11 <- as.numeric(offender_data$V11)
mental_health_data <- read_dta("~/Downloads/ICPSR_09325-7/DS0003/09325-0003-Data.dta")

View(offender_data)
View(mental_health_data)
library(haven)

offender_data$
num_offenders = offender_data$V6
num_victims = offender_data$V11
month=offender_data$V2
year=offender_data$V4
education = offender_data$V27
employed=offender_data$V28
ethnicity=offender_data$V31
mental_health_event=mental_health_data$V5
violencetype=offender_data$V36
eccentricbehavior=offender_data$V32
location=offender_data$V8

install.packages("dplyr")
library(dplyr)

mapply(c(1,2,3,4),c("white","black","hispanic","other"))

hist(num_victims)
hist(num_offenders)
hist(education)
hist(ethnicity)
hist(employed)

library(ggplot2)

#continuous variables here
ggplot(data=offender_data) + aes(x=num_offenders, y=num_victims) + geom_point(col='blue')

ggplot(data=offender_data) + aes(x=year, y=num_victims) + geom_point(col="blue")

ggplot(data=offender_data) + aes(x=year, y=num_offenders) + geom_point(col='blue')


plot(x=year, y=num_offenders, data=offender_data)
plot(x=year, y= num_victims, data=offender_data)

# discrete variables here
ggplot(data=offender_data) + aes(x=education, y=num_offenders) + geom_point(col='blue')

ggplot(data=offender_data) + aes(x=education, y=num_victims) +geom_point(col="blue")

ggplot(data=offender_data) + aes(x=ethnicity, y=num_offenders) + geom_point(col='blue')

ggplot(data=offender_data) + aes(x=ethnicity, y=education) + geom_point(col='blue')

ggplot(data=offender_data) + aes(x=ethnicity, y=employed) + geom_point(col='blue')

ggplot(data=offender_data) + aes(x=eccentricbehavior, y=num_offenders) + geom_point(col='blue')
