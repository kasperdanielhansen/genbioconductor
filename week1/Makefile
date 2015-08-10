R_SCRIPT=/usr/bin/Rscript
OUTPUT_FORMAT="BiocStyle::html_document"
RENDER=$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle);
RENDER_END=, output_format = $(OUTPUT_FORMAT))}'
RENDER2=$(R_SCRIPT) -e '{library(knitr);
RENDER2_END=)}'

Materials_Week1 : Materials_Week1.md
	pandoc -o Materials_Week1.html Materials_Week1.md
	open Materials_Week1.html

IRanges_Basic : IRanges_Basic.Rmd
	$(RENDER) render("IRanges_Basic.Rmd" $(RENDER_END)
	$(RENDER2) purl("IRanges_Basic.Rmd" $(RENDER2_END)

GRanges_Basic : GRanges_Basic.Rmd
	$(RENDER) render("GRanges_Basic.Rmd" $(RENDER_END)
	$(RENDER2) purl("GRanges_Basic.Rmd" $(RENDER2_END)

AnnotationHub : AnnotationHub.Rmd
	$(RENDER) render("AnnotationHub.Rmd" $(RENDER_END)
	$(RENDER2) purl("AnnotationHub.Rmd" $(RENDER2_END)

Usecase_AnnotationHub_GRanges : Usecase_AnnotationHub_GRanges.Rmd
	$(RENDER) render("Usecase_AnnotationHub_GRanges.Rmd" $(RENDER_END)
	$(RENDER2) purl("Usecase_AnnotationHub_GRanges.Rmd" $(RENDER2_END)

R_Overview : R_Overview.Rmd
	$(RENDER) render("R_Overview.Rmd" $(RENDER_END)
	$(RENDER2) purl("R_Overview.Rmd" $(RENDER2_END)

fixme:
	grep FIXME *.Rmd

all: Materials_Week1 IRanges_Basic GRanges_Basic AnnotationHub Usecase_AnnotationHub_GRanges R_Overview

clean:
	rm -f *.html *.pdf

