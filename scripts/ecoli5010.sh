#!/bin/bash

#Enumeration of ECMs form the dual network of ecoli5010

MODEL=dual_ecoli5010_no_b

python3 ../ecmtool/main.py \
  --model_path ../models/${MODEL}.xml \
  --auto_direction false \
  --use_external_compartment e \
  --add_objective false \
  --out_path ../results/${MODEL}.csv 

