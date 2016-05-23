## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(SummarizedExperiment)
library(GenomicRanges)
library(airway)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("SummarizedExperiment", "GenomicRanges", "airway"))

## ----airway--------------------------------------------------------------
library(airway)
data(airway)
airway

## ----colData-------------------------------------------------------------
colData(airway)

## ----getColumn-----------------------------------------------------------
airway$cell

## ----exptData------------------------------------------------------------
metadata(airway)

## ----names---------------------------------------------------------------
colnames(airway)
head(rownames(airway))

## ----assay---------------------------------------------------------------
airway
assayNames(airway)
assays(airway)
head(assay(airway, "counts"))

## ----rowRanges-----------------------------------------------------------
length(rowRanges(airway))
dim(airway)
rowRanges(airway)

## ----numberOfExons-------------------------------------------------------
length(rowRanges(airway))
sum(elementLengths(rowRanges(airway)))

## ----start---------------------------------------------------------------
start(rowRanges(airway))
start(airway)

## ----subsetByOverlaps----------------------------------------------------
gr <- GRanges(seqnames = "1", ranges = IRanges(start = 1, end = 10^7))
subsetByOverlaps(airway, gr)

## ----back, child="back.Rmd", echo=FALSE----------------------------------

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()


