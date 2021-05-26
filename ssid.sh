#!/bin/bash

# Report the RSSI values for a BSSID from a scan result

bssid=$1

missing=-100

./tidy.sh \
  | (grep "$bssid" || echo "???	$bssid	$missing") \
  | cut -f3
