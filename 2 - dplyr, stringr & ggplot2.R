# Session 2 - dplyr, stringr & (bare minimum) ggplot2 (60 minutes)
# 
# Presentation: dplyr 
# Punctuation:
# The pipe operator %>%,

# The five verbs:
# filter(),
# arrange(),
# select(),
# mutate(),
# summarise()

# One adjective 
# group_by()

# Discussion: Building functional sequences with dplyr grammar
# Exercise: Implementing dplyr
# Presentation: Select helper functions and variants of summarise and mutate
# Exercise: Using dplyr helper functions and special variants
# Presentation: Pattern matching with stringr and plotting as part of the tidyverse
# Exercise: Cleaning up data and plotting
# Q & A
############################################################################################################

# Load packages
library(tidyverse)

##################################################################################################################
# Tidyverse Packages: dplyr

# Let's imagine that I had another variable in my plant experiment 
# ID is the week that I did the experiment.

PlantGrowth_wide_2weeks <- read_tsv("data/plants/PlantGrowth_wide_2weeks.txt")

# Exercise: In PlantGrowth_wide_2weeks, calculate the mean and standard 
# deviation for each group (ctrl, trt1, and trt2) for each week
# What steps are involved in this calculation?
___


# Exercise: In PlantGrowth_wide_2weeks, perform a z-score transformation 
# using the scale() function on each group (ctrl, trt1, and trt2)
# (disregard week)
___

# Exercise: Returning to the protein dataframe, 

# A.1) Calculate a log2 transformation on: Ratio.H.M, Ratio.M.L, and Ratio.H.L
___

# A.2) Calculate a z-score transformation on the transofrmed ratio columns
___

# B) Calculate a log10 transformation on: Intensity.H, Intensity.M, and Intensity.L
___

# C) Return a table of proteins that have the a z-score and log2 transformed ratio above 2
___

# D) Return a table of proteins that have the 10 highest Intensity.H
___

############################################################################################################
# Exercise: Using dplyr helper functions and special variants

# summarise_at() and mutate_at() allow you to use these helper functions:
# starts_with("x") -- Select columns starting with "x"
# ends_with("x") -- Select columns starting with "x"

# Exercise: Use the helper functions to perform the above transformations more efficiently: 

# A) Calculate a log2 transformation on all columns beginning with Ratio, but NOT ending with Sig
___

# B) Calculate a log10 transformation on all columns beginning with Int
___

##################################################################################################################
# Tidyverse Packages: stringr

proteinID <- "TBB4_MOUSE"

# Exercise: Using stringr variants
# A logical vector with TRUE where proteinID is found in the Uniprot variable
___(___, ___)

# A character vector containing the matched string
___(___, ___)

# A two-column matrix giving the start and end position of the matching string
___(___, ___)

# A character vector giving the matching sequence to the fuzzy regular expression "T.*E"
___(___, ___)

# The Uniprot column without _MOUSE
___(___, ___)

# The Uniprot column with _HUMAN instead of _MOUSE
___(___, ___)

# Exercise: Using the appropriate stringr functions answer the following questions:

# A) Extract only the Ratio columns for the Uniprot IDs GOGA7_MOUSE and PSA6_MOUSE proteins
___

# B) Keep only the first Uniprot ID (i.e. delete everything after the _)
___

# C) Keep only protein descriptions that contain the phrase "Ubiquitin"
___

# D) Does capitalization make a difference in the answer to C, above?
___

##################################################################################################################
# Tidyverse Packages: ggplot2

# From the presentation:
# PlantGrowth is the built-in data set which is equivalent to PlantGrowth_tidy

ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_jitter(width = 0.1)

ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot(width = 0.1)

# More compact, recycle the base data and aes layers:
g <- ___(___, ___(x = ___, y = ___))

g +
  ___(width = 0.1)

g +
  ___()

# Exercise: Plot PlantGrowth_wide_2weeks. Can we distinguish betweek the two weeks in the plot?



# Exercise: Cleaning up data and plotting

# The file NYNEWYOR.txt contains the average temperature for each day in New York City from 1995 - 2015
NYC <- read_tsv("data/weather/NYNEWYOR.txt")

# Using the functions we've discussed so far, claculate the average temperature for
# each month of each year and plot that agains the month. The plot should have multiple lines
# one for each year

___

# Exercise**: let all the lines be black, except for 2015, which is red.
___