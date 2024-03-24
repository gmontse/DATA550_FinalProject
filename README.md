Final Project 4: Organization and GitHub Repository

This repository contains the code, mock data, output, and a Makefile for my project that shares the descriptive statistics of the outcome (PCOS Symptoms) and the confounders (Age, Race/Ethnicity, Education, Employment, and Marital Status), as well as share the frequency of microbiome abundance and microbiome diversity of those who do not have PCOS Acne Symptoms and those who do have PCOS Acne Symptoms. 

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

-   `FinalProject2.Rmd` contains R markdown code to compile all components together to create a html document
