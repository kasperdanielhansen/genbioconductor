R_SCRIPT=/usr/bin/Rscript

RMDS=SummarizedExperiment ExpressionSet\
     GEOquery\
     Biostrings BSgenome\
     Biostrings_Matching BSgenome_Views\
     GenomicRanges_Rle GenomicRanges_Lists\
     GenomicFeatures\
     rtracklayer_Import

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

Biostrings : Biostrings.html

BSgenome : BSgenome.html

Biostrings_Matching : Biostrings_Matching.html

BSgenome_Views : BSgenome_Views.html

GenomicRanges_Rle : GenomicRanges_Rle.html

GenomicRanges_Lists : GenomicRanges_Lists.html

GEOquery : GEOquery.html

GenomicFeatures : GenomicFeatures.html

rtracklayer_Import : rtracklayer_Import.html

all : $(RMDS)

fixme :
	grep FIXME *.Rmd *.md

clean :
	rm -f *~ *.pdf

