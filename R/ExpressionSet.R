## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(Biobase)
library(ALL)
library(hgu95av2.db)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("Biobase", "ALL", "hgu95av2.db"))

## ----ALL-----------------------------------------------------------------
library(ALL)
data(ALL)
ALL

## ----help, eval=FALSE----------------------------------------------------
## ?ALL

## ----experimentData------------------------------------------------------
experimentData(ALL)

## ----exprs---------------------------------------------------------------
exprs(ALL)[1:4, 1:4]

## ----names---------------------------------------------------------------
head(sampleNames(ALL))
head(featureNames(ALL))

## ----pData---------------------------------------------------------------
head(pData(ALL))

## ----dollar--------------------------------------------------------------
head(pData(ALL)$sex)
head(ALL$sex)

## ----subset--------------------------------------------------------------
ALL[,1:5]
ALL[1:10,]
ALL[1:10,1:5]

## ----subset2-------------------------------------------------------------
ALL[, c(3,2,1)]
ALL$sex[c(1,2,3)]
ALL[, c(3,2,1)]$sex

## ----featureData---------------------------------------------------------
featureData(ALL)

## ----annotation----------------------------------------------------------
ids <- featureNames(ALL)[1:5]
ids

## ----annotation2---------------------------------------------------------
library(hgu95av2.db)
as.list(hgu95av2ENTREZID[ids])

## ----varLabels-----------------------------------------------------------
pD <- phenoData(ALL)
varLabels(pD)

## ----varLabels2----------------------------------------------------------
varLabels(pD)[2] <- "Age at diagnosis"
pD
colnames(pD)[1:3]
varLabels(pD)[1:3]

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

