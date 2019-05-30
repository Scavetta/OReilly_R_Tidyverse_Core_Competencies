# Session 3 - purrr & forcats (40 minutes)

# Presentation: Introduction to reiteration
# Discussion: Use case scenarios for map vs walk
# Exercise: Coding challenge exercise
# Discussion: Results and alternative approaches
# Q & A
##################################################################################################################

# Load packages
library(tidyverse)

##################################################################################################################
# Tidyverse Packages: purrr (map()) and forcats

# first get the file names:
my_files <- list.files("data/weather/", full.names = T)

# Use map in the purrr package to import many files:
# a data frame, no ID column
my_files %>%
  map_df(read_tsv)

# A bit more explicit, a data frame, no ID column
my_files %>%
  map_df(~ read_tsv(.))

# A bit more explicit, a data frame, with ID column
my_files %>%
  map_df(~ read_tsv(.), .id = "id")

# A bit more explicit, a data frame, with ID column
# Here we'll use the file names as the factor variable levels
# and then clean them up using the forcats package.
# It's not strictly necessary to use the file names, 
# but it's more explicit than 1,2,3,4
my_files %>%
  ___ %>% 
  mutate(id = ___(id, labels = ___),
         id = ___(id, 
                  ___ = "___",
                  ___ = "___",
                  `___` = "___",
                  ___ = "___")) -> weather

# Build all plots together:
___

##################################################################################################################
# Tidyverse Packages: purrr (walk()) 
# We already saw map, in which we call a function for it's return value.
# how does walk() work?

# Let's clean up our data first:
weather %>% 
  ___ %>% 
  ___ -> weather_summary

# Then make a function that we would call for it's side effects
# An example is saving a file
plotTemp <- function(x) {
  ___(x, aes(x = ___, y = ___, group = ___, col = ___)) +
    ___()
  
  ggsave(paste0(x$id[1],".png"), height = 6, width = 10, unit = "in")
}

# Instead of creating a facetted plot, create an individual plot for each location (id)
# Here, I'm using the base package split() function to make a list of data frames:
weather_summary %>% 
  ___ %>% 
  walk(~ ___(.))

##################################################################################################################
# Alternative approaches
# 1 - The classic for loop
weather_loop <- NULL
for (file in my_files) {
  temp <- read.delim(file)
  temp$id <- sub(".txt", "", basename(file))
  weather_loop <- rbind(weather_loop, temp)
}

# 2 - old school (nested) apply functions, but no ID column added
weather_lapply <- do.call(rbind, lapply(my_files, read.delim))


############################################################################################################
# Exercise: Now that we have stringr and forcats covered, we can return to the protein dataframe ad make it
# properly tidy.

# A) Take the protein description and Uniprot ID columns along with the ratio columns (excluding sig) and make them tidy 
___

# B) Do the same in A, but for the Sig columns
___

# C) Merge two dataframes together. Make sure you have matching joining columns!
___

##################################################################################################################
# Exercise: Bonus Analysis challenge:

# The following dataframe...
medi <- read_tsv("data/meditation/Expression.txt")

# ... contains 24 variables from an experiment conducted to deterimine if meditation has a physiological effect.
# The effect was the gene expression values (then numbers in each column), determined for:
# 6 genes (RIPK2, COX2, CCR7, CXCR1, IL-6 & TNF), 
# 2 treatments (Control & Meditation), and
# 2 time points (morning = 1 and afternoon = 2)

# Exercise: Using the medi dataframe and the functions discussed in this class, calculate the following:

# A) Create a proper tidy dataframe with the following columns:
# - value
# - treatment
# - gene 
# - time
___

# B) Plot the raw values using the following aesthetic mapping:
# - time on the x-axis
# - value on the y-axis
# - treatment on the color-axis
# - gene on separate facets
___

# C) Calculate each of the following statistics for each of the unique 24 combinations of gene, treatment and time:
# - average: the mean of the value
# - n: the number of observations in each group
# - SEM: The standard error of the mean (standard deviation divided by the square root of n)
# - lower95: The upper 95% CI limit
# - upper95: The upper 95% CI limit
___

# D) Reproduce the plot in A, using the mean and the 95% CI instead of the raw values
___

# E) Calculate an ANCOVA using the following formula: value ~ treatment + time for only RIPK2
___

# F) Calculate an ANCOVA, as in E, for all genes.
___