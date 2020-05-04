*Getting started in Stata(Stata Importing commands & Data management)
*Copyright 2019 by Wilfred Nyakeri
*Last modified on 10/05/2019

/*Data Importing commands
They include:Insheet,Infile and import command.Insheet command is being 
used to import .Csv files;Infile command reads in the file in text form and import
 command is followed by delimited & sysuse auto command*/
cd"G:\STATA PROJECT\Harclux Stata _ dataset"
*insheet & import command
insheet using Flavor2.csv,clear
import delimited Flavor2.csv,clear
*Stata Dataset command
use entrance.dta,clear
use Duplicates.dta,clear
*Infile command
*sysuse auto command
sysuse auto
*Data description command in Stata
summarize
summarize mpg weight
summarize mpg weight if foreign
summarize mpg weight if foreign, detail
summarize i.rep78
inspect
inspect rep78
inspect rep78 if price>=10000
codebook
codebook make
codebook rep78
browse if missing(rep78)
list make if missing(rep78)
describe
list
list price if price<4000
list price if price>=4000
list in 1/30,sep(5)
gen Gender=1
replace Gender=2 if mpg>=20
recode Gender(2=1)(1=0),gen(Binary)
list Gender Binary

