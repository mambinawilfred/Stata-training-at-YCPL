********************
***"YCPL 2020 ASSESSMENT TEST"****SECTION B*********
**COPYRIGHT 2020 BY WILFRED NYAKERI
**LAST MODIFIED ON 02/03/2020**********
*******************************************************************

**Importing the external file**(5mks)
**Changing working directory******************************

cd"E:\crackthecode\Rmastercrack\datasetarchive\Statadataset"
use airquality,clear
br
summarize
codebook

**converting continous variable to Indicator variable(dummy) **(5MKS)**
generate Humidity=temp>=50

***Creating  two dummy variables Gender & Jinsia in relation to days //days=100.Then drop Jinsia and rename Discrimination(10MKS)
generate Gender=days >=100
generate Jinsia=days>=100
drop Jinsia
rename Gender Discrimination

** Simple linear Regression and plotting 10 mks (Explain on the relationship and the outcome)**(10MKS)

twoway(scatter temp wind,sort)
regress temp wind
predict Predictedtemp, xb
twoway (line Predictedtemp wind, sort)
twoway (line Predictedtemp wind, sort) (scatter temp wind, sort)

***Carry out ANOVA and ttest on so2 & temp,report on the result.(10MKS)

oneway temp so2
ttest so2==temp


*******************************************************
 save ycpl2020
exit
