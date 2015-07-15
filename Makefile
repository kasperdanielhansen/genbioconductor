R_SCRIPT=/usr/local/R/R-3.2.x/bin/Rscript
OUTPUT_FORMAT="BiocStyle::html_document"

iranges : iranges.Rmd
	$(R_SCRIPT) -e '{library(rmarkdown); render("iranges.Rmd", output_format = "all")}'

iranges2 : iranges.Rmd
	$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle); render("iranges.Rmd", output_format = $(OUTPUT_FORMAT))}'
