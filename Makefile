R_SCRIPT=/usr/bin/Rscript

index : index.Rmd
	$(R_SCRIPT) -e '{library(rmarkdown);\
                         render("index.Rmd",\
                                output_format="html_document",\
                                output_options=list(theme="cosmo"))}'

html/%.html: Rmd/%.Rmd .FORCE
	cd Rmd && $(R_SCRIPT) -e '{\
           library(rmarkdown); library(BiocStyle);\
           render("$*.Rmd", \
                  output_format="BiocStyle::html_document",\
                  output_options=list(toc=TRUE))}'
	mv Rmd/$*.html html
	cd Rmd && $(R_SCRIPT) -e '{library(knitr);\
                        purl("$*.Rmd")}'
	cd Rmd && sed -i.bak -nEe '/## ----dependencies/, $$p' $*.R && rm $*.R.bak
	mv Rmd/$*.R R

.PHONY: fixme all clean $(RMDS)

.FORCE :

Rmds : html/Install_Bioconductor.html\
      html/Online_Resources.html\
      html/R_Base_Types.html\
      html/IRanges_Basic.html\
      html/GenomicRanges_GRanges.html\
      html/GenomicRanges_seqinfo.html\
      html/GenomicRanges_GRanges_Usage.html\
      html/AnnotationHub.html\
      html/Usecase_AnnotationHub_GRanges.html\
      html/SummarizedExperiment.html\
      html/ExpressionSet.html\
      html/GEOquery.html\
      html/Biostrings.html\
      html/BSgenome.html\
      html/Biostrings_Matching.html\
      html/BSgenome_Views.html\
      html/GenomicRanges_Rle.html\
      html/GenomicRanges_Lists.html\
      html/GenomicFeatures.html\
      html/rtracklayer_Import.html\
      html/R_S4.html\
      html/biomaRt.html

all : Rmds Materials

clean:
	rm -f *~ *.pdf

fixme:
	grep FIXME *.md
