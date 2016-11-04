#!/bin/bash

# on r3:
time ./run.sh r3 h2o     | tee res-r3-h2o.csv
time ./run.sh r3 xgboost | tee res-r3-xgboost.csv
# on x1:
time ./run.sh x1 h2o     | tee res-x1-h2o.csv
time ./run.sh x1 xgboost | tee res-x1-xgboost.csv
# then:
cat res-*.csv > res.csv


