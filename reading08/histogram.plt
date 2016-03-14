
clear
reset
unset key
set style data histogram
set style histogram cluster gap 1
set grid
set style fill solid border
plot 'results.dat' using 2:xticlabels(1) with histogram linecolor rgb "blue"
set term png
set output "results.png"
replot 
set term x11
