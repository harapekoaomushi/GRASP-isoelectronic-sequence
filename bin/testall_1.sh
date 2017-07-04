#!/bin/bash

COLOR_1="\e[34;47;1m"
COLOR_OFF="\e[m"
if [ $# -ne 2 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには2個の引数が必要です。" 1>&2
  exit 1
fi

mkdir ./$1
cp ./grasp92.csl ./$1/grasp92.csl
cd ./$1
echo -e "\n${COLOR_1}\n\n\tgenmcp\n${COLOR_OFF}\n"
testgenmcp.sh
echo -e "\n${COLOR_1}\n\n\tgeniso\n${COLOR_OFF}\n"
testgeniso.sh $1 $2
echo -e "\n${COLOR_1}\n\n\terwf\n${COLOR_OFF}\n"
testerwf.sh
echo -e "\n${COLOR_1}\n\n\trscf92\n${COLOR_OFF}\n"
testrscf92_1.sh
echo -e "\n${COLOR_1}\n\n\trci92\n${COLOR_OFF}\n"
testrci92_1.sh

exit
