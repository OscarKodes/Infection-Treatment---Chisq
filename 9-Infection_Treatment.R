
# Clear Everything
rm(list = ls())

# Set working directory
setwd("G:/My Drive/0) Current Courses/Data710-Everson/HW-Assignments")

# Get working directory
getwd()

# Get data
data <- read.csv("Infection Treatments.csv")

# Examine data
head(data)
tail(data)
str(data)
summary(data)
colnames(data)

# library
library(tidyverse)

# Relabel Infection with 1 and 2 for order
data$Infection <- ifelse(data$Infection == "Yes", "1-Yes", "2-No")


## BIVARIATE TABLES ===============================

# First Variable: Infection = Label for Rows going across
# Second Variable: Treatment = Label for Columns going down

table(data$Infection, data$Treatment) ## This shows Treatment as the independent variable

## CHI-SQUARE TESTS ==============================

# If you want each cell as a proportion of all observations.
prop.table(table(data$Infection, data$Treatment))

# If you want to express the proportion as percentage of rows going across.
prop.table(table(data$Infection, data$Treatment), 1)

# If you want to express the proportion as percentage of columns going down.
prop.table(table(data$Infection, data$Treatment), 2)

# CHI SQUARE TEST HERE
chisq.test(data$Infection, data$Treatment)


## NICER TABLES (CROSS TABULATION TABLES WITH CHI-SQ TEST)============

# need descr package for crosstab() function
library(descr)

# Use apply_labels on DataFrame GSS
# GSS = apply_labels(GSS,
#                    marital = "Marital Status",
#                    marital = c("Married" = 1,
#                                "Widowed" = 2,
#                                "Divorced" = 3,
#                                "Seperated" = 4,
#                                "Never Married" = 5),
#                    happy = "Happiness",
#                    happy = c("Very Happy" = 2,
#                              "Pretty Happy"= 3,
#                              "Not too happy" = 4))

# crosstab() gives better looking tables
crosstab(data$Infection,
         data$Treatment,
         prop.c = T,
         chisq = T)



















