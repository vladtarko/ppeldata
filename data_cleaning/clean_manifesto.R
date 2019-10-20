library(tidyverse)

# manifesto <- read_dta("C:/Users/vladtarko/Dropbox/public/databases/Manifesto Project/MPDataset_MPDS2019a_stata14.dta")

manifesto <- manifesto %>%
  mutate(year = lubridate::year(edate)) %>%
  rename("ccode" = "country",
         "country" = "countryname") %>%
  select(country, ccode, year, everything())
