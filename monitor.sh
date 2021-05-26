#!/bin/bash

# Continuously scan and output RSSI values for particular BSSIDs

bssids="$@"
count=$#

# `paste` allows us to merge lines into columns e.g.
# `paste - - -` will merge each 3 lines into 3 columns
pasteargs=$(for i in `seq $count`; do echo -n "- "; done)

while true
do
  # Capture scan as tmp file so we can process for each bssid
  tmpfile=$(mktemp -t "wifiscan.XXXXXX")
  ./scan.sh > $tmpfile

  # Output a column for each bssid
  for bssid in $bssids
  do
    cat "$tmpfile" | ./ssid.sh "$bssid"
  done \
  | paste $pasteargs

  # Clean up
  rm "$tmpfile"

  # Max rate
  sleep 0.5
done
