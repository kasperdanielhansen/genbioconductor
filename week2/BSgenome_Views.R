## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(BSgenome)
library(BSgenome.Scerevisiae.UCSC.sacCer2)
library(AnnotationHub)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("BSgenome",
##            "BSgenome.Scerevisiae.UCSC.sacCer2", "AnnotationHub"))

## ----views1--------------------------------------------------------------
library("BSgenome.Scerevisiae.UCSC.sacCer2")
dnaseq <- DNAString("ACGTACGT")
vi <- matchPattern(dnaseq, Scerevisiae$chrI)
vi

## ----views2--------------------------------------------------------------
ranges(vi)

## ----views3--------------------------------------------------------------
vi
Scerevisiae$chrI[ start(vi):end(vi) ]

## ----views4--------------------------------------------------------------
alphabetFrequency(vi)

## ----views5--------------------------------------------------------------
shift(vi, 10)

## ----viewsVMatchPattern--------------------------------------------------
gr <- vmatchPattern(dnaseq, Scerevisiae)
vi2 <- Views(Scerevisiae, gr)

## ----annotationHub-------------------------------------------------------
ahub <- AnnotationHub()
qh <- query(ahub, c("sacCer2", "genes"))
qh
genes <- qh[[which(qh$title == "SGD Genes")]]
genes

## ----promoterGCcontent---------------------------------------------------
prom <- promoters(genes)
head(prom, n = 3)

## ----promoterGCcontent2--------------------------------------------------
prom <- trim(prom)
promViews <- Views(Scerevisiae, prom)
gcProm <- letterFrequency(promViews, "GC", as.prob = TRUE)
head(gcProm)

## ----genomeGC------------------------------------------------------------
params <- new("BSParams", X = Scerevisiae, FUN = letterFrequency, simplify = TRUE)
gccontent <- bsapply(params, letters = "GC")
gcPercentage <- sum(gccontent) / sum(seqlengths(Scerevisiae))
gcPercentage

## ----plotGC, fig=TRUE----------------------------------------------------
plot(density(gcProm))
abline(v = gcPercentage, col = "red")

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

