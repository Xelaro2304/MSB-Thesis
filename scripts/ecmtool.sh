#!/bin/bash

#Enumeration of ECMS in primal networks

MODEL=$1

python3 ../ecmtool/main.py \
  --model_path ../models/${MODEL}.xml \
  --add_objective false \
  --out_path ../results/${MODEL}.csv 
