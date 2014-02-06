#!/bin/bash

cd telemetry-server
python -m mapreduce.job ../mainthreadio.py \
   --input-filter ../filter.json \
   --num-mappers 16 \
   --num-reducers 4 \
   --data-dir /mnt/telemetry/work/cache \
   --work-dir /mnt/telemetry/work \
   --output /mnt/telemetry/my_mapreduce_results.out \
   --bucket "telemetry-published-v1" \
   --local-only
