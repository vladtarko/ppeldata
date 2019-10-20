library(tidyverse)

# adjustment of the data downloaded from TED

# turn years columns into long format
ted_long <- ted %>% pivot_longer(-c(REGION, ISO, COUNTRY, INDICATOR, MEASURE), names_to = "year")

# turn to wide format, each indicator a different variable
ted_wide <- ted_long %>% select(-MEASURE) %>%
  pivot_wider(names_from = INDICATOR, values_from = value) %>%
  janitor::clean_names()

# variable descriptions
labels <- ted %>% select(MEASURE) %>% unique() %>% pull()

labels <- c(c("Region", "ISO", "Country Name", "Year"), labels)

ted_wide <- sjlabelled::set_label(ted_wide, labels)

ted_wide["na"] <- NULL
