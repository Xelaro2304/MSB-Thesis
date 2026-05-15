#!/bin/bash

#Enumeration of ECMs in a dual network (primal MCS)

MODEL=$1

python3 ../ecmtool/main.py \
  --model_path ../models/${MODEL}.xml \
  --auto_direction false \
  --use_external_compartment e \
  --add_objective false \
  --out_path ../results/${MODEL}.csv 

