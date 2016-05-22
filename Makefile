R_SCRIPT=/usr/local/bin/Rscript
# R_SCRIPT=~/Bin/Rscript-devel
GITHUB_URL=https://github.com/kasperdanielhansen/genbioconductor/blob/master/Rmd
COURSERA_URL=https://class.coursera.org/genbioconductor-004/lecture

index : index.Rmd
	$(R_SCRIPT) -e '{library(rmarkdown);\
                         render("index.Rmd",\
                                output_format="html_document",\
                                output_options=list(theme="cosmo"))}'
	sed -i.bak 's|GITHUB_URL|$(GITHUB_URL)|' index.html
	sed -i.bak 's|COURSERA_URL|$(COURSERA_URL)|' index.html
	rm index.html.bak


html/%.html: Rmd/%.Rmd .FORCE
	cd Rmd && $(R_SCRIPT) -e '{\
           printBook=FALSE; library(rmarkdown); library(BiocStyle);\
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
       html/GenomicRanges_GRanges_Usage.html\
       html/GenomicRanges_seqinfo.html\
       html/AnnotationHub.html\
       html/Usecase_AnnotationHub_GRanges.html\
       html/Biostrings.html\
       html/BSgenome.html\
       html/Biostrings_Matching.html\
       html/BSgenome_Views.html\
       html/GenomicRanges_Rle.html\
       html/GenomicRanges_Lists.html\
       html/GenomicFeatures.html\
       html/rtracklayer_Import.html\
       html/ExpressionSet.html\
       html/SummarizedExperiment.html\
       html/GEOquery.html\
       html/biomaRt.html\
       html/R_S4.html\
       html/Getting_Data_into_Bioconductor.html\
       html/ShortRead.html\
       html/Rsamtools.html\
       html/oligo.html\
       html/limma.html\
       html/minfi.html\
       html/Count_Based_RNAseq.html

temp: html/ExpressionSet.html

all : Rmds index

clean:
	rm -f *~ *.pdf

fixme:
	grep FIXME *.md
