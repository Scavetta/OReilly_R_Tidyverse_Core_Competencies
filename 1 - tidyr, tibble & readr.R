# Session 1 - tidyr, tibble & readr (20 minutes)
# 
# Presentation: The structure of messy and tidy data
# Discussion: Identifying problems with data structure
# Presentation: Tidyverse solutions
# Exercise: Identify various paradigms in data analysis workflows
# Q & A
##################################################################################################################

# Clear the workspace
rm(list = ls())

# Load packages
library(tidyverse)

##################################################################################################################
# Discussion: Identifying problems with data structure

# In base R:
protein <- read.delim("data/science/Protein.txt")
class(protein)

# What's wrong with this?
# 1 - Character becomes factor by default
___(protein)

# 2 - These behave diferently:
protein[3] # data frame :/
protein$Peptides # vector
protein[,3] # vector
protein[[3]] # vector

# 3 - print to screen is pretty terrible :/
___ # Short cut for print(protein)

##################################################################################################################
# Tidyverse Packages: readr & tibble
# Let's try the tidyverse version:
protein <- read_tsv("data/science/protein.txt")
class(protein)

# 1 - Character remains character
___(protein)

# 2 - These behave the same way:
# Return a tibble
protein[3]
protein[,3]

# But this is always a vector:
protein$Peptides
protein[[3]]

# 3 - Lovely print-out to screen
___

# But is this data tidy?

# nooo....
# But at least it has some great variable names :)
# we'll get back to it later on.


##################################################################################################################
# Tidyverse Packages: tidyr

# Let's take a smaller data set for now:

PlantGrowth_wide <- read_tsv("data/plants/PlantGrowth_wide.txt")

# Exercise: How would we do the following things to this data set?
# Try to solve the following problems using PlantGrowth_wide

# A) Plot the weight of each plant, described by it's group

# B) Calculate a linear model of the weight described by the group

# C) Calculate descriptive statistics of each group

# D) Calculate a transformation statistics of each group

# All of those things get easier with tidy data!
PlantGrowth_tidy <- read_tsv("data/plants/PlantGrowth_long.txt")

# So how to go from wide "messy" to long "tidy"?
# Use gather() to convert PlantGrowth_wide to PlantGrowth_tidy
___ %>% 
  ___

# Exercise: Let's give it another try
# Try to solve the following problems using PlantGrowth_tidy

# A) Plot the weight of each plant, described by it's group

# B) Calculate a linear model of the weight described by the group

# C) Calculate descriptive statistics of each group

# D) Calculate a transformation statistics of each group

