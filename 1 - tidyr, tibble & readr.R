# Session 1 - tidyr, tibble & readr (20 minutes)
# 
# Presentation: The structure of messy and tidy data
# Discussion: Identifying problems with data structure
# Presentation: Tidyverse solutions
# Exercise: Identify various paradigms in data analysis workflows
# Q & A
# {break, 5 mins}
##################################################################################################################

rm(list = ls())

library(tidyverse)


# tidyr, tibble & readr



##################################################################################################################
# Discussion: Identifying problems with data structure

# In base R:
protein <- read.delim("data/science/Protein.txt")
str(protein)
class(protein)

# What's wrong with this?
# 1 - Character becomes factor by default
# 2 - These behave diferently:
protein[3] # data frame :/
protein$Peptides # vector
protein[,3] # vector
protein[[3]] # vector

# 3 - print to screen is pretty terrible :/
protein # Short cut for print(protein)

# In the tidyverse:
protein <- read_tsv("data/science/protein.txt")

# 1 - Character remains character
glimpse(protein)
class(protein)

# 2 - These behave the same way:
# Return a tibble
protein[3]
protein[,3]

# But this is always a vector:
protein$Peptides
protein[[3]]

# 3 - Lovely print-out to screen
protein

# But is this data tidy?

# nooo....
# But at least it has some great variable names :)

# Let's take a smaller data set for now:

PlantGrowth_wide <- read_tsv("data/plants/PlantGrowth_wide.txt")

# how would we do the following things to this data set?

# Plot the weight of each plant, described by it's group
# Calculate a linear model of the weight described by the group
# Calculate descriptive statistics of each group
# Calculate a transformation statistics of each group

# All of those things get easier with tidy data!
PlantGrowth_tidy <- read_tsv("data/plants/PlantGrowth_long.txt")

# So how to go from wide "messy" to long "tidy"?
# Use gather()



# Let's imagine that I had another variable, which was the week that I did the experiment.
# I'd want to aggregrate across all weeks, but first that is an interesting variable 
# in the data set:

PlantGrowth_wide_2weeks <- read_tsv("data/plants/PlantGrowth_wide_2weeks.txt")

# Exercise: Identify various paradigms in data analysis workflows

