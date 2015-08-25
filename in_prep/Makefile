R_SCRIPT=/usr/bin/Rscript

RMDS=Install_Bioconductor Online_Resources\
     R_Base_Types\
     IRanges_Basic\
     GenomicRanges_GRanges GenomicRanges_seqinfo\
     GenomicRanges_GRanges_Usage\
     AnnotationHub Usecase_AnnotationHub_GRanges


%.html: %.Rmd .FORCE
	$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle);\
                       render("$*.Rmd", \
                              output_format="BiocStyle::html_document",\
                              output_options=list(toc=TRUE))}'
	$(R_SCRIPT) -e '{library(knitr);\
                        purl("$*.Rmd")}'
	sed -i.bak -nEe '/## ----dependencies/, $$p' $*.R
	rm $*.R.bak

.PHONY: fixme all clean $(RMDS)

.FORCE :

deploy:
	mkdir -p ../html
	cp *.html ../html
	mkdir -p ../rmd
	cp *.Rmd ../rmd
	mkdir -p ../r
	cp *.R ../rmd

Install_Bioconductor : Install_Bioconductor.html
	rm Install_Bioconductor.R

Online_Resources : Online_Resources.html
	rm Online_Resources.R

R_Base_Types : R_Base_Types.html

IRanges_Basic : IRanges_Basic.html

GenomicRanges_GRanges : GenomicRanges_GRanges.html

GenomicRanges_seqinfo : GenomicRanges_seqinfo.html

GenomicRanges_GRanges_Usage : GenomicRanges_GRanges_Usage.html

AnnotationHub : AnnotationHub.html

Usecase_AnnotationHub_GRanges : Usecase_AnnotationHub_GRanges.html

all: $(RMDS)

fixme:
	grep FIXME *.Rmd *.md

clean:
	rm -f *~ *.pdf

