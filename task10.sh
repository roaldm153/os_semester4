prev_ppid=""
sum=0
count=0
tmp=""

while IFS= read -r line; do
    ppid=$(echo "$line" | grep -oP 'Parent_ProcessID=\K[0-9]+')
    art=$(echo "$line" | grep -oP 'Average_Running_Time=\K[0-9.]+')

    if [[ "$ppid" != "$prev_ppid" && -n "$prev_ppid" ]]; then
        avg=$(awk "BEGIN {print $sum / $count}")
        tmp+="Average_Running_Children_of_ParentID=$prev_ppid is $avg\n"
        sum=0
        count=0
    fi

    tmp+="$line\n"
    sum=$(awk "BEGIN {print $sum + $art}")
    ((count++))
    prev_ppid=$ppid
done < process_art.txt

avg=$(awk "BEGIN {print $sum / $count}")
tmp+="Average_Running_Children_of_ParentID=$prev_ppid is $avg\n"

printf "$tmp" > process_art.txt
