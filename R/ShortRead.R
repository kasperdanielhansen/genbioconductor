## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(ShortRead)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("ShortRead"))

## ----fastq1--------------------------------------------------------------
fastqDir <- system.file("extdata", "E-MTAB-1147", package = "ShortRead")
fastqPath <- list.files(fastqDir, pattern = ".fastq.gz$", full = TRUE)[1]
reads <- readFastq(fastqPath)
reads

## ----fastq2--------------------------------------------------------------
fqFile <- FastqFile(fastqPath)
fqFile
reads <- readFastq(fqFile)

## ----accessorFastq-------------------------------------------------------
sread(reads)[1:2]
quality(reads)[1:2]
id(reads)[1:2]

## ----convertQual---------------------------------------------------------
as(quality(reads), "matrix")[1:2,1:10]

## ----back, child="back.Rmd", echo=FALSE----------------------------------

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()


