*t-TEST & Correlation
*copyright 2019 by Wilfred Nyakeri
*Last modiofied on 18/10/2019

*sysuse command
sysuse auto
cd"G:\STATA PROJECT\Harclux Stata _ dataset"
insheet using Flavor2.Csv,clear
import delimited Flavor2.csv,clear
tabulate foreign,summarize(mpg)
*Simple hypothesis test
ttest mpg,by(foreign)
correlate mpg weight
by foreign,sort:correlate mpg weight
