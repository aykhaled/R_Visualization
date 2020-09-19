## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Effective Visualizations in R
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### These visualizations are based on 'Grammar of Graphics' using R Package - **'ggplot2'**

### Install Packages
# ------------------

# install.packages('ggplot2')
# install.packages('tidyverse')
# install.packages("ggalt")
# install.packages('GGally')
# install.packages('ggridges')


# notes :
# 1. 'tidyverse' is for overall data handling. It contains 'ggplot2' 
#     with other required packages like 'dplyr'.
# 2. 'ggalt' is especially required for Dumbbell plot
# 3. 'GGally' is especially required for Matrix Scatter plot
# 4. 'ggridges' is especially required for Ridge plot
# 5. Remove the '#' to uncomment and run the above codes to install the packages
# 6. You will need to install the packages only once
# 7. R is case-sensitive !


### Load packages
# ---------------

library(tidyverse)
library(ggalt)
library(GGally)
library(ggridges)


### Explore Datasets
# ------------------

#### Inbuild datasets

# check dataset information
#?iris
#?diamonds

# load datasets
data_iris <- iris
data_diamonds <- diamonds

# look-over datasets
head(data_iris)
head(data_diamonds)

#### External Datasets

# set working directory
setwd("E:/My_R/github/R_Viz")
# note : write your own directory where you saved the csv files. 
#        make sure to change '\' by '/' !

# import datasets
data_names <- read.csv("names.csv", header = TRUE)
data_life_exp <- read.csv("life_expectency.csv", header = TRUE)

# look-over datasets
head(data_names)
head(data_life_exp)

#### View Datasets

View(data_iris)
View(data_diamonds)
View(data_names)
View(data_life_exp)


### **Scatter Plot**
# ---------------------
# ***dataset : iris***
  
#### Basic Scatter Plot

ggplot(data_iris) +
  geom_point(aes(x = Sepal.Length , y = Sepal.Width), color = 'red', size = 4, pch = 18) +
  
  ggtitle("Iris Scatter Plot(1)") +
  xlab("SEPAL LENGTH") +
  ylab("SEPAL WIDTH") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold.italic', color = 'darkgreen',
                                   size = 12, angle = 0),
        axis.text.y = element_text(face = 'bold', color = 'black',
                                   size = 12, angle = 45))


#### Scatter Plot with Feature differentiation by Color & Shape

ggplot(data_iris) +
  geom_point(aes(x = Sepal.Length , y = Sepal.Width,
                 color = Species, shape = Species), size = 4) +
  
  ggtitle("Iris Scatter Plot(2)") +
  xlab("SEPAL LENGTH") +
  ylab("SEPAL WIDTH") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold.italic', color = 'darkgreen',
                                   size = 12, angle = 0),
        axis.text.y = element_text(face = 'bold', color = 'black',
                                   size = 12, angle = 45))


#### Scatter Plot with Feature differentiation by Size and Transparency

ggplot(data_iris) +
  geom_point(aes(x = Sepal.Length , y = Sepal.Width,
                 size = Species, alpha = Species)) +
  
  ggtitle("Iris Scatter Plot(3)") +
  xlab("SEPAL LENGTH") +
  ylab("SEPAL WIDTH") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold.italic', color = 'darkgreen',
                                   size = 12, angle = 0),
        axis.text.y = element_text(face = 'bold', color = 'black',
                                   size = 12, angle = 45))


### **Line Plot**
# ----------------------
# ***dataset : names***

#### Basic Line Plot

d0 <- data_names %>% filter(name == 'Helen')

ggplot(d0) +
  geom_line(aes(x = year, y = n), lwd = 1.25, color = 'darkgreen') +
  
  ggtitle("Line Plot (name : 'Helen')") +
  xlab("YEAR") +
  ylab("NUMBER") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#### Line Plot with Feature differentiation by Color

ggplot(data_names) +
  geom_line(aes(x = year, y = n, color = name), lwd = 1.25) +
  
  ggtitle("Line Plot (all names)") +
  xlab("YEAR") +
  ylab("NUMBER") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))



### **Bar Plot**
# -------------------------
# ***dataset : diamonds***

#### Basic Bar Plot (1)

d1 <- as.data.frame(table(data_diamonds$cut))
head(d1)

ggplot(d1) +
  geom_bar(aes(x = Var1, y = Freq), stat = 'identity', fill = 'darkgreen') +
  
  ggtitle("Bar Plot (1)") +
  xlab("CUT") +
  ylab("COUNT") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#### Basic Bar Plot transformed to Polar

d1 <- as.data.frame(table(data_diamonds$cut))
head(d1)

ggplot(d1) +
  geom_bar(aes(x = Var1, y = Freq, fill = Var1), stat = 'identity') +
  
  ggtitle("Polar Transform") +
  xlab("CUT") +
  ylab("COUNT") +
  
  coord_polar("y") +
  
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#### Basic Bar Plot (2)

