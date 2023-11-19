#!/usr/bin/env bash

# NAME
#   plot - plot the output from monitor
#
# SYNOPSIS
#   monitor | GNUTERM="dumb ansi" plot
#   monitor | plot --term "dumb ansi"
#   monitor | grep FooNetwork | plot
#
# DEPENDENCIES
#   - bash = scripting
#   - feedgnuplot (and gnuplot) = plotting

Main() {
  FormatData | Plot "$@"
}

FormatData() {
  while IFS=$'\t' read ts ssid bssid channel rssi
  do
    echo "$ts $bssid-$ssid-$channel $rssi"
  done
}

Plot() {
  feedgnuplot \
    --stream \
    --xlen 120 \
    --domain \
    --timefmt "%s" \
    --dataid \
    --autolegend \
    --ymin -100 \
    --ymax 0 \
    --title "Wifi strength (above -60 is ok)" \
    --ylabel "Signal strength (dB)" \
    --set "nogrid" \
    --set "tics out" \
    --set "xtics nomirror" \
    --set "key outside" \
    "$@"
}

Main "$@"
