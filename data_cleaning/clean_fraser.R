library(tidyverse)

# fraser <- read_csv("C:/Users/vladtarko/Dropbox/public/databases/Fraser/fraser2018.csv")

fraser <- fraser %>% janitor::clean_names() %>%
  rename("iso" = "iso_code",
         "trade" = "freedom_to_trade_intertiolly",
         "property_rights" = "legal_system_property_rights",
         "economic_freedom" = "economic_freedom_summary_index") %>%
  select(country, iso, year, everything())

# save(fraser, file="data/fraser.rda")
