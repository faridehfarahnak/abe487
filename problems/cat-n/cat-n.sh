#!/bin/bash

set -u  #force variable initialization

Filename=""

# Usage
function Usage(){
	printf " Usage: %s Filename\n" $(basename $0)
	
	echo " Required argument:"
	echo
	echo " Filename"
	echo
	
	exit ${1:-0} 

}

if [[ $# -lt 1 ]]; then
	Usage 1
else
	Filename=$1
fi


# if filename length is less than one
if [[ ${#Filename} -lt 1 ]]; then
	printf "Filename cannot be zero length.\n"
	exit 1
fi

# if file does not exist or empty size (0 byte)
if [[ ! -s $Filename ]]; then
	printf " Either file: \"%s\" does not exist or it is empty.\n" $Filename 
	exit 1
fi

i=0
while read line; do
	let i++
	printf "%d %s\n" $i $line
done < $Filename
