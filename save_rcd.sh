#!/bin/bash


echo "Welcome to Spending Tracer"
echo "Please enter \[q!\] to quit"

items=('category' 'place' 'price')
items_num=2
input='null'
out_file='./rcd.txt'
exit_mark='q!'
while [ $input != $exit_mark ] #iterative visit all item
do
	rcd=''
	for i in "${items[@]}";
	do
		msg=$(printf '%s:' $i)
		read -p $msg input
		if [ $input == $exit_mark ]; then #exit if type in exit mark
			break
		fi
		rcd=$(printf '%s %s' $rcd $input)
	done
	rcd=$(printf '%s\n' $rcd) #append record to file
	echo $rcd >> $out_file
	read -p 'one record created..type in q! to exit...' input
done
