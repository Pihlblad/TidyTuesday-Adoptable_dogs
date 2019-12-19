# TidyTuesday dataset 2019-12-17 "Adoptable Dogs"

# Get the Data

dog_moves <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_moves.csv')
dog_travel <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_travel.csv')
dog_descriptions <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-12-17/dog_descriptions.csv')

library(tidyverse)

# Survay

summary(dog_moves)
summary(dog_travel)
summary(dog_descriptions)

# Clean 

df <- dog_descriptions %>% 
  mutate_if(is.character, as.factor) 

df %>% 
  select(breed_primary, age, sex) %>% 
  group_by(breed_primary, age, sex) %>%
  summarise(count=n())%>% 
  arrange(desc(count))
  
