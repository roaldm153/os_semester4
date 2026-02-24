# 3 integer numbers as command args, print max of them
if [ $1 -le $2 ]; then
	if [ $2 -le $3 ]; then
		echo $3
	else
		echo $2
	fi
else
	if [ $1 -le $3 ]; then
		echo $3
	else
		echo $1
	fi
fi
