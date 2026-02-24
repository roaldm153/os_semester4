FILE1="/var/log/anaconda/storage.log"
FILE2="/var/log/installer/anaconda.log"
output="info.log"
if [ -f "$FILE1" ]; then
	while IFS= read -r line; do
		arr=($line)
		if [ $arr[1] == "INFO" ]; then
			echo $line > output
		fi
	done < $FILE1
	exit 0
fi

if [ -f "$FILE2" ]; then
	while IFS= read -r line; do
		arr=($line)
		if [ $arr[1] == "INFO" ]; then
			echo $line > output
		fi
	done < $FILE2
	exit 0
fi

echo "error"
exit 1
