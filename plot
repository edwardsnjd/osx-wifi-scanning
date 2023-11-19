#!/usr/bin/env bash

# NAME
#   plot - plot the output from monitor
#
# SYNOPSIS
#   monitor | GNUTERM="dumb ansi" plot
#   monitor | plot --term "dumb ansi"
#   monitor | grep --line-buffered FooNetwork | plot
#
# DEPENDENCIES
#   - bash = scripting
#   - feedgnuplot (and gnuplot) = plotting

Main() {
  FormatData | Plot "$@"
}

FormatData() {
  local nbsp=" "
  while IFS=$'\t' read iso ts ssid bssid channel rssi
  do
    echo "${ts} ${ssid}${nbsp}(${bssid},${channel}) ${rssi}"
  done
}

Plot() {
  feedgnuplot \
    --stream \
    --xlen 128 \
    --domain \
    --timefmt "%s" \
    --dataid \
    --autolegend \
    --lines \
    --points \
    --title "Wifi strength (above -65 is ok)" \
    --ylabel "Signal strength (dB)" \
    --ymin -100 \
    --ymax 0 \
    --set "nogrid" \
    --set "tics out" \
    --set "xtics nomirror" \
    --set "key below" \
    "$@"
}

Main "$@"
