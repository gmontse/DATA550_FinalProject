FinalProject2.html: code/render_report.R FinalProject2.Rmd outputs
	Rscript code/render_report.R

# create table 
output/table1.rds: code/table_1.R data/PCOS_clean_data.csv
	Rscript code/table_1.R

# create the output of all four histograms
output/no_acne_hist.png: code/acne_hist.R data/PCOS_clean_data.csv
	Rscript code/acne_hist.R
	
.PHONY: outputs
outputs: output/table1.rds output/no_acne_hist.png

#! TO DO:
#! add a PHONY target for removing .rds files
#! from the output directory
.PHONY: clean
clean:
#write a command that will clean the contents
	rm output/*.rds && rm output/*.png