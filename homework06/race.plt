
clear
reset
unset key
set title "Ethnicity Distribution (Percentage)"
set key top right
set style data histogram
set yrange[0:100]
set style histogram clustered gap 1
set style fill solid border
set boxwidth 0.9
set ylabel "Percentage"
set xlabel "Year"
unset x2tics
plot 'resultsRace.dat' using 2:xticlabels(1) title "Caucasion", '' using 3:xticlabels(1) title "Oriental", '' using 4:xticlabels(1) title "Hispanic", '' using 5:xticlabels(1) title "African America", '' using 6:xticlabels(1) title "Native American", '' using 7:xticlabels(1) title "Multiple", '' using 8:xticlabels(1) title "Undeclared"
set term png
set output "resultsRace.png" 
replot 
set term x11

