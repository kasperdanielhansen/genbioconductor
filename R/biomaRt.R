## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(biomaRt)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("biomaRt"))

## ----listMarts-----------------------------------------------------------
head(listMarts())
mart <- useMart("ensembl")
mart
head(listDatasets(mart))
ensembl <- useDataset("hsapiens_gene_ensembl", mart)
ensembl

## ----getBMex-------------------------------------------------------------
values <- c("202763_at","209310_s_at","207500_at")
getBM(attributes = c("ensembl_gene_id", "affy_hg_u133_plus_2"),
      filters = "affy_hg_u133_plus_2", values = values, mart = ensembl)

## ----listAttributes------------------------------------------------------
attributes <- listAttributes(ensembl)
head(attributes)
nrow(attributes)
filters <- listFilters(ensembl)
head(filters)
nrow(filters)

## ----listPages-----------------------------------------------------------
attributePages(ensembl)
attributes <- listAttributes(ensembl, page = "feature_page")
head(attributes)
nrow(attributes)

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

