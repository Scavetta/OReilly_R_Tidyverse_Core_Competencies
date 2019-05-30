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

library(tidyverse)

############################################################################################################
# Exercise: Implementing dplyr

# Analytical problems to solve:
# In PlantGrowth_wide_2weeks, calculate the mean and standard deviation for 
# each group (ctrl, trt1, and trt2) for each week




# In PlantGrowth_wide_2weeks, perform a z-score transformation 
# using the scale() function on each group (ctrl, trt1, and trt2)
# (disregard week)



# in protein, calculate the mean and standard deviation for 
# each group (ctrl, trt1, and trt2) for each week



############################################################################################################
# Exercise: Using dplyr helper functions and special variants

# Variants of summarise_at() and mutate_at() allow you to use these helper functions 
# starts_with(x) - names starts with x
# ends_with(x) - names ends in x

# Using protein, perform a log2 transformation on all columns beginning with Ratio, but NOT ending with Sig

# Using protein, perform a log10 transformation on all columns beginning with Int


############################################################################################################
# Exercise: Using stringr variants
# str_detect()
str_detect(protein$Uniprot, "TBB4_MOUSE")

# str_extract()
str_extract(protein$Uniprot, "TBB4_MOUSE")

# str_locate()
str_locate(protein$Uniprot, "TBB4_MOUSE")[1:30,]

# str_match()
str_match(protein$Uniprot, "T.*E")

# str_remove()
str_remove(protein$Uniprot, "_MOUSE")
str_remove_all(protein$Uniprot, "_MOUSE")

# str_replace()
str_replace(protein$Uniprot, "_MOUSE", "_HUMAN")
str_replace_all(protein$Uniprot, "_MOUSE", "_HUMAN")


# Using the appropriate stringr functions answer the following questions:

# Extract only the Ratio columns and the Uniprot IDs GOGA7_MOUSE and PSA6_MOUSE proteins

# Keep only the first Uniprot ID (i.e. delete everything after the _)

############################################################################################################
# Exercise: Cleaning up data and plotting

# Here is the average temperature for each day in New York City from 1995 - 2015
NYC <- read_tsv("data/weather/NYNEWYOR.txt")

# Using the functions we've discussed so far, claculate the average temperature for
# each month of each year and plot that agains the month. The plot should have multiple lines
# one for each year

# As a bonus challenge, color the lines according to the year.
NYC %>% 
  group_by(year, month) %>%
  summarise(avg_temp = mean(temp)) %>%
  ggplot(aes(x = month, y = avg_temp, group = year, col = year == 2015)) +
  geom_line() +
  scale_color_manual(values = c("black", "red")) +
  labs(x = "Month", y = "Average temperature (F)", color = "2016") +
  theme_classic()