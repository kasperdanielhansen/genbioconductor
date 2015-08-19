## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(GenomicRanges)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("GenomicRanges"))

## ----DataFrame-----------------------------------------------------------
ir <- IRanges(start = 1:2, width = 3)
df1 <- DataFrame(iranges = ir)
df1
df1$iranges
df2 <- data.frame(iranges = ir)
df2

## ----GRanges-------------------------------------------------------------
gr <- GRanges(seqnames = "chr1", strand = c("+", "-", "+"),
              ranges = IRanges(start = c(1,3,5), width = 3))
values(gr) <- DataFrame(score = c(0.1, 0.5, 0.3))
gr

## ----grdollar------------------------------------------------------------
gr$score
gr$score2 = gr$score * 0.2
gr

## ----findOverlaps_setup--------------------------------------------------
gr2 <- GRanges(seqnames = c("chr1", "chr2", "chr1"), strand = "*",
               ranges = IRanges(start = c(1, 3, 5), width = 3))
gr2
gr

## ----findOverlaps--------------------------------------------------------
findOverlaps(gr, gr2)

## ----subsetByOverlaps----------------------------------------------------
subsetByOverlaps(gr, gr2)

## ----makeGRangesFromDataFrame--------------------------------------------
df <- data.frame(chr = "chr1", start = 1:3, end = 4:6, score = 7:9)
makeGRangesFromDataFrame(df)
makeGRangesFromDataFrame(df, keep.extra.columns = TRUE)

## ----usecaseI, eval=FALSE------------------------------------------------
## findOverlaps(snps, TF)

## ----usecaseII, eval=FALSE-----------------------------------------------
## big_islands <- resize(islands, width = 20000 + width(islands), fix = "center")
## findOverlaps(dmrs, big_islands)

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

