## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(DESeq2)
library(edgeR)
library(airway)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("DESeq2", "edgeR", "airway"))

## ----data----------------------------------------------------------------
library(airway)
data(airway)
airway
assay(airway, "counts")[1:3, 1:3]
airway$dex

## ----relevel-------------------------------------------------------------
airway$dex <- relevel(airway$dex, "untrt")
airway$dex

## ----granges-------------------------------------------------------------
granges(airway)

## ----edgeRsetup----------------------------------------------------------
library(edgeR)
dge <- DGEList(counts = assay(airway, "counts"),
               group = airway$dex)
dge$samples <- merge(dge$samples,
                     as.data.frame(colData(airway)),
                     by = 0)
dge$genes <- data.frame(name = names(rowRanges(airway)),
                        stringsAsFactors = FALSE)

## ----calcNormFactors-----------------------------------------------------
dge <- calcNormFactors(dge)

## ----disp----------------------------------------------------------------
design <- model.matrix(~dge$samples$group)
dge <- estimateGLMCommonDisp(dge, design)
dge <- estimateGLMTagwiseDisp(dge, design)

## ----edgeRdesign---------------------------------------------------------
fit <- glmFit(dge, design)

## ----glmLRT--------------------------------------------------------------
lrt <- glmLRT(fit, coef = 2)
topTags(lrt)

## ----DESeq2setup---------------------------------------------------------
library(DESeq2)
dds <- DESeqDataSet(airway, design = ~ dex)

## ----deseqfit------------------------------------------------------------
dds <- DESeq(dds)

## ----deseqResults--------------------------------------------------------
res <- results(dds)
res <- res[order(res$padj),]
res[1:10,]

## ----back, child="back.Rmd", echo=FALSE----------------------------------

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()


