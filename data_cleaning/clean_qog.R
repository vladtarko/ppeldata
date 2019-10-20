library(tidyverse)
library(rio)
library(varsExplore)

# qog <- read_dta("C:/Users/vladtarko/Dropbox/public/databases/Quality of Government Institute/2019/qog_std_ts_jan19.dta")

# using the same variable names as VDEM
qog <- rename(qog,
              "country"              = "cname",
              "country_year"         = "cname_year",
              "COWcode"              = "ccodecow",
              "country_text_id"      = "ccodealp",
              "country_text_id_year" = "ccodealp_year")

# list all countries with time periods in their names
qog %>% filter(str_detect(country, "\\(")) %>% pull(country) %>% unique()

qog <- qog %>% mutate(
  country = case_when(
    country == "Cyprus (1975-)"    ~ "Cyprus",
    country == "Cyprus (-1974)"    ~ "Cyprus",
    country == "Ethiopia (-1992)"  ~ "Ethiopia",
    country == "Ethiopia (1993-)"  ~ "Ethiopia",
    country == "France (1963-)"    ~ "France",
    country == "France (-1962)"    ~ "France",
    country == "Malaysia (1966-)"  ~ "Malaysia",
    country == "Malaysia (-1965)"  ~ "Malaysia",
    country == "Pakistan (1971-)"  ~ "Pakistan",
    country == "Pakistan (-1970)"  ~ "Pakistan",
    country == "Sudan (2012-)"     ~ "Sudan",
    country == "Sudan (-2011)"     ~ "Sudan",
    country == "Eswatini (former Swaziland)" ~ "Eswatini",
    TRUE ~ country
  )
)

qog <- qog %>%
  mutate(
    constitutional_event = case_when(
      country == "Cyprus"   ~ 1974,
      country == "Ethiopia" ~ 1992,
      country == "France"   ~ 1962,
      country == "Malaysia" ~ 1965,
      country == "Pakistan" ~ 1970,
      country == "Sudan"    ~ 2011,
    )
  )

qog_meta <- vars_explore(qog, silent = FALSE, viewer = FALSE)

# the variables that have value labels
labelled_vals <- qog_meta %>% filter(!is.na(`Value labels`)) %>% select(Variable) %>% pull()

# change these variables from numeric to factors and use the value labels as factor labels
qog <- qog %>% mutate_at(vars(labelled_vals), as_factor)
qog <- qog %>% mutate_at(vars(labelled_vals), characterize)

# testing that it worked
qog %>%
  ggplot(aes(x = fi_ftradeint, y = gle_cgdpc, color = iaep_pvelc)) +
     geom_point()

# save(qog, file="data/qog.rda")
