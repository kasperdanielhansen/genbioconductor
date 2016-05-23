## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(GenomicRanges)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("GenomicRanges"))

## ----CreateGrangesList---------------------------------------------------
gr1 <- GRanges(seqnames = "chr1", ranges = IRanges(start = 1:4, width = 3))
gr2 <- GRanges(seqnames = "chr2", ranges = IRanges(start = 1:4, width = 3))
gL <- GRangesList(gr1 = gr1, gr2 = gr2)
gL

## ----GRangesAccess-------------------------------------------------------
start(gL)
seqnames(gL)

## ----elementLengths------------------------------------------------------
elementLengths(gL)

## ----endoapply-----------------------------------------------------------
shift(gL, 10)

## ----findOverlaps--------------------------------------------------------
findOverlaps(gL, gr2)

## ----back, child="back.Rmd", echo=FALSE----------------------------------

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()


