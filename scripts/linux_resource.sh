#!/bin/bash

ProcessName=$1
ResourceName=$2

# Check Variables
[[ $# -lt 1 ]] && { echo "FATAL: parameter not specified"; exit 1; }

# Split Process Name
IFS="=" read -ra NAME_ARRAY <<< $ProcessName
ARRAY_LENGTH=${#NAME_ARRAY[@]}

PID=(`ps -ef |grep -i ${NAME_ARRAY[0]} |grep -v grep |grep -v linux_resource |awk '{print $2}'`)

if [ $ARRAY_LENGTH -eq 1 ]; then
	result=(`ps -p ${PID[0]} -o $2 |tail -1 |sed 's/ //g'`)
	echo $result
else
	count=${NAME_ARRAY[1]}
	result=(`ps -p ${PID[0]} -o $2 |tail -1 |sed 's/ //g'`)
        echo $result
fi
	
