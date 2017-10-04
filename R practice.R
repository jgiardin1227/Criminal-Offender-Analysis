data(iris) # This command loads a built-in dataset from R about flowers.
View(iris)
help(iris) # The help file provide some details about the dataset.

summary(iris) # Summary stats


# Now let's do some plots

# If you don't have these two libraries, please install them first by using 
# the the packages tab (bottom right pane)

library(ggplot2) # This package is very useful for graphs
library(dplyr)  # This package ('data plyer') is very useful for manipulating datasets


ggplot(data=iris) + aes(x=Species) + geom_bar(fill='blue')

ggplot(data=iris) + aes(x=Sepal.Length) + geom_histogram()

ggplot(data=iris) + aes(x=Sepal.Length) + geom_histogram(aes(y=..density..), fill='blue') +
  geom_density(col='red')


ggplot(data=iris) + aes(x=Sepal.Length, y=Sepal.Width) + geom_point()

ggplot(data=iris) + aes(x=Sepal.Length, y=Sepal.Width, col=Species) + geom_point()

ggplot(data=iris) + aes(x=Sepal.Length, y=Sepal.Width, col=Species) + 
  geom_point() +
  geom_smooth()

# If you need to fit a linear model, we can specify that using the 'method' parameter.
ggplot(data=iris) + aes(x=Sepal.Length, y=Sepal.Width, col=Species) + 
  geom_point() +
  geom_smooth(method = 'lm')

# It seems like the two species, vesicolor and virginica are kind of looks the same,  Let's 
# combine them into one sepecies and create a new variable called 'New_Species'.
iris$New_Species = recode(iris$Species, 'setosa'='S', 'versicolor'='V', 'virginica'='V')
View(iris)

ggplot(data=iris) + aes(x=Sepal.Length, y=Sepal.Width, col=New_Species) + 
  geom_point() +
  geom_smooth(method='lm')

ggplot(data=iris) + aes(x=New_Species) + geom_bar(fill='blue')
