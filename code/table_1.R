here::i_am("code/table_1.R")

data <- read.csv(
  file = here::here("data/PCOS_clean_data.csv")
)

library(dplyr)
library(gtsummary)

table1 <- data %>%
  select(
    PCOS_Symptom_Acne,
    PCOS_Symptom_Hirsutism,
    PCOS_Symptom_Alopecia, 
    Age,
    Race_Ethnicity,
    Education, 
    Employment,
    Marital_Status
  ) %>% 
  tbl_summary(label = list(
    PCOS_Symptom_Acne ~ "Acne, %",
    PCOS_Symptom_Hirsutism ~ "Hirsutism, %", 
    PCOS_Symptom_Alopecia ~ "Alopecia, %", 
    Age = "Age, mean",
    Race_Ethnicity ~ "Race/Ethnicity, %", 
    Education ~ "Education, %", 
    Employment ~ "Employment, %",
    Marital_Status ~ "Marital Status, %"
  ),
  statistic = list(
    all_categorical() ~ "{n}({p}%)", 
    Age ~ "{mean}"
  ),
  digits = list(
    all_categorical() ~ c(0, 2),
    Age ~ c(2, 2)
  ),
  )

print(table1)

saveRDS(
  table1,
  file = here::here("output/table1.rds")
)
