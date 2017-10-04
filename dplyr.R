install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
nycflights13::airlines
nycflights13::weather
nycflights13::flights
nycflights13::airports
View(flights)
View(airlines)
View(weather)

#filter rows
filter(flights, month == 1, day ==1)
jan1 <- filter(flights, month == 1, day ==1)
filter(flights, month == 5, day == 28)
may28 <- filter(flights, month == 5, day == 2)
filter(flights, month == 11 | month == 12)
filter(flights, month == 12 & day == 27)
filter(flights, month == 10 & day == !31)
filter(flights, !(month == 2 | month == 1))

#exercises
nycflights13::airlines
filter(flights,carrier == 5 | carrier == 2 | carrier == 12)
View(airports)
filter(airports, tzone == 7 & tzone == 10)
filter(flights, month == 7 & month ==8 & month == 9)
filter(flights, dep_delay >= 1 & arr_delay > 30)
filter(flights, arr_delay > 2 & dep_delay == 0 )
filter(flights, is.na(dep_time))
View(filter(flights, is.na(dep_time)))
filter(weather, precip != 0)
View(filter(weather, precip != 0))
filter(weather, precip > 1)
View(filter(weather, precip > 1))
filter(flights, month == 8 & day == 28 & year == 2013)
filter(flights, month == 8 & day == 28 & year == 2013 & hour == 18)
View(filter(flights, month == 8 & day == 28 & year == 2013 & hour == 18))

#arrange rows
arrange(flights, year, month, day)
arrange(flights, desc(arr_delay))
View(arrange(flights, desc(arr_delay)))

#select rows
select(flights, year, month, day)
select(flights, arr_delay, month, day)

select(flights, year:day) #select columns between year and day
select(flights, -(year:day)) #select all columns except those b/w year & day

#mutate rows
flights_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)
mutate(flights_sml, gain = arr_delay - dep_delay, speed = distance / air_time * 60)
mutate(flights_sml, gain = arr_delay - dep_delay, hours = air_time / 60, gain_per_hour = gain /hours)
#added new variable columbs by defining them as functions of other variables
transmute(flights_sml, gain = arr_delay - dep_delay, hours = air_time / 60, gain_per_hour = gain /hours)
#trasnmute keeps news variables

#summarize
summarize(flights, delay = mean(dep_delay, na.rm = TRUE))
summarize(flights, distance = mean(distance, na.rm = TRUE))
summarize(weather, wind_speed = mean(wind_speed, na.rm = TRUE))

#summarize by grouping
by_group <- group_by(flights, year, month, day)
summarize(by_group, delay = mean(dep_delay, na.rm= TRUE))

#combining all functions
by_dest <- group_by(flights, dest) #GROUPS FLIGHTS BY DESTINATION
delay <- summarize(by_dest, count = n(), dist = mean(distance, na.rm =TRUE), delay = mean(arr_delay, na.rm =TRUE))
#summarize to compute distance, avg delay, and number of flights
delay <- filter(delay, count > 20, dest != "HNL") #filter to remove noisy points and HNL airport
ggplot(data = delay, mapping = aes(x = dist, y = delay)) + geom_point(aes(size = count), alpha = 1/3) + geom_smooth(se =FALSE)

by_temp <- group_by(weather, temp)
precip <- summarize(by_temp, count = n(), humid = mean(humid, na.rm = TRUE), precip = mean(precip, na.rm = TRUE))
ggplot(data = precip, mapping = aes(x = humid, y = precip)) + geom_point(aes(size = count), alpha = 1/5) + geom_smooth(se = FALSE)

#counts and the pipe
# x %>% f(y) = f(x,y) (the pipe) 
# x %>% f(y) %>% g(z) = g(f(x,y), z) 

not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(
    delay = mean(arr_delay)
  )
ggplot(data = delays, mapping = aes(x = delay)) + geom_freqpoly(binwidth = 10)
  )

  