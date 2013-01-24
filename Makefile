#------------------------------------------------
# Makefile for the master thesis report
# Mainly to simplify latexmk runs and automate the draft's compilation
#------------------------------------------------

REPORT := report
MAINFILE := main
BUILDFOLDER := build
DIAGFOLDER := diagrams
GRAPHSFOLDER := graphs
REDDROPFOLDER := ../../Jeremy/Dropbox/Reddrop/cracked-records-3d-irene/Report

# Output is phony because we want latexmk to always run
.PHONY: $(REPORT).pdf draft diag clean_fls clean clean_all

all: $(REPORT).pdf

$(REPORT).pdf: diag
	latexmk -silent $(MAINFILE).tex
	cp $(BUILDFOLDER)/$(MAINFILE).pdf ./$(REPORT).pdf
#	To use latexmk jobname instead (mess up the cleaning...)
#	latexmk -jobname=$(REPORT) $(MAINFILE).tex

# Create a draft dated current day
draft: all
	cp $(REPORT).pdf $(REDDROPFOLDER)/$(REPORT)_draft_$(shell date +%y-%m-%d).pdf

# Build the metapost diagram objects
diag:
	@(cd ./$(DIAGFOLDER) && $(MAKE))

# This file remains in the top directory and must be separately removed
clean_fls:
	rm -f $(MAINFILE).fls

clean: clean_fls
	latexmk -c
	@(cd ./$(DIAGFOLDER) && $(MAKE) $@)
	@(cd ./$(GRAPHSFOLDER) && $(MAKE) $@)

clean_all: clean_fls
	latexmk -C
	rm -f $(REPORT).pdf
	@(cd ./$(DIAGFOLDER) && $(MAKE) $@)
	@(cd ./$(GRAPHSFOLDER) && $(MAKE) $@)