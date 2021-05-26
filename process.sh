#!/bin/bash

# Output RSSI values for particular BSSIDs from recorded `data` files

bssids="$@"
count=$#

# `paste` allows us to merge lines into columns e.g.
# `paste - - -` will merge each 3 lines into 3 columns
pasteargs=$(for i in `seq $count`; do echo -n "- "; done)

for dat in data/*.dat
do
  # Output a column for each bssid
  for bssid in $bssids
  do
    cat "$dat" | ./ssid.sh "$bssid"
  done \
  | paste $pasteargs
done
