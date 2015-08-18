## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(GEOquery)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("GEOquery"))

## ----getData-------------------------------------------------------------
eList <- getGEO("GSE11675")
class(eList)
length(eList)
names(eList)
eData <- eList[[1]]
eData

## ----pData---------------------------------------------------------------
names(pData(eData))

## ----getGEOsupp----------------------------------------------------------
eList2 <- getGEOSuppFiles("GSE11675")
eList2
tarArchive <- rownames(eList2)[1]
tarArchive

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

