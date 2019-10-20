library(tidyverse)
# statepolicy <- rio::import("C:/Users/vladtarko/Dropbox/public/databases/State Policy Database/fulldata.rds")
# statepolicy_meta <- rio::import("C:/Users/vladtarko/Dropbox/public/databases/State Policy Database/fullmeta.rds")

statepolicy_meta <- janitor::clean_names(statepolicy_meta)

statepolicy_meta <- rename(statepolicy_meta,
                           "variable_description" = "variable_name",
                           "variable" = "variable_code")

statepolicy_meta <- select(statepolicy_meta, variable, variable_description, everything())

statepolicy <- statepolicy %>%
  rename("year" = "Year",
         "state" = "State")


# not all variables in the meta are in the dataset, and viceversa

variables <- names(statepolicy)

# remove variables from meta that are not in the dataset
# statepolicy_meta <- statepolicy_meta %>% filter(variable %in% variables)

# save(statepolicy, file="data/statepolicy.rda")
# save(statepolicy_meta, file="data/statepolicy_meta.rda")
