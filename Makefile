# create rule to render report
sjc_final_2.html: code/03_render_report.R sjc_final_2.Rmd \
  output/table_1.rds output/figure.jpeg
	Rscript code/03_render_report.R

# clean data
output/data_clean.rds: code/00_clean_data.R data/my_dataset.csv
	Rscript code/00_clean_data.R

# table 1
output/table_1.rds: code/01_make_table1.R output/data_clean.rds
	Rscript code/01_make_table1.R

# chi square and correlation plot
output/figure.jpeg: code/02_make_figure.R output/data_clean.rds
	Rscript code/02_make_figure.R
	
# clean data
clean:
	rm -f output/*.rds && rm -f output/*.jpeg && rm -f *.html