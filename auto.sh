#!/bin/bash

echo -n "Which homework? "
read HW

s=$(cat ../students.txt| awk '{ print $2 $1 }' | tr 'A-Z' 'a-z')

for x in $s
do
	PY=(../hw$HW/$x*.py)
	cp "$PY" .
	MYPY=($x*.py)
	echo >> $MYPY
	dos2unix $MYPY
	cat script_hw$HW.py >> $MYPY
	echo running $MYPY "($x)"
	python3 "$MYPY"
	echo -e "\n\n\n=======================================\n\n\n"
done
