## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(limma)
library(leukemiasEset)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("limma", "leukemiasEset"))

## ----load----------------------------------------------------------------
library(leukemiasEset)
data(leukemiasEset)
leukemiasEset
table(leukemiasEset$LeukemiaType)

## ----subset--------------------------------------------------------------
ourData <- leukemiasEset[, leukemiasEset$LeukemiaType %in% c("ALL", "NoL")]
ourData$LeukemiaType <- factor(ourData$LeukemiaType)

## ----limma---------------------------------------------------------------
design <- model.matrix(~ ourData$LeukemiaType)
fit <- lmFit(ourData, design)
fit <- eBayes(fit)
topTable(fit)

## ----level---------------------------------------------------------------
ourData$LeukemiaType

## ----FCbyHand------------------------------------------------------------
topTable(fit, n = 1)
genename <- rownames(topTable(fit, n=1))
typeMean <- tapply(exprs(ourData)[genename,], ourData$LeukemiaType, mean)
typeMean
typeMean["NoL"] - typeMean["ALL"]

## ----design2-------------------------------------------------------------
design <- model.matrix(~ ourData$LeukemiaType)

## ----headDesign----------------------------------------------------------
head(design)

## ----design3-------------------------------------------------------------
design2 <- model.matrix(~ ourData$LeukemiaType - 1)
head(design2)
colnames(design2) <- c("ALL", "NoL")

## ----design4-------------------------------------------------------------
fit2 <- lmFit(ourData, design2)
contrast.matrix <- makeContrasts("ALL-NoL", levels = design2)
contrast.matrix

## ----cont.fit------------------------------------------------------------
fit2C <- contrasts.fit(fit2, contrast.matrix)
fit2C <- eBayes(fit2C)
topTable(fit2C)

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

