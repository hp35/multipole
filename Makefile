#
# Makefile for compilation of reports written in plain TeX.
#
# Copyright (C) 1996-2025 under GPLv3, Fredrik Jonsson
#
FIGURES = $(wildcard metapost/*.pdf)
PROJECT = multipole

all: figures $(PROJECT).pdf

figures:
	make -C figs

$(PROJECT).pdf: $(PROJECT).ps
	ps2pdf $(PROJECT).ps $(PROJECT).pdf

$(PROJECT).ps: $(PROJECT).dvi
	dvips -D1200 -ta4 $(PROJECT).dvi -o $(PROJECT).ps

$(PROJECT).dvi: $(PROJECT).tex
	tex $(PROJECT).tex
	tex $(PROJECT).tex

archive:
	make -ik clean
	tar --directory=../ -cf ../$(PROJECT).tar $(PROJECT)

clean:
	make clean -C figs
	rm -Rf *~ *.aux *.toc *.log *.dvi *.ps *.tar.gz
