## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(minfi)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("minfi"))

## ------------------------------------------------------------------------
library(GEOquery)
## getGEOSuppFiles("GSE68777")
## untar("GSE68777/GSE68777_RAW.tar", exdir = "GSE68777/idat")
head(list.files("GSE68777/idat", pattern = "idat"))

## ----decompress----------------------------------------------------------
idatFiles <- list.files("GSE68777/idat", pattern = "idat.gz$", full = TRUE)
## sapply(idatFiles, gunzip)

## ----readExp-------------------------------------------------------------
rgSet <- read.450k.exp("GSE68777/idat")
rgSet
pData(rgSet)
head(sampleNames(rgSet))

## ----geoPheno------------------------------------------------------------
geoMat <- getGEO("GSE68777")
pD.all <- pData(geoMat[[1]])
pD <- pD.all[, c("title", "geo_accession", "characteristics_ch1.1", "characteristics_ch1.2")]
head(pD)
names(pD)[c(3,4)] <- c("group", "sex")
pD$group <- sub("^diagnosis: ", "", pD$group)
pD$sex <- sub("^Sex: ", "", pD$sex)

## ----merge---------------------------------------------------------------
sampleNames(rgSet) <- sub(".*_5", "5", sampleNames(rgSet))
rownames(pD) <- pD$title
pD <- pD[sampleNames(rgSet),]
pData(rgSet) <- pD
rgSet

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

