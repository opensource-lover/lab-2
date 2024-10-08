#! /bin/bash

dectobin () {
	tempar=()
	n=$1
	while [[ $n -gt 1 ]]; do
		r=$(( $n % 2 ))
		tempar+=($r)
		(( n /= 2 ))
	done
	tempar+=($n)

	i=${#tempar[@]}-1
	while [[ $i -gt -1 ]]; do
		reversedar+=${tempar[i]}
		(( i -- ))
	done
	
	echo $reversedar
}

numberofdots () {
	mystring=$1
	res="${mystring//[^.]}"
	echo "${#res}"
}

myvar=$1

while [[ $(numberofdots $myvar) -ne 3 ]]; do
	echo "Wrong string, there should be 4 groups of digits separated by periods"
	printf "Try again: "
	read myvar
done

myarray=${myvar//./ }
for i in $myarray; do
	if [[ $i -lt 256 ]]; then
		newarray+=($(dectobin $i))
	else
		echo "Wrong numeric value! It should be less than 256!"
		exit 1
	fi
done

printf "%.8d.%.8d.%.8d.%.8d" "${newarray[@]}"; printf "\n"


