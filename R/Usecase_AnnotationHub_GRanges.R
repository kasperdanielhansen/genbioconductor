## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(GenomicRanges)
library(rtracklayer)
library(AnnotationHub)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("GenomicRanges", "rtracklayer", "AnnotationHub"))

## ----ahub_species--------------------------------------------------------
ah <- AnnotationHub()
ah <- subset(ah, species == "Homo sapiens")

## ----ahub_histone--------------------------------------------------------
qhs <- query(ah, "H3K4me3")
qhs <- query(qhs, "Gm12878")

## ----ahub_look-----------------------------------------------------------
qhs

## ----ahub_closerlook-----------------------------------------------------
qhs$title
qhs$dataprovider

## ----ahub_twoGR----------------------------------------------------------
gr1 <- subset(qhs, title == "wgEncodeUwHistoneGm12878H3k4me3StdPkRep1.narrowPeak.gz")[[1]]
gr1
gr2 <- subset(qhs, title == "E116-H3K4me3.narrowPeak.gz")[[1]]
gr2

## ----ahub_summary--------------------------------------------------------
summary(width(gr1))
table(width(gr1))
summary(width(gr2))

## ----ahub_refseq---------------------------------------------------------
qhs <- query(ah, "RefSeq")
qhs

## ----ahub_refseq_genome--------------------------------------------------
qhs$genome

## ----ahub_histone_genome-------------------------------------------------
genome(gr1)

## ----ahub_get_refseq-----------------------------------------------------
refseq <- qhs[qhs$genome == "hg19" & qhs$title == "RefSeq Genes"]
refseq
refseq <- refseq[[1]] ## Downloads

## ----refseq--------------------------------------------------------------
refseq

## ----ahub_refseq_name----------------------------------------------------
table(table(refseq$name))

## ----promoters-----------------------------------------------------------
promoters <- promoters(refseq)
table(width(promoters))
args(promoters)

## ----findOverlaps--------------------------------------------------------
ov <- findOverlaps(promoters, gr1)
ov

## ----queryHits-----------------------------------------------------------
length(unique(queryHits(ov))) / length(gr1)

## ----subjectHits---------------------------------------------------------
length(unique(subjectHits(ov))) / length(promoters)

## ----widthPercentage-----------------------------------------------------
sum(width(reduce(gr1))) / 10^6
sum(width(reduce(promoters))) / 10^6

## ----size----------------------------------------------------------------
sum(width(intersect(gr1, promoters))) / 10^6

## ----size2---------------------------------------------------------------
sum(width(intersect(gr1, promoters, ignore.strand = TRUE))) / 10^6

## ----widthPercentage2----------------------------------------------------
sum(width(reduce(promoters))) / 10^6
sum(width(reduce(promoters, ignore.strand = TRUE))) / 10^6

## ----promInOut-----------------------------------------------------------
prom <- reduce(promoters, ignore.strand = TRUE)
peaks <- reduce(gr1)
both <- intersect(prom, peaks)
only.prom <- setdiff(prom, both)
only.peaks <- setdiff(peaks, both)
overlapMat <- matrix(0,, ncol = 2, nrow = 2)
colnames(overlapMat) <- c("in.peaks", "out.peaks")
rownames(overlapMat) <- c("in.promoters", "out.promoter")
overlapMat[1,1] <- sum(width(both))
overlapMat[1,2] <- sum(width(only.prom))
overlapMat[2,1] <- sum(width(only.peaks))
overlapMat[2,2] <- 3*10^9 - sum(overlapMat)
round(overlapMat / 10^6, 2)

## ----oddsratio-----------------------------------------------------------
oddsRatio <- overlapMat[1,1] * overlapMat[2,2] / (overlapMat[2,1] * overlapMat[1,2])
oddsRatio

## ----oddsRatio2----------------------------------------------------------
overlapMat[2,2] <- 1.5*10^9
oddsRatio <- overlapMat[1,1] * overlapMat[2,2] / (overlapMat[2,1] * overlapMat[1,2])
oddsRatio

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

