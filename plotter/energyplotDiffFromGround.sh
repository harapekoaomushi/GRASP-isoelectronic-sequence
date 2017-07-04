#!/bin/bash
sed -e 's/D/e/g' $1 > $1tran
sed -e 's/D/e/g' $2 > $2tran
sed -e 's/D/e/g' $3 > $3tran

echo "" > $2diff
cat $1tran | while read num val
do
	diff=$(echo "`cat $2tran | grep -e ^$num' ' | cut -d' ' -f2` $val" | awk '{print $1-$2}')
	echo $num $diff >> $2diff
done

echo "" > $3diff
cat $1tran | while read num val
do
	diff=$(echo "`cat $3tran | grep -e ^$num' ' | cut -d' ' -f2` $val" | awk '{print $1-$2}')
	echo $num $diff >> $3diff
done


gnuplot -e "
set ytics nomirror;
set grid;
set xlabel 'Atomic Number';
set ylabel 'Energy from Ground[eV]';
set key left top box;
set pointsize 0.5;
plot '$2diff' using 1:2 title '$2', '$3diff' using 1:2 title '$3';
set terminal pdfcairo enhanced size 7in,4in;
set output '$1_$2_$3diff.pdf';
replot;
"


gnuplot -e "
set ytics nomirror;
set grid;
set xlabel 'Atomic Number';
set ylabel 'Energy from Ground[eV]';
set key left top box;
set pointsize 0.5;
set logscale y;
plot '$2diff' using 1:2 title '$2', '$3diff' using 1:2 title '$3';
set terminal pdfcairo enhanced size 7in,4in;
set output '$1_$2_$3difflog.pdf';
replot;
"

rm $1tran $2tran $3tran $2diff $3diff
