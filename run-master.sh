#!/bin/bash

# on r3:
time ./run.sh r3 h2o | tee res-r3-h2o.csv
time ./run.sh r3 xgb | tee res-r3-xgb.csv
# on x1:
time ./run.sh x1 h2o | tee res-x1-h2o.csv
time ./run.sh x1 xgb | tee res-x1-xgb.csv
# then:
cat res-*.csv > res.csv


