## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(IRanges)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("IRanges"))

## ----iranges1------------------------------------------------------------
ir1 <- IRanges(start = c(1,3,5), end = c(3,5,7))
ir1
ir2 <- IRanges(start = c(1,3,5), width = 3)
all.equal(ir1, ir2)

## ----ir_width------------------------------------------------------------
start(ir1)
width(ir2) <- 1
ir2

## ----ir_names------------------------------------------------------------
names(ir1) <- paste("A", 1:3, sep = "")
ir1

## ----ir_dim--------------------------------------------------------------
dim(ir1)
length(ir1)

## ----ir_subset-----------------------------------------------------------
ir1[1]
ir1["A1"]

## ----concatenate---------------------------------------------------------
c(ir1, ir2)

## ----irNormal1, echo=FALSE-----------------------------------------------
ir <- IRanges(start = c(1,3,7,9), end = c(4,4,8,10))

## ----irNormal2, echo=FALSE, fig.height=2, small.mar=TRUE-----------------
plotRanges(ir)

## ----irNormal3, echo=FALSE, fig.height=1.75, small.mar=TRUE--------------
plotRanges(reduce(ir))

## ----irNormal4-----------------------------------------------------------
ir
reduce(ir)

## ----irDisjoin1, eval=FALSE----------------------------------------------
## disjoin(ir1)

## ----irDisjoin2, echo=FALSE, fig.height=2, small.mar=TRUE----------------
plotRanges(ir)

## ----irDisjoin3, echo=FALSE, fig.height=1.75, small.mar=TRUE-------------
plotRanges(disjoin(ir))

## ----ir_resize-----------------------------------------------------------
resize(ir, width = 1, fix = "start")
resize(ir, width = 1, fix = "center")

## ----ir_sets-------------------------------------------------------------
ir1 <- IRanges(start = c(1, 3, 5), width = 1)
ir2 <- IRanges(start = c(4, 5, 6), width = 1)
union(ir1, ir2)
intersect(ir1, ir2)

## ----union2--------------------------------------------------------------
reduce(c(ir1, ir2))

## ----findOverlaps--------------------------------------------------------
ir1 <- IRanges(start = c(1,4,8), end = c(3,7,10))
ir2 <- IRanges(start = c(3,4), width = 3)
ov <- findOverlaps(ir1, ir2)
ov

## ----findOverlaps_ill----------------------------------------------------
intersect(ir1[subjectHits(ov)[1]],
          ir2[queryHits(ov)[2]])

## ----subjectHits---------------------------------------------------------
queryHits(ov)
unique(queryHits(ov))

## ----argsFindOverlaps, tidy=TRUE-----------------------------------------
args(findOverlaps)

## ----countOverlaps-------------------------------------------------------
countOverlaps(ir1, ir2)

## ----nearest-------------------------------------------------------------
ir1
ir2
nearest(ir1, ir2)

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

