log using Output/StataLog, replace text

***** 0_Master.do *****
clear

do 1_Setup.do

do 2_DataExtraction.do
do 2_DataPrep.do

do 3_GraphIncidence.do
do 3_MetaRegression.do

log close