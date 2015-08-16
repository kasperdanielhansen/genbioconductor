R_SCRIPT=/usr/bin/Rscript

RMDS=R_Overview IRanges_Basic\
     GenomicRanges_GRanges GenomicRanges_GRanges_Usage\
     AnnotationHub Usecase_AnnotationHub_GRanges\
     Install_Bioconductor Online_Resources

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

Install_Bioconductor : Install_Bioconductor.html
	rm Install_Bioconductor.R

Online_Resources : Online_Resources.html
	rm Online_Resources.R

IRanges_Basic : IRanges_Basic.html

GenomicRanges_GRanges : GenomicRanges_GRanges.html

GenomicRanges_GRanges_Usage : GenomicRanges_GRanges_Usage.html

AnnotationHub : AnnotationHub.html

Usecase_AnnotationHub_GRanges : Usecase_AnnotationHub_GRanges.html

R_Overview : R_Overview.html

all: $(RMDS)

fixme:
	grep FIXME *.Rmd *.md

clean:
	rm -f *~ *.pdf

