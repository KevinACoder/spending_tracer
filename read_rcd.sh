#!/bin/bash

echo "Welcome to Spending Tracer"
echo "type in [-sum] to sum spending | [-max] to get max spending"
echo "[-min] to get min spending"

read -p "command: " cmd
in_file='./rcd.txt'
tmp_file='./tmp_rcd.txt'
items=('category' 'place' 'price')

case $cmd in
	-sum)
		echo "caculating the sum of spending"
		price_sum=0
		while read line
		do
			IFS=' ' read -r date cate place price <<< "$line"
			let price_sum=price_sum+price
		done < $in_file
		printf 'sum of spending is %d\n' $price_sum
		;;
	-max)
		echo "search most expensive spending"
		sort -nrk 4 $in_file > $tmp_file
		#cat $tmp_file
		line_num=1
       	while read line
       	do
       		let line_num--
       		IFS=' ' read -r date cate place price <<< "$line"
			printf "most expensive shopping at %s in %s and cost %d\n" $place $date $price
			if [ $line_num -eq 0 ]; then
				break;
			fi
       	done < $tmp_file
		;;		
	-min)
		echo "search most inexpensive spending"
		sort -nk 4 $in_file > $tmp_file
		#cat $tmp_file
		line_num=1
       	while read line
       	do
       		let line_num--
       		IFS=' ' read -r date cate place price <<< "$line"
			printf "most inexpensive shopping at %s in %s and cost %d\n" $place $date $price
			if [ $line_num -eq 0 ]; then
				break;
			fi
       	done < $tmp_file
		;;	
	*)

		;;

	esac