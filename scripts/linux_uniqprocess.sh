#!/bin/bash

i=0
Len=(`ps -e |awk -F " " '{print $4}' |uniq |wc -l`)
let "Len -= 1"

echo '{"data":['

ps -e |awk -F " " '{print $4}' |uniq |while read line
do
	if [ $i -gt 2 ]; then
		if [ $i -eq $Len ]; then
			echo '{"{#PROCESSNAME}":"'$line'"}'
		else
			echo '{"{#PROCESSNAME}":"'$line'"},'
		fi
	fi
	i=$((i+1))

done
echo ']}'
