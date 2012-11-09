#------------------------------------------------
# Makefile to generate Metapost objects
#------------------------------------------------

SOURCES := $(shell find . -name '*.mp')
OBJECTS := $(SOURCES:%.mp=%.log)
# User .log as objects as always one file generated per source

# Output is phony because we want latexmk to always run
.PHONY: $(REPORT).pdf clean clean_all

all: $(OBJECTS)

%.log: %.mp
	mpost $<

clean:
	rm -f $(OBJECTS)

clean_all: clean
	rm -f *.mps *.[1-9]