#!/bin/bash
sed -e 's/D/e/g' $1 > $1tran
sed -e 's/D/e/g' $2 > $2tran
sed -e 's/D/e/g' $3 > $3tran

gnuplot -e "
set ytics nomirror;
set y2tics;
set grid;
set xlabel 'Atomic Number';
set ylabel 'Energy[eV]';
set key default box;
set pointsize 0.5;
plot '$1tran' using 1:2 title '$1', '$2tran' using 1:2 title '$2', '$3tran' using 1:2 title '$3';
set terminal pdfcairo enhanced size 7in,4in;
set output '$1_$2_$3.pdf';
replot
"

rm $1tran $2tran $3tran
