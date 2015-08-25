## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(Biostrings)
library(BSgenome)
library(BSgenome.Scerevisiae.UCSC.sacCer2)


## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("Biostrings", "BSgenome",
##            "BSgenome.Scerevisiae.UCSC.sacCer2", "AnnotationHub"))

## ----mmatchPattern-------------------------------------------------------
dnaseq <- DNAString("ACGTACGT")
matchPattern(dnaseq, Scerevisiae$chrI)
countPattern(dnaseq, Scerevisiae$chrI)
vmatchPattern(dnaseq, Scerevisiae)
head(vcountPattern(dnaseq, Scerevisiae))

## ----revCompCheck--------------------------------------------------------
dnaseq == reverseComplement(dnaseq)

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

