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

## ------------------------------------------------------------------------
gr <- GRanges(seqnames = "chr1", strand = c("+", "-", "+"),
              ranges = IRanges(start = c(1,3,5), width = 3))
              

## ------------------------------------------------------------------------
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
gr2 <- GRanges(seqnames = c("chr1", "chr2", "chr1"), strand = "*",
               ranges = IRanges(start = c(1, 3, 5), width = 3))
gr2
sort(gr2)
seqlevels(gr2)
seqlevels(gr2) <- c("chr2", "chr1")
sort(gr2)

## ----seqlevelsForce------------------------------------------------------
seqlevels(gr2, force = TRUE) <- "chr1"
gr2

## ----genome--------------------------------------------------------------
genome(gr) <- "hg19"
genome(gr2) <- "hg18"

## ----gr-error, error=TRUE------------------------------------------------
findOverlaps(gr, gr2)

## ------------------------------------------------------------------------
values(gr) <- DataFrame(score = c(0.1, 0.5, 0.3))
gr
values(gr)

## ----grdollar------------------------------------------------------------
gr$score
gr$score2 = gr$score * 0.2
gr

## ----DataFrame-----------------------------------------------------------
ir <- IRanges(start = 1:2, width = 3)
df1 <- DataFrame(iranges = ir)
df1
df1$iranges
df2 <- data.frame(iranges = ir)
df2

## ----findOverlaps_setup--------------------------------------------------
gr
genome(gr2) <- "hg19"
gr2

## ----findOverlaps--------------------------------------------------------
findOverlaps(gr, gr2)

## ----usecaseI, eval=FALSE------------------------------------------------
## findOverlaps(snps, TF)

## ----usecaseII, eval=FALSE-----------------------------------------------
## big_islands <- resize(islands, width = 20000 + width(islands), fix = "center")
## findOverlaps(dmrs, big_islands)

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

