## ----front, child="front.Rmd", echo=FALSE--------------------------------

## ----global_options, echo=FALSE------------------------------------------
knitr::opts_chunk$set(fig.width=5, fig.height=5, size="footnotesize",
                      warning=FALSE, message=FALSE)
knitr::knit_hooks$set(small.mar = function(before, options, envir) {
  if (before) graphics::par(mar = c(5,5,1.5,1))
})

## ----standardPackages, echo=FALSE, message=FALSE-------------------------
## require("knitcitations")
## cleanbib()

## ----plotRanges, echo=FALSE----------------------------------------------
plotRanges <- function(x, xlim = x, main = deparse(substitute(x)),
                       col = "black", sep = 0.5, ...) {
    height <- 1
    if (is(xlim, "Ranges"))
        xlim <- c(min(start(xlim)), max(end(xlim)))
    bins <- disjointBins(IRanges(start(x), end(x) + 1))
    plot.new()
    plot.window(xlim, c(0, max(bins)*(height + sep)))
    ybottom <- bins * (sep + height) - height
    rect(start(x)-0.5, ybottom, end(x)+0.5, ybottom + height, col = col, ...)
    title(main)
    axis(1)
}


## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(Biostrings)
library(BSgenome)
library(BSgenome.Scerevisiae.UCSC.sacCer2)
library(AnnotationHub)

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

## ----views1--------------------------------------------------------------
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

## ---- echo=FALSE---------------------------------------------------------
sessionInfo()

