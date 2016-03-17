
clear
reset
unset key
set title "Gender Distibution (Percentage)"
set key inside top right
set style data histogram
set yrange[0:100]
set style histogram cluster gap 1
set style fill solid border
set boxwidth 0.9
set ylabel "Percentage"
set xlabel "Year"
unset x2tics
plot 'resultsGender.dat' using 2:xticlabels(1) title "Male", '' using 3:xticlabels(1) title "Female"
set term png
set output "resultsGender.png" 
replot 
set term x11
