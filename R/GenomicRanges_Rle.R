## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(GenomicRanges)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("GenomicRanges"))

## ----RleEx1--------------------------------------------------------------
rl <- Rle(c(1,1,1,1,2,2,3,3,2,2))
rl
runLength(rl)
runValue(rl)
as.numeric(rl)

## ----aggregate-----------------------------------------------------------
ir <- IRanges(start = c(2,6), width = 2)
aggregate(rl, ir, FUN = mean)

## ----coverage------------------------------------------------------------
ir <- IRanges(start = 1:10, width = 3)
rl <- coverage(ir)
rl

## ----slice---------------------------------------------------------------
slice(rl, 2)

## ----views---------------------------------------------------------------
vi <- Views(rl, start = c(3,7), width = 3)
vi

## ----viewsMean-----------------------------------------------------------
mean(vi)

## ----GRanges-------------------------------------------------------------
gr <- GRanges(seqnames = "chr1", ranges = IRanges(start = 1:10, width = 3))
rl <- coverage(gr)
rl

## ----RleGRangesSubset1---------------------------------------------------
grView <- GRanges("chr1", ranges = IRanges(start = c(2,5), end = c(3,6)))

## ----RleGRangesSubset2---------------------------------------------------
rl[grView]

## ----GRangesViews, error=TRUE--------------------------------------------
grView <- GRanges("chr1", ranges = IRanges(start = 2, end = 7))
vi <- Views(rl, grView)

## ----GRangesViews2-------------------------------------------------------
vi <- Views(rl, as(grView, "RangesList"))
vi
vi[[1]]

## ----usecase, eval=FALSE-------------------------------------------------
## bases <- reduce(exons)
## nBases <- sum(width(bases))
## nCoverage <- sum(Views(coverage(reads), bases))
## nCoverage / nBases

## ----back, child="back.Rmd", echo=FALSE----------------------------------

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()


