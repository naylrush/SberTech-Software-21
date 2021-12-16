#!/usr/bin/env bash

cur_dir=`dirname $0`
mem_script="$cur_dir/mem.sh"
mem_script_csv="$cur_dir/mem.csv"

mem_pid_file="$cur_dir/mem_pid.txt"
mem_pid=`cat $mem_pid_file 2> /dev/null`

key=$1
key=${key^^}

if [[ $key == "START" ]]; then
    if [ -z $mem_pid ]; then
        rm -rf $mem_script_csv
        ($mem_script $mem_script_csv)&
        mem_pid=$!
        echo $mem_pid > $mem_pid_file
        echo "STARTED — $mem_pid"
    else
        echo "ALREADY STARTED — $mem_pid"
    fi
elif [[ $key == "STATUS" ]]; then
    if [ ! -z $mem_pid ]; then
        echo "RUNNING — $mem_pid"
    else
        echo "NOT RUNNING"
    fi
elif [[ $key == "STOP" ]]; then
    if [ ! -z $mem_pid ]; then
        kill -9 $mem_pid 2> /dev/null
        rm -rf $mem_pid_file
        echo "STOPPED"
    else
        echo "NOT RUNNING"
    fi
else
    echo "UNKNOWN COMMAND"
fi
