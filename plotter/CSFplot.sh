#!/bin/bash
gnuplot -e "
set ytics nomirror;
set y2tics;
set grid;
set xlabel 'Atomic Number';
set ylabel '1s(2)2s(2)';
set y2label '1s(2)2p(2)';
set key default box;
set pointsize 0.5;
plot '$1' using 1:2 title '1s(2)2s(2)', '$1' using 1:3 title '1s(2)2p-(2)' axes x1y2, '$1' using 1:4 title '1s(2)2p(2)' axes x1y2;
set terminal pdfcairo enhanced size 7in,4in;
set output '$1.pdf';
replot
"
