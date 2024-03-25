here::i_am("code/00_clean_data.R")
absolute_path_to_data <- here::here("data/my_dataset.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

#packages
library(dplyr)

#factors to put table 1 in order
data <- data %>% 
  mutate(education=factor(education, levels=c("< 12 Years", "12 Years", "Some College", "College Graduate"))) %>%
  mutate(income_poverty=factor(income_poverty, levels=c("Below Poverty", "<= $75,000, Above Poverty", "> $75,000")))

#save data
saveRDS(
  data, file=here::here("output/data_clean.rds")
)