**Welcome to stata full training pdf
*******************************************************************************
**Copyright 2019 by wifred nyakeri
**last modified on 23/02/2020
*** TUTOR AT YOUNG COMPUTING PROGRAMMING LEARNERS(YCPL) IN THE UNIVERSITY OF KABIANGA***
*******************************************************************************
**introduction to stata**
**Stata is a powerful statistical software that enables users to manage,analyze and produce graphical vizualization of data.
**the name stata is a syllabic abbreviation of the two terms STATistics and daTA.
//DO-FILE;this is the text document that allows users to submit more than one command at a time.

***stata interface navigation***
  *Review window;keeps a record of all commands stata has run both successful and unsuccessful.
  **Results window;it displays the results of what you have commanded stata to do.
  ***Command window;this is a pane(computing GUI) in which you enter the commands for stata to perform tasks.
  ****Variables window;it gives you a need to summary of all the variables in your current dataset and their properties.
  *****Properties window;displays various variables and dataset properties
  
  *********************cleaning up your data*************
  
//change directory
***this displays the file path of your dataset

cd"E:\crackthecode\Rmastercrack\datasetarchive\Statadataset"

//Importing external data files
***using import delimited,infile,insheet and use command
** syssuse command loads the specified stata-format dataset that was shipped with stata.
**Whereas import delimited and insheet command they are being used to import csv,xls files in Excel.
**import delimited command is also used to import .txt files

drop Mortality

//Examples 
sysuse auto.dta
**importing dataset in .txt form

import delimited entrance.txt,clear

**insheet& import delimited command

insheet using crack.csv,clear
insheet using population.csv,clear
import delimited population.csv,clear

**stata-format dataset always  stored .dta
use who,clear
use cycle,clear
use titanic, clear

//stata commands for data management
**they include:codebook,summarize,list,inspect,recode,generate
**(i)**codebook;it examines the variable names,labels and data to produce acodebook describing the dataset
**(ii)**summarize;calculates and displays a variety of univariate summary statistics
**(iii)**list;it displays the values of variables
**(iv)**inspect;displays simple summary of data attribute
**(v)**recode;chnges the values of numeric variables according to rules specified
********values  that do not meet any of the conditions of the rules are left unchanged unless and otherwise.
**(vi)**generate;create or change contents of variables.It creates a new variable.

//sysuse command

****Data description command in Stata*****

describe

summarize 
summarize lexp_female lexp_male

inspect
inspect mort_both
inspect mort_both if gdp>=1000

codebook
codebook mort_both

browse if missing(mort_both)
** browse if missing, it displays only the missing dataset
list
list mort_both if missing(mort_both)


list mort_both if mort_both>=100
recode Gender(2=1)(1=0),gen(Binary)
list Gender Binary

*******Converting categorical to Indicator(Dummy) variables

****method 1
***if mort_both is >= 150 it assigns 1 and 0 otherwise
generate Mortality=mort_both>=150
recode Gender(2=1)(1=0),gen(Binary)

****Alternative method
generate Mortality = 1 if mort_both>=150
replace Mortality = 0 if mort_both<150

********************************************************************************
*Converting continous variable to categorical variable
****handling missing values****
generate byte Mortality_values=100 if mort_both=.
replace mort_both=0 if mort_both==.
summarize mort_both
codebook mort_both
tabulate mort_both

******Simple linear regression & scatter plot*************


twoway(scatter lexp_male lexp_female,sort)
regress lexp_male lexp_female
predict Predictedlexp_male, xb
twoway (line Predictedlexp_male lexp_female, sort)
twoway (line Predictedlexp_male lexp_female, sort) (scatter  lexp_male lexp_female, sort)
**mean & sum of adult mortality
mean mort_both
sum mort_both

**alternative method(scatter plot)
scatter mort_both lexp_female
predict predictmort lexp_female,xb
twoway(line predictmort lexp_female,sort)


**histogram on Adult mortality
hist mort_both
***creating of frequency table on Adult mortality
tab mort_both
tab lexp_male lexp_female

**simple regression with beta
reg lexp_female lexp_male,beta

**correlation matrix
 pwcorr mort_both lexp_female 
 exit
 
 ******************************************************end*************************

