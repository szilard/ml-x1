#!/bin/bash

# Example: ./run.sh r3 h2o

INSTANCE=$1
TOOL=$2

LOG=res-$INSTANCE-$TOOL.log
rm -f $LOG

for CORES in $(cat cores-$INSTANCE.conf); do
  for i in {1..10}; do
    echo CORES:$CORES >> $LOG
    RUNTIME=$(taskset -c $CORES Rscript $TOOL.R 2>&1 | tee -a $LOG | tail -1)
    echo $INSTANCE:$TOOL:$CORES:$RUNTIME
  done
done
