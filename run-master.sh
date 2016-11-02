#!/bin/bash

time ./run.sh r3 h2o | tee res-r3-h2o.csv
time ./run.sh x1 h2o | tee res-x1-h2o.csv

