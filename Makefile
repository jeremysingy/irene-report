#------------------------------------------------
# Makefile for the master thesis report
# Mainly to simplify latexmk runs and automate the draft's compilation
#------------------------------------------------

REPORT := report
MAINFILE := main
BUILDFOLDER := build
REDDROPFOLDER := ../../Jeremy/Dropbox/Reddrop/cracked-records-3d-irene/Report

# Output is phony because we want latexmk to always run
.PHONY: $(REPORT).pdf draft clean clean_all

all: $(REPORT).pdf

$(REPORT).pdf:
	latexmk -silent $(MAINFILE).tex
	cp $(BUILDFOLDER)/$(MAINFILE).pdf ./$(REPORT).pdf
#	To use latexmk jobname instead (mess up the cleaning...)
#	latexmk -jobname=$(REPORT) $(MAINFILE).tex

draft: all
	cp $(REPORT).pdf $(REDDROPFOLDER)/$(REPORT)_$(shell date +%y-%m-%d).pdf

clean:
	latexmk -c
	rm -f $(MAINFILE).fls

clean_all:
	latexmk -C
	rm -f $(REPORT).pdf