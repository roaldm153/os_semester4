#!/bin/bash

for pid in /proc/[0-9]*/; do
    pid=${pid//[^0-9]/}

    [[ ! -r /proc/$pid/status || ! -r /proc/$pid/sched ]] && continue

    ppid=$(awk '/^PPid:/ {print $2}' /proc/$pid/status)
    sum=$(awk '/se\.sum_exec_runtime/ {print $3}' /proc/$pid/sched)
    switches=$(awk '/^nr_switches/ {print $3}' /proc/$pid/sched)

    [[ -z "$sum" || -z "$switches" || "$switches" == "0" ]] && continue

    art=$(awk "BEGIN {print $sum / $switches}")

    echo "$ppid ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$art"
done | sort -n | awk '{$1=""; print substr($0,2)}' > process_art.txt
