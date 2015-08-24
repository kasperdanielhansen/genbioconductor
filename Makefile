R_SCRIPT=/usr/bin/Rscript

Materials : Materials.Rmd
	$(R_SCRIPT) -e '{library(rmarkdown);\
                         render("Materials.Rmd",\
                                output_format="html_document",\
                                output_options=list(theme="cosmo"))}'

index : index.Rmd
	$(R_SCRIPT) -e '{library(rmarkdown);\
                         render("index.Rmd",\
                                output_format="html_document",\
                                output_options=list(theme="cosmo"))}'


# Materials : Materials.md
# 	pandoc -s -S --toc Materials.md -o Materials.html
# 	open Materials.html

fixme:
	grep FIXME *.md
