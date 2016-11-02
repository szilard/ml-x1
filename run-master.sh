#!/bin/bash

time ./run.sh r3 h2o | tee res-r3-h2o.csv
time ./run.sh x1 h2o | tee res-x1-h2o.csv
time ./run.sh r3 xgboost | tee res-r3-xgboost.csv
time ./run.sh x1 xgboost | tee res-x1-xgboost.csv

