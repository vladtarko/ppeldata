library(tidyverse)

# vdem <- read_dta("C:/Users/vladtarko/Dropbox/public/databases/v-dem/V-Dem-CY-Full+Others-v9.dta")

vdem <- vdem %>%
  rename(country = country_name,
         iso     = country_text_id)

vdem <- vdem %>% select(country, iso, year, COWcode, histname, everything())

vdem_meta <- vars_explore(vdem, silent = FALSE)

# save(vdem, file="data/vdem.rda")
