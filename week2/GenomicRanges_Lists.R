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

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

