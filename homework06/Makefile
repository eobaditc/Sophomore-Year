all: report.pdf

report.pdf: resultsRace.png resultsGender.png
	pdflatex report.tex

resultsRace.png: resultsRace.dat race.plt
	gnuplot ./race.plt

resultsGender.png: resultsGender.dat gender.plt
	gnuplot ./gender.plt

resultsGender.dat: gender.sh demographics.sh
	./gender.sh

resultsRace.dat: race.sh demographics.sh
	./race.sh

clean: 
	rm -f report.pdf resultsRace.png resultsGender.png
