## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(oligo)
library(GEOquery)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("oligo", "GEOquery))

## ----getData-------------------------------------------------------------
library(GEOquery)
getGEOSuppFiles("GSE38792")
list.files("GSE38792")
untar("GSE38792/GSE38792_RAW.tar", exdir = "GSE38792/CEL")
list.files("GSE38792/CEL")

## ----readData, message=FALSE---------------------------------------------
library(oligo)
celfiles <- list.files("GSE38792/CEL", full = TRUE)
rawData <- read.celfiles(celfiles)

## ----show----------------------------------------------------------------
rawData

## ----getClass------------------------------------------------------------
getClass("GeneFeatureSet")

## ----rawPeak-------------------------------------------------------------
exprs(rawData)[1:4,1:3]

## ----maxExpr-------------------------------------------------------------
max(exprs(rawData))

## ----pData---------------------------------------------------------------
filename <- sampleNames(rawData)
pData(rawData)$filename <- filename
sampleNames <- sub(".*_", "", filename)
sampleNames <- sub(".CEL.gz$", "", sampleNames)
sampleNames(rawData) <- sampleNames
pData(rawData)$group <- ifelse(grepl("^OSA", sampleNames(rawData)),
                               "OSA", "Control")
pData(rawData)

## ----rawBox, plot=TRUE---------------------------------------------------
boxplot(rawData)

## ----rma-----------------------------------------------------------------
normData <- rma(rawData)
normData

## ----normBox, plot=TRUE--------------------------------------------------
boxplot(normData)

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

