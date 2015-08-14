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

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("Biostrings", "BSgenome", "BSgenome.Scerevisiae.UCSC.sacCer2"))

## ----DNAString, error=TRUE-----------------------------------------------
dna1 <- DNAString("ACGT-N")
dna1
DNAStringSet("ADE")
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

## ----BSgenome------------------------------------------------------------
available.genomes()
library("BSgenome.Scerevisiae.UCSC.sacCer2")
Scerevisiae

## ----BSgenomeLength------------------------------------------------------
seqlengths(Scerevisiae)
seqnames(Scerevisiae)

## ----BSgenomeLoad--------------------------------------------------------
Scerevisiae$chrI

## ----gcChrI--------------------------------------------------------------
letterFrequency(Scerevisiae$chrI, "CG", as.prob = TRUE)

## ----gcGenome------------------------------------------------------------
param <- new("BSParams", X = Scerevisiae, FUN = letterFrequency)
head(bsapply(param, letters = "GC"))

## ----gcGenome2-----------------------------------------------------------
param <- new("BSParams", X = Scerevisiae, FUN = letterFrequency, simplify = TRUE)
bsapply(param, letters = "GC")

## ----gcGenome3-----------------------------------------------------------
sum(bsapply(param, letters = "GC")) / sum(seqlengths(Scerevisiae))

## ---- echo=FALSE---------------------------------------------------------
sessionInfo()

