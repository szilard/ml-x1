#!/bin/bash

time ./run.sh r3 h2o     | tee res-r3-h2o.csv
time ./run.sh r3 xgboost | tee res-r3-xgboost.csv
time ./run.sh x1 h2o     | tee res-x1-h2o.csv
time ./run.sh x1 xgboost | tee res-x1-xgboost.csv
cat res-*.csv > res.csv

#time ./run.sh r3 h2o     | tee    res-r3.csv
#time ./run.sh r3 xgboost | tee -a res-r3.csv
#time ./run.sh x1 h2o     | tee    res-x1.csv
#time ./run.sh x1 xgboost | tee -a res-x1.csv
#cat res-*.csv > res.csv




