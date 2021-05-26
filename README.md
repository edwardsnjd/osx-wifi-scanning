OSX WIFI Scanning
=================

A collection of scripts to automate wifi scanning and signal strength capturing.

Installation
------------

This is just a bunch of little `bash` scripts, so aside from that (and common
GNU tools) the main dependencies are:

- `airport` (the OSX scanning utility)
- `feedgnuplot` and `gnuplot` (only required if you want to plot)

Usage
-----

Run a scan (just an alias for the underlying `airport -s` scan):

```sh
$ ./scan.sh
                            SSID BSSID             RSSI CHANNEL HT CC SECURITY (auth/unicast/group)
               OPTUS_B267E2_5GHz 80:20:da:b2:67:e4 -90  132     Y  AU WPA2(PSK/AES/AES) 
                  PADOCK MADNESS bc:30:d9:eb:9f:04 -77  9       Y  -- WPA2(PSK/AES/AES) 
                       NETGEAR58 b0:39:56:f9:aa:dc -74  9,+1    Y  AU WPA2(PSK/AES/AES) 
       DIRECT-0b-HP M15 LaserJet 86:2a:fd:79:9a:0b -83  6       Y  -- WPA2(PSK/AES/AES) 
                    OPTUS_B267E2 80:20:da:b2:67:e5 -85  6       Y  AU WPA2(PSK/AES/AES) 
```

Repeatedly scan specific BSSIDs, priting only the RSSI values:

```sh
$ ./monitor.sh b0:39:56:f9:aa:dc 86:2a:fd:79:9a:0b
-74	-100
-74	-88
-77	-88
-76	-88
# Ctrl+C
```

Repeatedly scan, capturing each result to a timestamped file under `data/`:

```sh
$ ./log.sh
# Ctrl+C
$ ls -l data/
total 3
-rw-r--r--@ 1 user1  staff  1256 26 May 22:10 2021-05-26T14:10:30Z.dat
-rw-r--r--@ 1 user1  staff  1463 26 May 22:10 2021-05-26T14:10:36Z.dat
-rw-r--r--@ 1 user1  staff  1063 26 May 22:10 2021-05-26T14:10:42Z.dat
```

Repeatedly scan, plotting in the terminal:

```sh
$ ./monitor.sh b0:39:56:f9:aa:dc 86:2a:fd:79:9a:0b \
| ./plot.sh \
   --legend 0 "Wifi A" \
   --legend 1 "Wifi B" \
   --terminal "dumb ansi $COLUMNS,$(($LINES-3))" \
   --unset grid \
   --stream \
   --exit
```
![Terminal plot](./GnuPlot.png)
