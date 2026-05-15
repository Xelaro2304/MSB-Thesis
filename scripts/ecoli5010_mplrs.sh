#!/bin/bash

#Parallel enumeration of ECMs form the dual network of ecoli5010. Requires mplrs and redund as per ecmtool usage instructions

MODEL=dual_ecoli5010_no_b

python3 ../ecmtool/main.py \
  --processes 60 \
  --model_path ../models/${MODEL}.xml \
  --auto_direction false \
  --use_external_compartment e \
  --add_objective false \
  --out_path ../results/${MODEL}.csv 

