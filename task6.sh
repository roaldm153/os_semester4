touch full.log
output="full.log"
FILE1="/var/log/anaconda/anaconda.log"
FILE2="/var/log/installer/X.0.log"

if [ -f "$FILE1" ]; then
	while IFS= read -r line; do
		arr=($line)
		if [ "${arr[1]}" == "WRN" ]; then
			arr[1]="Warning"
			echo ${arr[*]} >> $output
		fi
	done < $FILE1

	while IFS= read -r line; do
		arr=($line)
		if [ "${arr[1]}" == "INF" ]; then
			arr[1]="Information"
			echo ${arr[*]} >> $output
		fi
	done < $FILE1
fi

if [ -f "$FILE2" ]; then
	echo "file2 exists"
fi
