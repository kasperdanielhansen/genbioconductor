R_SCRIPT=/usr/bin/Rscript

RMDS=SummarizedExperiment ExpressionSet\
     Biostrings_Basic Biostrings_Intermediate\
     GenomicRanges_Rle GenomicRanges_Lists

%.html : %.Rmd .FORCE
	$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle);\
                       render("$*.Rmd", \
                              output_format="BiocStyle::html_document",\
                              output_options=list(toc=TRUE))}'
	$(R_SCRIPT) -e '{library(knitr);\
                        purl("$*.Rmd")}'
	sed -i.bak -nEe '/## ----dependencies/, $$p' $*.R
	rm $*.R.bak

.PHONY : fixme all clean $(RMDS)

.FORCE :

ExpressionSet : ExpressionSet.html

SummarizedExperiment : SummarizedExperiment.html

Biostrings_Intermediate : Biostrings_Intermediate.html

Biostrings_Basic : Biostrings_Basic.html

GenomicRanges_Rle : GenomicRanges_Rle.html

GenomicRanges_Lists : GenomicRanges_Lists.html

GEOquery : GEOquery.html

all : $(RMDS)

fixme :
	grep FIXME *.Rmd *.md

clean :
	rm -f *~ *.pdf

