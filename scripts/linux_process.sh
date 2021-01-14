#!/bin/bash

i=1
count=1
PNAME="a"
PRENAME="b"
Len=(`ps -e |awk -F " " '{print $4}' |wc -l`)

echo '{"data":['

ps -e |awk -F " " '{print $4}' |sort |while read line
do
	if [ $i -gt 1 ]; then
		if [ $i -eq $Len ]; then
			PNAME=$line
			if [ $PNAME == $PRENAME ]; then
				echo '{"{#PROCESSNAME}":"'$line'#'$count'","{#PROCESSKEY}":"'$line'='$count'"}'
				count=$((count+1))
			else
				echo '{"{#PROCESSNAME}":"'$line'","{#PROCESSKEY}":"'$line'"}'
                                count=1
			fi
			PRENAME=$line
		else
			PNAME=$line
                        if [ $PNAME == $PRENAME ]; then
                                echo '{"{#PROCESSNAME}":"'$line'#'$count'","{#PROCESSKEY}":"'$line'='$count'"},'
                                count=$((count+1))
                        else
                                echo '{"{#PROCESSNAME}":"'$line'","{#PROCESSKEY}":"'$line'"},'
                                count=1
                        fi
                        PRENAME=$line
		fi
	fi

	i=$((i+1))

done
echo ']}'
