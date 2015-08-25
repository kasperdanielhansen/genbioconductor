## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(GenomicRanges)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("GenomicRanges"))

## ----GRanges-------------------------------------------------------------
gr <- GRanges(seqnames = "chr1", strand = c("+", "-", "+"),
              ranges = IRanges(start = c(1,3,5), width = 3))
              

## ----flank---------------------------------------------------------------
flank(gr, 2, start = FALSE)

## ----seqinfo-------------------------------------------------------------
seqinfo(gr)
seqlengths(gr) <- c("chr1" = 10)
seqinfo(gr)
seqlevels(gr)
seqlengths(gr)

## ----gaps----------------------------------------------------------------
gaps(gr)

## ----gr2-----------------------------------------------------------------
seqlevels(gr) <- c("chr1", "chr2")
seqnames(gr) <- c("chr1", "chr2", "chr1")

## ----sort----------------------------------------------------------------
sort(gr)
seqlevels(gr) <- c("chr2", "chr1")
sort(gr)

## ----genome--------------------------------------------------------------
genome(gr) <- "hg19"
gr

## ----gr-error, error=TRUE------------------------------------------------
gr2 <- gr
genome(gr2) <- "hg18"
findOverlaps(gr, gr2)

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

