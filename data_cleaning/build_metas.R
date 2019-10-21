library(tidyverse)
library(varsExplore)

csp_meta       <- vars_explore(csp,         silent = FALSE, viewer = FALSE, minimal = TRUE) %>% mutate(source = "csp")
fraser_meta    <- vars_explore(fraser,      silent = FALSE, viewer = FALSE, minimal = TRUE) %>% mutate(source = "fraser")
manifesto_meta <- vars_explore(manifesto,   silent = FALSE, viewer = FALSE, minimal = TRUE) %>% mutate(source = "manifesto")
qog_meta       <- vars_explore(qog,         silent = FALSE, viewer = FALSE, minimal = TRUE) %>% mutate(source = "qog")
statepolicy_m  <- vars_explore(statepolicy, silent = FALSE, viewer = FALSE, minimal = TRUE) %>% mutate(source = "statepolicy")
ted_meta       <- vars_explore(ted,         silent = FALSE, viewer = FALSE, minimal = TRUE) %>% mutate(source = "ted")
vdem_meta      <- vars_explore(vdem,        silent = FALSE, viewer = FALSE, minimal = TRUE) %>% mutate(source = "vdem")

statepolicy_meta <- statepolicy_meta %>%
  rename(Variable    = variable,
         Description = variable_description)

statepolicy_m$Description <- NULL

statepolicy_m <- statepolicy_meta %>%
  select(Variable, Description) %>%
  right_join(statepolicy_m, by = "Variable")

all_world_meta <- rbind(
  fraser_meta,
  manifesto_meta,
  qog_meta,
  ted_meta,
  vdem_meta
)

all_us_meta <- rbind(
  csp_meta,
  statepolicy_m
)

save(all_world_meta, file="data/all_world_meta.rda")
save(all_us_meta, file="data/all_us_meta.rda")
