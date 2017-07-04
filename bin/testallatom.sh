#!/bin/bash

if [ $# -ne 2 ] && [ ! $# = "0" ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには2個の引数が必要です。" 1>&2
  exit 1
fi

if [ $# = "0" ]; then
	echo "全原子核計算します"
	minZ=0
	maxZ=9223372036854775806
else
	echo "Z=$1からZ=$2まで計算します"
	minZ=$1
	maxZ=$2
fi


COLOR_1="\e[37;41;1m"
COLOR_OFF="\e[m"

mkdir level1
cd level1
cp ../grasp92.csl ./
cat ~/lib/isotopelist | while read line
do
	set -- $line
	AtomicNum=$1
	AtomicMass=$2

	if [ $AtomicNum -lt $minZ ] ; then
		continue
	fi
	if [ $AtomicNum -gt $maxZ ] ; then
		continue
	fi
	echo -e "\n${COLOR_1}\n\n\n\tStart Calculate Atomic Number $1 (1st Level)\n\n${COLOR_OFF}\n" | tee -a runlog.txt
	testall_1.sh $AtomicNum $AtomicMass > runlog.txt
	extweight.sh $AtomicNum 1
	extweight.sh $AtomicNum 2
	extweight.sh $AtomicNum 3
	echo $AtomicNum
	echo $AtomicMass
done

cd ../
mkdir level123
cd level123
cp ../grasp92.csl ./
cat ~/lib/isotopelist | while read line
do
	set -- $line
	AtomicNum=$1
	AtomicMass=$2

	if [ $AtomicNum -lt $minZ ] ; then
		continue
	fi
	if [ $AtomicNum -gt $maxZ ] ; then
		continue
	fi
	echo -e "\n${COLOR_1}\n\n\n\tStart Calculate Atomic Number $1 (1st, 2nd and 3rd Levels)\n\n${COLOR_OFF}\n" | tee -a runlog.txt
	testall_123.sh $AtomicNum $AtomicMass > runlog.txt
	extweight.sh $AtomicNum 1
	extweight.sh $AtomicNum 2
	extweight.sh $AtomicNum 3
	echo $AtomicNum
	echo $AtomicMass
done
