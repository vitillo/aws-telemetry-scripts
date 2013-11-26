#!/bin/bash

cd telemetry-server
python -m mapreduce.job ../job.py \
   --input-filter ../filter.json \
   --num-mappers 16 \
   --num-reducers 4 \
   --data-dir /mnt/telemetry/work \
   --work-dir /mnt/telemetry/work \
   --output /mnt/telemetry/my_mapreduce_results.out \
   --bucket "telemetry-published-v1"
