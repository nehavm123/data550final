library(rmarkdown)
library(here)

here::i_am("code/03_render_report.R")

render("report.Rmd", output_file = "report.html")