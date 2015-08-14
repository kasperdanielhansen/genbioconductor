## ----child="front.Rmd", echo=FALSE---------------------------------------

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

## ----numeric-------------------------------------------------------------
x <- 1:10
names(x) <- letters[1:10]
class(x)
x[1:3]
x[c("a", "b")]

## ----intNum--------------------------------------------------------------
x <- 1
class(x)
x <- 1:3
class(x)

## ----intNum2-------------------------------------------------------------
x <- 1L
class(x)

## ----machine-------------------------------------------------------------
.Machine$integer.max
2^31 -1 == .Machine$integer.max
round(.Machine$integer.max / 10^6, 1)

## ----uNames--------------------------------------------------------------
x <- 1:3
names(x) <- c("A", "A", "B")
x
x["A"]

## ----uNames2-------------------------------------------------------------
anyDuplicated(names(x))
names(x) <- c("A", "B", "C")
anyDuplicated(names(x))

## ----sessionInfo---------------------------------------------------------
sessionInfo()

