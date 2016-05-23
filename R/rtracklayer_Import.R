## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(rtracklayer)
library(AnnotationHub)
library(Rsamtools)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("rtracklayer", "AnnotationHub", "Rsamtools"))

## ----help, eval=FALSE----------------------------------------------------
## ?import
## ?BigWigFile

## ----ahub----------------------------------------------------------------
library(AnnotationHub)
ahub <- AnnotationHub()
table(ahub$rdataclass)

## ----granges-------------------------------------------------------------
ahub.gr <- subset(ahub, rdataclass == "GRanges" & species == "Homo sapiens")
gr <- ahub.gr[[1]]
gr
seqinfo(gr)

## ----BigWig--------------------------------------------------------------
ahub.bw <- subset(ahub, rdataclass == "BigWigFile" & species == "Homo sapiens")
ahub.bw
bw <- ahub.bw[[1]]
bw

## ----importBigWig--------------------------------------------------------
gr1 <- gr[1:3]
out.gr <- import(bw, which = gr1)
out.gr

## ----importBigWig2-------------------------------------------------------
out.rle <- import(bw, which = gr1, as = "Rle")
out.rle

## ----importBigWig3-------------------------------------------------------
gr.chr22 <- GRanges(seqnames = "chr22",
                    ranges = IRanges(start = 1, end = seqlengths(gr)["chr22"]))
out.chr22 <- import(bw, which = gr.chr22, as = "Rle")
out.chr22[["chr22"]]

## ----liftOver------------------------------------------------------------
ahub.chain <- subset(ahub, rdataclass == "ChainFile" & species == "Homo sapiens")
query(ahub.chain, c("hg18", "hg19"))
chain <- ahub.chain[ahub.chain$title == "hg19ToHg18.over.chain.gz"]
chain <- chain[[1]]
gr.hg18 <- liftOver(gr, chain)
gr.hg18

## ----liftOver2-----------------------------------------------------------
table(elementLengths(gr.hg18))

## ----tabixIndex----------------------------------------------------------
library(Rsamtools)
from <- system.file("extdata", "ex1.sam", package="Rsamtools",
                    mustWork=TRUE)
from
to <- tempfile()
zipped <- bgzip(from, to)
idx <- indexTabix(zipped, "sam")

## ----back, child="back.Rmd", echo=FALSE----------------------------------

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()


