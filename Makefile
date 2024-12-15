# REPORT-ASSOCIATED RULES (run within docker container)
report.html: code/03_render_report.R \
  report.Rmd table figure
	Rscript code/03_render_report.R

table: code/01_make_table.R data/final_project_data.rds
	Rscript code/01_make_table.R
	
figure: code/02_make_figure.R data/final_project_data.rds
	Rscript code/02_make_figure.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html && rm -f report/*.html

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
# DOCKER-ASSOCIATED RULES (run on our local machine)
PROJECTFILES = report.Rmd code/01_make_table.R code/02_make_figure.R code/03_render_report.R data/final_project_data.rds Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

# Rule to build image
project-image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t project_image1 .
	touch $@
	
# Rules to run container
report-windows:
	docker run -v /"$$(pwd)/report":/home/rstudio/project/report nehavm123/project_image1

report-mac:
	docker run -v "$$(pwd)/report":/home/rstudio/project/report nehavm123/project_image1





