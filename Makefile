FinalProject2.html: code/render_report.R FinalProject2.Rmd outputs
	Rscript code/render_report.R

# create table 
output/table1.rds: code/table_1.R data/PCOS_clean_data.csv
	Rscript code/table_1.R

# create the output of all four histograms
output/no_acne_hist.png: code/acne_hist.R data/PCOS_clean_data.csv
	Rscript code/acne_hist.R

#make a command that will create both outputs at the same time	
.PHONY: outputs
outputs: output/table1.rds output/no_acne_hist.png

#! TO DO:
#! add a PHONY target for removing .rds files
#! from the output directory
.PHONY: clean
clean:
#write a command that will clean the contents
	rm -f output/*.rds && rm -f output/*.png && rm -f FinalProject2.html && rm -f report/FinalProject2.html

.PHONY: install
install:
	Rscript -e 'install.packages("renv"); renv::restore()'

#DOCKER RULES

PROJECTFILES = FinalProject2.Rmd code/render_report.R code/acne_hist.R code/clean_data.R code/table_1.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

docker_image: $(PROJECTFILES) $(RENVFILES) Dockerfile
	docker build -t gmontse/final_project . 
	
#rule to run container
report/Final_Project2.html:
	docker run -v "$$(pwd)/report:/final_project/report" gmontse/final_project || "/$$(pwd)/report":final_project/report gmonste/final_project
	