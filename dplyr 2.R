#exploratory data analysis
library(tidyverse)
library(ggplot2)

#bar chart
ggplot(data=diamonds) + geom_bar(mapping = aes(x = cut))
diamonds %>%
  count(cut)

#histogram
ggplot(data = diamonds) + geom_histogram(mapping = aes(x = carat), binwidth = 0.5)
ggplot(data = diamonds) + geom_histogram(mapping = aes(x = carat), binwidth = 0.01)

ggplot(data = diamonds) + geom_violin(mapping = aes(x = carat, y=cut), binwidth = 0.01)
ggplot(data = diamonds) + geom_violin(mapping = aes(x = price, y=cut), binwidth = 0.01)

ggplot(data = diamonds) + geom_freqpoly(mapping = aes(x = carat, color=cut), binwidth = 0.1)
diamonds %>%
  count(cut_width(carat,0.5))
smaller <- diamonds %>%
  filter( carat < 3)
ggplot(data = smaller, mapping = aes(x = carat, color=cut)) + geom_histogram(binwidth=0.1)
ggplot(data=smaller, mapping=aes(x=carat, color=cut)) + geom_freqpoly(binwidth=0.1)

ggplot(data=faithful, mapping=aes(x = eruptions)) + geom_histogram(binwidth=0.25)

#outliers
ggplot(diamonds) + geom_histogram(mapping = aes(x=y), binwidth=0.5)
ggplot(diamonds) + geom_histogram(mapping = aes(x=y), binwidth=0.5) + coord_cartesian(ylim=c(0,50))
#coord_cartesian zooms in on a certain axis, in this case it's y
unusual <- diamonds %>%
  filter( y< 3 | y >20) %>%
  arrange(y)
unusual
#dplyr plucks out the "unusual values"

#exercises
View(diamonds)
ggplot(data = diamonds) + geom_bar(mapping = aes(x =clarity))
ggplot(data=diamonds) + geom_bar(mapping = aes(x=color))
ggplot(data=diamonds, mapping = aes(x=carat)) + geom_freqpoly(binwidth=0.1)
ggplot(data=diamonds, mapping = aes( x= carat, y=price)) + geom_point(mapping = aes(color=cut)) + geom_smooth()
#geom_point incorporates a categorical variable into plot

ggplot(data=diamonds) + geom_histogram(mapping = aes(x=price), binwidth =10)
lowerprice <- diamonds %>%
  filter(price < 1500)
ggplot(data=lowerprice, mapping = aes(x=price, color=cut)) + geom_histogram(bindwidth=30)
higherprice <- diamonds %>%
  filter(price > 1500)
ggplot(data=higherprice, mapping = aes(x=price, color=cut)) + geom_histogram(binwidth=30)

#moreexercises
ggplot(data=diamonds, mapping=aes(x=cut, y=price)) + geom_boxplot()
ggplot(data=diamonds, mapping=aes(x=color, y=price)) + geom_boxplot()
ggplot(data=diamonds, mapping=aes(x=clarity, y=price)) + geom_boxplot()
ggplot(data=diamonds, mapping = aes( x= depth, y=price)) + geom_smooth()
ggplot(data=diamonds, mapping = aes( x= carat, y=price)) + geom_smooth()
ggplot(data=diamonds, mapping = aes( x= table, y=price)) + geom_smooth()
