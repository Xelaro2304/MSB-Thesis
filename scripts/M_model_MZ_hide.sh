#!/bin/bash

#Enumeration of ECMs form the dual network of the M model with the MZ structure and hidden MZ

MODEL=dual_MZ_M_model

python3 ../ecmtool/main.py \
  --model_path ../models/${MODEL}.xml \
  --auto_direction false \
  --use_external_compartment e \
  --add_objective false \
  --out_path ../results/${MODEL}_hide.csv \
  --inputs 5,6,7,8,9 \
  --outputs 5,10,11 \
  --hide 11