ggplot(data_diamonds) +
  geom_bar(aes(x = cut, fill = cut)) +
  
  ggtitle("Bar Plot (2)") +
  xlab("CUT") +
  ylab("COUNT") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#### Stacked Bar Plot

ggplot(data_diamonds) +
  geom_bar(aes(x = cut, fill = clarity)) +
  
  ggtitle("Stacked Bar Plot") +
  xlab("CUT") +
  ylab("COUNT") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#### Stacked Bar Plot (Same Height)

ggplot(data_diamonds) +
  geom_bar(aes(x = cut, fill = clarity), position = 'fill') +
  
  ggtitle("Stacked Bar Plot (same height)") +
  xlab("CUT") +
  ylab("COUNT") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#### Grouped Bar Plot

ggplot(data_diamonds) +
  geom_bar(aes(x = cut, fill = clarity), position = 'dodge') +
  
  ggtitle("Grouped Bar Plot") +
  xlab("CUT") +
  ylab("COUNT") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#### Stacked Bar Plot transformed to Polar (1)

ggplot(data_diamonds) +
  geom_bar(aes(x = cut, fill = clarity)) +
  
  ggtitle("Stacked Polar (1)") +
  xlab("CUT") +
  ylab("COUNT") +
  
  coord_polar("y") +
  
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#### Stacked Bar Plot transformed to Polar (2)

ggplot(data_diamonds) +
  geom_bar(aes(x = cut, fill = clarity)) +
  
  ggtitle("Stacked Polar (2)") +
  xlab("CUT") +
  ylab("COUNT") +
  
  coord_polar() +
  
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))



### **Tiles Plot**
# -------------------------
# ***dataset : diamonds***

d2 <- as.data.frame(table(data_diamonds$cut, data_diamonds$color))
head(d2)

ggplot(d2) +
  geom_tile(aes(x = Var1, y = Var2, fill = Freq)) +
  
  ggtitle("Tiles Plot [Cut vs Color]") +
  xlab("CUT") +
  ylab("COLOR") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))



### **Dumbbell Plot**
# ------------------------
# ***dataset : life_exp***
  
ggplot(data_life_exp) +
  geom_dumbbell(aes(x = Y1967, xend = Y2007, y = country, group = country),
                colour = 'lightblue', size = 4,
                colour_x = 'blue', colour_xend = 'violet') +
  
  ggtitle('Dumbbell Plot (Life Expenctancy 1967 ~ 2007)') +
  xlab('YEAR') +
  ylab('COUNTRY') +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))



### **Matrix Scatter Plot**
# --------------------------
# ***dataset : iris***
  
#### Basic Matrix Scatter Plot 

ggpairs(data_iris[ , 1:4]) +
  theme_bw()


#### Matrix Scatter Plot with Feature Differentation

ggpairs(data_iris, aes(color = Species)) +
  theme_bw()



### **Histogram**
# -------------------------
# ***dataset : diamonds***
  
#### Basic Histogram

ggplot(data_diamonds) +
  geom_histogram(aes(x = price), fill = 'blue', binwidth = 500) +
  
  ggtitle("Histogram [price]") +
  xlab("PRICE") +
  ylab("Frequency") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))

#### Stacked Histogram

ggplot(data_diamonds) +
  geom_histogram(aes(x = price, fill = color), binwidth = 500) +
  
  ggtitle("Stacked Histogram [price]") +
  xlab("PRICE") +
  ylab("Frequency") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))



### **Box Plot**
# -------------------------
# ***dataset : diamonds***
  
#### Basic Box Plot

ggplot(data_diamonds) +
  geom_boxplot(aes(x = x, fill = clarity)) +
  coord_flip() +
  
  ggtitle("Box Plot [x]") +
  xlab("x") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


#### Box Plot Transferred to Polar

ggplot(data_diamonds) +
  geom_boxplot(aes(x = x, fill = clarity)) +
  coord_polar("y") +
  
  ggtitle("Box Plot- Polar [x]") +
  xlab("x") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))



### **Violin Plot**
# -------------------------
# ***dataset : diamonds***

ggplot(data_diamonds) +
  geom_violin(aes(x = cut , y = price, fill = cut)) +
  
  ggtitle("Violin Plot [Cut]") +
  xlab("CUT") +
  ylab("PRICE") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))



### **Ridge Plot**
# -------------------------
# ***dataset : diamonds***
  
ggplot(data_diamonds) +
  geom_density_ridges(aes(x = price , y = cut, fill = cut)) +
  
  ggtitle("Ridgeplot Plot [Cut]") +
  xlab("PRICE") +
  ylab("CUT") +
  theme_bw() +
  
  theme(axis.text.x = element_text(face = 'bold', size = 10),
        axis.text.y = element_text(face = 'bold', size = 10))


### If you like to contact me :

#-  https://www.linkedin.com/in/aykhaled/
  
#-  https://github.com/aykhaled/
  
#-  https://medium.com/@aykhaled

#-  myds2020@gmail.com




