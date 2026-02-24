read str
while [ $str != "q" ]; do
	buff="${buff}${str}"
	read str
done
echo $buff
