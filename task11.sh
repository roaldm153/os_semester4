for pid in /proc/[0-9]*/; do
    pid=${pid//[^0-9]/}
    [[ ! -r /proc/$pid/status ]] && continue
    rss=$(awk '/^VmRSS:/ {print $2}' /proc/$pid/status)
    [[ -z "$rss" ]] && continue
    echo "$rss $pid"
done | sort -n | tail -1 | awk '{print "PID=" $2, "RSS=" $1 "kB"}'

echo ""
ps -eo pid,rss,comm --sort=-rss | head -5
