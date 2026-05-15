#!/bin/bash

#Script used to time the running time of different approaches. Run as ./time.sh {MODEL-SPECIFIC SCRIPT}

start=$(date +%s%N)

for i in $(seq 1 100); do
    "$@"
done

elapsed=$(( ($(date +%s%N) - start) / 1000000 ))
echo "100 runs: ${elapsed}ms"
