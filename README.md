Final Project 4: Organization and GitHub Repository

This repository contains the code, mock data, output, and a Makefile, a Dockerfile, a renv folder, and a renv.lock for my project that shares the descriptive statistics of the outcome (PCOS Symptoms) and the confounders (Age, Race/Ethnicity, Education, Employment, and Marital Status), as well as share the frequency of microbiome abundance and microbiome diversity of those who do not have PCOS Acne Symptoms and those who do have PCOS Acne Symptoms. 

-   Code Folder

    -   `acne_hist.R` contains code written to create all four histograms for acne symptoms and microbiome abundance, and for acne symptoms and microbiome diversity.

    -   `clean_data.R` contains code that reads in the clean data from the PCOS mock dataset from the data folder.

    -   `table_1.R` contains code to to show the characteristics of the outcome variables and the covariates. 

-   Output Folder

    -   4 Histograms
        - `acne_diversity_hist.png`: demonstrates the frequency of indviduals with acne symptoms and their microbiome diversity
        - `no_acne_diversity_hist.png`: demonstrates the frequency of indviduals without acne symptoms and their microbiome diversity
        - `acne_hist.png`: demonstrates the frequency of indviduals with acne symptoms and their microbiome abundance
        - `no_acne_hist.png`: demonstrates the frequency of indviduals without acne symptoms and their microbiome abundance

    -   Descriptive Table
        - `table1.rds`: rds file that contains the table that shows the characteristics of the data sample. 


-   `Makefile` contains instructions to create every component for the report. 
    - Inside the Makefile, there is a rule for restoring the package environment. To synchronize the package repository, you can use `make install`.
    - Additionally, there is a rule for running a container with an empty project directory called report mounted to the report folder in the container. 
    
-   `Dockerfile` contains the code to build an image that can be used to create the report.
    
-   The `renv.lock` file and `renv` folder in the project directory captures information on the packages used to create the report. 

-   `FinalProject2.Rmd` contains R markdown code to compile all components together to create a html document.

Building the Docker image locally: 

-   To build the image locally, use the `make docker_image` command from the Makefile in the terminal. 
-   To run the report with the local docker image, using the `make report/FinalProject2.html` command from the makefile. This should work for both Windows or Mac user, but if it does not try the following: 
    - Windows Users:`docker run -v "/$$(pwd)/report":final_project/report gmonste/final_project`
    - Mac Users: `docker run -v "$$(pwd)/report:/final_project/report" gmontse/final_project`

Docker Hub:

-   The link to the docker image is here:https://hub.docker.com/repository/docker/gmontse/final_project/general
-   You can also pull this image directly with `docker run gmontse/final_project`
