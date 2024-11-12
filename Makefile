report.html: code/03_render_report.R \
  report.Rmd table figure
	Rscript code/03_render_report.R

table: code/01_make_table.R data/final_project_data.rds
	Rscript code/01_make_table.R
	
figure: code/02_make_figure.R data/final_project_data.rds
	Rscript code/02_make_figure.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html