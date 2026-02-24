if [ "$HOME" == "$PWD" ]; then
	exit 0
else
	echo "error"
	exit 1
fi
