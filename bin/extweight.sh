#!/bin/bash
if [ $# -ne 2 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには2個の引数が必要です。\nUsage: extweight.sh directory level" 1>&2
  exit 1
fi

level=$2

CSFweight=`grep -A $((level+3)) " Weights of major contributors to ASF:" $1"/rci92.sum" | awk 'END{print $4" "$6"\n"$7" "$9"\n"$10" "$12}' | sort -k2 | cut -d" " -f1 | tr "\n" " "`

if [ ! `echo $CSFweight | tr -d " "` = "" ]
then
	echo "$1 $CSFweight" | tee -a CSFweightLevel$level.txt
fi


energy=`perl -e 'print reverse <>' $1"/rci92.sum" | grep -m 1 -B $((level+3)) "Eigenenergies:" | head -n 1 | tr -s " " | cut -c 2- | cut -d" " -f6`

if [ ! `echo $energy | tr -d " "` = "" ]
then
	echo "$1 $energy" | tee -a energyLevel$level.txt
fi
