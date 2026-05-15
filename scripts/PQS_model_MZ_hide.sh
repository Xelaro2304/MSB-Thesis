#!/bin/bash

#Enumeration of ECMs form the dual network of the PQS model with the MZ structure and hidden MZ

MODEL=dual_MZ_PQS_model

python3 ../ecmtool/main.py \
  --model_path ../models/${MODEL}.xml \
  --auto_direction false \
  --use_external_compartment e \
  --add_objective false \
  --out_path ../results/${MODEL}_hide.csv \
  --inputs 11,12,13,14,15,16,17,,18,19,20,21 \
  --outputs 21,22,23 \
  --hide 23
