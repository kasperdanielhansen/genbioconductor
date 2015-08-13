R_SCRIPT=/usr/bin/Rscript
OUTPUT_FORMAT="BiocStyle::html_document"
RENDER=$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle);
RENDER_END=, output_format = $(OUTPUT_FORMAT), output_options = list(toc=TRUE))}'
RENDER2=$(R_SCRIPT) -e '{library(knitr);
RENDER2_END=)}'

Materials_Week2 : Materials_Week2.md
	pandoc -o Materials_Week2.html Materials_Week2.md
	open Materials_Week2.html

ExpressionSet: ExpressionSet.Rmd
	$(RENDER) render("ExpressionSet.Rmd" $(RENDER_END)
	$(RENDER2) purl("ExpressionSet.Rmd" $(RENDER2_END)

SummarizedExperiment: SummarizedExperiment.Rmd
	$(RENDER) render("SummarizedExperiment.Rmd" $(RENDER_END)
	$(RENDER2) purl("SummarizedExperiment.Rmd" $(RENDER2_END)

Biostrings_Intermediate: Biostrings_Intermediate.Rmd
	$(RENDER) render("Biostrings_Intermediate.Rmd" $(RENDER_END)
	$(RENDER2) purl("Biostrings_Intermediate.Rmd" $(RENDER2_END)

Biostrings_Basic: Biostrings_Basic.Rmd
	$(RENDER) render("Biostrings_Basic.Rmd" $(RENDER_END)
	$(RENDER2) purl("Biostrings_Basic.Rmd" $(RENDER2_END)

GenomicRanges_Rle: GenomicRanges_Rle.Rmd
	$(RENDER) render("GenomicRanges_Rle.Rmd" $(RENDER_END)
	$(RENDER2) purl("GenomicRanges_Rle.Rmd" $(RENDER2_END)

fixme:
	grep FIXME *.Rmd

all: Materials_Week2 ExpressionSet SummarizedExperiment Biostrings_Basic Biostrings_Intermediate GenomicRanges_Intermediate 

clean:
	rm -f *~ *.pdf

