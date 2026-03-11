#!/bin/bash

N=$1

ps -eo pid,etimes --no-headers | awk -v n="$N" '$2 > n {print $1}' | while read pid; do
    renice 10 -p $pid
done

ps -eo pid,ni,comm --sort=-ni | head -10
