# Session 3 - purrr & forcats (40 minutes)
# 
# Presentation: Introduction to reiteration
# Discussion: Use case scenarios for map vs walk
# Exercise: Coding challenge exercise
# Discussion: Results and alternative approaches
# Q & A
##################################################################################################################

library(tidyverse)

##################################################################################################################
# Exercise: Coding challenge exercise

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
my_files %>%
  map_df(~ read_tsv(.), .id = "id") %>% 
  mutate(id = factor(id, labels = basename(my_files)),
         id = fct_recode(id, 
                         Paris = "FRPARIS.txt",
                         Reykjavik = "ILREYKJV.txt",
                         `New York` = "NYNEWYOR.txt",
                         London = "UKLONDON.txt")) -> weather

# Build all plots together:
weather %>% 
  group_by(id, year, month) %>%
  summarise(avg_temp = mean(temp)) %>%
  ggplot(aes(x = month, y = avg_temp, group = year, col = year == 2015)) +
  geom_line() +
  scale_color_manual(values = c("black", "red")) +
  facet_wrap(~ id, ncol = 2) +
  labs(x = "Month", y = "Average temperature (F)", color = "2016") +
  theme_classic()

##################################################################################################################
# So we saw map already, in which we call a function for it's return value.
# how does walk differ from that?

# Let's clean up our data first:
weather %>% 
  group_by(id, year, month) %>%
  summarise(avg_temp = mean(temp)) -> weather_summary

# Then make a function that we would call for it's side effects
# An example is saving a file
plotTemp <- function(x) {
  ggplot(x, aes(x = month, y = avg_temp, group = year, col = year == 2015)) +
    geom_line()
  
  ggsave(paste0(x$id[1],".png"), height = 6, width = 10, unit = "in")
}

# Instead of creating a facetted plot, create an individual plot for each location (id)
# Here, I'm using the base package split() function to make a list of data frames:
weather_summary %>% 
  split(weather_summary$id) %>% 
  walk(~ plotTemp(.))

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