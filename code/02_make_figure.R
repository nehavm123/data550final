library(here)
library(tidyverse)
library(ggplot2)

here::i_am("code/02_make_figure.R")


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

total_tests <- data_wide %>%
  summarise(
    Gonorrhea = sum(gon_test_count),
    Chlamydia = sum(chlam_test_count),
    HIV = sum(hiv_test_count)
  ) 

total_tests_transpose <- total_tests %>%
  pivot_longer(
    cols = everything(),
    names_to = "Test Type",
    values_to = "Total"
  )

figure <- ggplot(total_tests_transpose, aes(x = `Test Type`, y = Total, fill = `Test Type`)) +
  geom_bar(stat = "identity") + 
  labs(title = "Total Number of STI Tests",
       x = "Test Type",
       y = "Total Count") +
  theme_minimal() +
  theme(legend.position = "none")

ggsave(
  here::here("output/figure.png"),
  plot = figure,
  device = "png"
)


