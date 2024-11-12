library(table1)
library(tidyverse)
library(here)

here::i_am("code/01_make_table.R")


proj_data <- readRDS(
  file = here::here("data/final_project_data.rds")
)


data_wide <- proj_data %>% 
  group_by(PID) %>%
  arrange(Date) %>%
  summarise(
    gon_test_count = sum(gon_test),
    chlam_test_count = sum(chlam_test),
    hiv_test_count = sum(hiv_test)
  )

label(data_wide$gon_test_count) <- "Number of Gonorrhea Tests"
label(data_wide$chlam_test_count) <- "Number of Chlamydia Tests"
label(data_wide$hiv_test_count) <- "Number of HIV Tests"

proj_table <- table1(~ gon_test_count + chlam_test_count + hiv_test_count,
                     data = data_wide, rowlabelhead = "STI Testing Variables",
                     render.continuous=c(.="Mean (SD)"))

saveRDS(
  proj_table,
  file = here::here("output/proj_table.rds")
)


















