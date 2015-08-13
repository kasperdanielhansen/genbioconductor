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

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

