#!/usr/bin/env bash

mem_csv=$1

while true
do
    current_time=$( date '+%F_%H:%M:%S' )
    timestamp=`echo -n "$current_time;"`
    free=`free -m | awk 'NR==2{printf "%sMB;%sMB;%.2f%% \n", $2,$2-$3,$3*100/$2 }'`
    echo "${timestamp}${free}" >> $mem_csv
    sleep 5
done
