R_SCRIPT=/usr/local/R/R-3.2/bin/Rscript
OUTPUT_FORMAT="BiocStyle::html_document"
RENDER=$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle);
RENDER_END=, output_format = $(OUTPUT_FORMAT))}'

Materials_Week1 : Materials_Week1.md
	pandoc -o Materials_Week1.html Materials_Week1.md
	open Materials_Week1.html

IRanges_Basic : IRanges_Basic.Rmd
	$(RENDER) render("IRanges_Basic.Rmd" $(RENDER_END)

GRanges_Basic : GRanges_Basic.Rmd
	$(RENDER) render("GRanges_Basic.Rmd" $(RENDER_END)

AnnotationHub : AnnotationHub.Rmd
	$(RENDER) render("AnnotationHub.Rmd" $(RENDER_END)

Usecase_AnnotationHub_GRanges : Usecase_AnnotationHub_GRanges.Rmd
	$(RENDER) render("Usecase_AnnotationHub_GRanges.Rmd" $(RENDER_END)

R_Overview : R_Overview.Rmd
	$(RENDER) render("R_Overview.Rmd" $(RENDER_END)

fixme:
	grep FIXME *.Rmd

all: Materials_Week1 IRanges_Basic GRanges_Basic AnnotationHub Usecase_AnnotationHub_GRanges R_Overview

clean:
	rm -f *.html *.pdf

