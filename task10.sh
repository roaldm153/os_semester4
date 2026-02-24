man bash | col -b | tr -c '[:alpha:]' '\n' | tr '[:upper:]' '[:lower:]' | awk 'length($0) >= 4' | sort | uniq -c | sort -nr | head -n 3

