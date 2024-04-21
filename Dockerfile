FROM rocker/r-ubuntu as base

WORKDIR /final_project

RUN mkdir -p renv 
COPY renv.lock renv.lock 
COPY .Rprofile .Rprofile 
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json 

RUN mkdir renv/.cache 
ENV RENV_PATHS_CACHE renv/.cache 

RUN R -e "renv::restore()"

### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ###

FROM rocker/r-ubuntu
RUN apt-get update 
RUN apt-get install -y pandoc

WORKDIR /final_project
COPY --from=base /final_project . 

ENV WHICH_CONFIG default 

RUN mkdir code
RUN mkdir output 
RUN mkdir data
RUN mkdir report

#COPY FILES OVER
COPY Makefile . 
COPY FinalProject2.Rmd . 
COPY code code
COPY data/PCOS_clean_data.csv data

CMD make && mv FinalProject2.html report
