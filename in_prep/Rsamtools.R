## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(Rsamtools)
library(ShortRead)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("Rsamtools", "ShortRead"))

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

## ----bamPath-------------------------------------------------------------
bamPath <- system.file("extdata", "ex1.bam", package="Rsamtools")
bamFile <- BamFile(bamPath)
bamFile

## ----bamFileInfo---------------------------------------------------------
seqinfo(bamFile)

## ----scanBam-------------------------------------------------------------
aln <- scanBam(bamFile)
length(aln)
class(aln)

## ----lookAtBam-----------------------------------------------------------
aln <- aln[[1]]
names(aln)
lapply(aln, function(xx) xx[1])

## ----yieldSize-----------------------------------------------------------
yieldSize(bamFile) <- 1
open(bamFile)
scanBam(bamFile)[[1]]$seq
scanBam(bamFile)[[1]]$seq
## Cleanup
close(bamFile)
yieldSize(bamFile) <- NA

## ----ScanBamParams-------------------------------------------------------
gr <- GRanges(seqnames = "seq2",
              ranges = IRanges(start = c(100, 1000), end = c(1500,2000)))
params <- ScanBamParam(which = gr, what = scanBamWhat())
aln <- scanBam(bamFile, param = params)
names(aln)
head(aln[[1]]$pos)

## ------------------------------------------------------------------------
quickBamFlagSummary(bamFile)

## ----BamViews------------------------------------------------------------
bamView <- BamViews(bamPath)
aln <- scanBam(bamView)
names(aln)

## ----BamViews2-----------------------------------------------------------
bamRanges(bamView) <- gr
aln <- scanBam(bamView)
names(aln)
names(aln[[1]])

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

