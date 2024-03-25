# FINAL REPORT GENERATION

- download project files on a local computer and save to desired location
- set the finalproject folder as the project directory in the bash terminal (cd command)
- type "make" into the terminal to generate the sjc_final_2.html product

# CODE DESCRIPTIONS

## clean data
`code/00_clean_data.R`
- reads in dataset csv in the `data/` folder
- mutates dataset to factorize education and income into levels that show up in order in Table 1
- saves cleaned data as a `.rds` object in `output/` folder

## make required table
`code/01_make_table1.R` 
- reads cleaned dataset saved by `code/00_clean_data.R`
- creates a Table 1 of demographic characteristics of our study population
- saves the Table 1 as a `.rds` object in `output/` folder

## make required figure
`code/02_make_figure.R`
- reads cleaned dataset saved by `code/00_clean_data.R`
- manipulates the cleaned dataset into a form readable by the Chi-square R function
- runs Chi-square analysis on relationship between disease mitigation behaviors and H1N1 vaccination status
- creates visual representation (correlation plot) of the relationships between residuals from Chi-square test
- saves the correlation plot as a `.jpeg` object in `output/` folder

## render report
`code/03_render_report.R`
- renders `sjc_final_2.Rmd` R Markdown file

## R Markdown file
`sjc_final_2.Rmd`
- loads and displays Table 1 and correlation plot saved by `code/01_make_table1.R` and `code/02_make_figure.R`
- contains descriptions of data set, analysis plan, and description of Table 1 and correlation plot results