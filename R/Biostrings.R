## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(Biostrings)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("Biostrings"))

## ----DNAString, error=TRUE-----------------------------------------------
dna1 <- DNAString("ACGT-N")
dna1
DNAStringSet("ACG")
dna2 <- DNAStringSet(c("ACGT", "GTCA", "GCTA"))
dna2

## ----IUPAC---------------------------------------------------------------
IUPAC_CODE_MAP

## ----DNAStringSubset-----------------------------------------------------
dna1[2:4]
dna2[2:3]

## ----DNAStringSubset2----------------------------------------------------
dna2[[2]] 

## ----DNAStringSetNames---------------------------------------------------
names(dna2) <- paste0("seq", 1:3)
dna2

## ----basicFunc-----------------------------------------------------------
width(dna2)
sort(dna2)
rev(dna2)
rev(dna1)

## ----bioFunc-------------------------------------------------------------
translate(dna2)
reverseComplement(dna1)

## ----counting------------------------------------------------------------
alphabetFrequency(dna1)
alphabetFrequency(dna2)
letterFrequency(dna2, "GC")
consensusMatrix(dna2, as.prob = TRUE)

## ----back, child="back.Rmd", echo=FALSE----------------------------------

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()


