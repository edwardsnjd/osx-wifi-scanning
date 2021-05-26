#!/bin/bash

# Continuously scan and record the result into files in a local `data`
# directory.

mkdir -p data

while true
do
  ./scan.sh > data/$(date -u +"%Y-%m-%dT%H:%M:%SZ").dat
  sleep 1
done
