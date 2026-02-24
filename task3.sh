read str
if [ $str -eq "1" ]; then
	nano	
elif [ $str -eq "2" ]; then
	vi
elif [ $str -eq "3" ]; then
	firefox
else
	exit
fi
