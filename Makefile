# when running Windows Subsystem for Linux:
# export GHCRTS=-V0

SRC = $(wildcard *.yaml)
TEMPLATE = $(SRC:.yaml=-template.tex)

all:
	pandoc $(SRC) -o $(SRC:.yaml=.pdf) --template=$(TEMPLATE) --latex-engine=xelatex

clean:
	rm -f *.pdf
