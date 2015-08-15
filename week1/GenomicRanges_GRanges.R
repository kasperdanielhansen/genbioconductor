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

