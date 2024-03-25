#define project directory
here::i_am("code/01_make_table1.R")

#call in clean data from other file
data <- readRDS(
  file=here::here("output/data_clean.rds")
)

#libraries
library(dplyr)
library(gtsummary)

#make table 1
table_1 <- data %>%  
  select(c(age_group:h1n1_vaccine)) %>%
  mutate(h1n1_vaccine=factor(h1n1_vaccine,labels=c("Not Vaccinated","Vaccinated"))) %>%  
  tbl_summary(by="h1n1_vaccine", 
              label=list( 
                age_group ~ "Age Group", 
                education ~ "Education Level", 
                race ~ "Race", 
                sex ~ "Sex", 
                income_poverty ~ "Income Status", 
                marital_status ~ "Marital Status",
                rent_or_own ~ "Home Ownership Status",
                employment_status ~ "Employment Status",
                census_msa ~ "Urbanicity"
              )) %>% add_overall() %>%
  modify_caption("**Table 1. 2009 H1N1 Flu Survey Participant Characteristics**") %>% bold_labels()

#save table 1 object
saveRDS(
  table_1, file=here::here("output/table_one.rds")
)