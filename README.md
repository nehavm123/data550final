# Final Project

## Introduction
The dataset used in this analysis includes data on patient visits at an STI clinic in Boston from January 1st, 2020 to December 31st, 2023. The data includes the patient's ID, the date of the clinic visit, an indicator variable for if the patient received a gonorrhea test, an indicator variable for if the patient received a chlamydia test, and an indicator variable for if the patient received an HIV test at the visit. The purpose of this analysis is to identify the average number of STI tests an individual has taken stratified by test type. We also aim to visualize the total number of STI tests stratified by test type through a bar chart. This descriptive analysis will provide an understanding of the extent of the utilization of STI screening services within the clinic from 2020 to 2023.

------------------------------------------------------------------------

## Instructions for Synchronizing Package Repository and Generating Final Report
1. Fork and clone repository from GitHub to local machine
2. Make sure current working directory of the terminal and console is set to the folder that contains the cloned repository
3. Make sure `renv` package is installed and the project is activated
4. Run the command `make install` in the terminal to synchronize the package repository
3. Run the command `make report.html` in the terminal to generate the final report

------------------------------------------------------------------------

## Code Structure

`code/01_make_table.R`
  
  - Reads in `final_project_data.rds` and creates wide dataset for the sum of tests at the individual level
  - Adds labels to variables representing the number of STI tests specific to each disease 
  - Creates a table using the table1 package with the mean and standard deviation of the number of STI tests specific to each disease
  
  `code/02_make_figure.R`
  
  - Reads in `final_project_data.rds` and creates wide dataset for the sum of tests at the individual level
  - Creates a dataset with the total number of disease-specific tests in the dataset
  - Creates a figure using the ggplot2 package with the total number of disease-specific tests in the dataset
  
  `code/03_render_report.R`
  
  - Renders the final report (`report.Rmd`) and outputs report.html
  
------------------------------------------------------------------------

The Makefile, Rmarkdown (`report.Rmd`), and HTML report will be in the root directory of the project. The Rmarkdown will contain the table and figure produced in the analysis.
