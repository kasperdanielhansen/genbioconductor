## ----dependencies, warning=FALSE, message=FALSE--------------------------
library(ALL)
library(GenomicRanges)

## ----biocLite, eval=FALSE------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite(c("ALL" "GenomicRanges"))

## ----lm------------------------------------------------------------------
df <- data.frame(y = rnorm(10), x = rnorm(10))
lm.object <- lm(y ~ x, data = df)
lm.object
names(lm.object)
class(lm.object)

## ----lm2-----------------------------------------------------------------
xx <- list(a = letters[1:3], b = rnorm(3))
xx
class(xx) <- "lm"
xx

## ----ALL-----------------------------------------------------------------
library(ALL)
data(ALL)
ALL
class(ALL)
isS4(ALL)

## ----help, eval=FALSE----------------------------------------------------
## ?"ExpressionSet-class"
## class?ExpressionSet

## ----list----------------------------------------------------------------
xx <- list(a = 1:3)

## ----ExpressionSet-------------------------------------------------------
ExpressionSet()

## ----help2,eval=FALSE----------------------------------------------------
## ?ExpressionSet

## ----newExpressionSet----------------------------------------------------
new("ExpressionSet")

## ----getClass------------------------------------------------------------
getClass("ExpressionSet")

## ----slots---------------------------------------------------------------
ALL@annotation
slot(ALL, "annotation")

## ----accessor------------------------------------------------------------
annotation(ALL)

## ----updateObject, eval=FALSE--------------------------------------------
## new_object <- updateObject(old_object)

## ----updateObject2, eval=FALSE-------------------------------------------
## object <- updateObject(object)

## ----validity------------------------------------------------------------
validObject(ALL)

## ----mimicMethod---------------------------------------------------------
mimicMethod <- function(x) {
    if (is(x, "matrix"))
        method1(x)
    if (is(x, "data.frame"))
        method2(x)
    if (is(x, "IRanges"))
        method3(x)
}

## ----as.data.frame-------------------------------------------------------
as.data.frame

## ----showMethods---------------------------------------------------------
showMethods("as.data.frame")

## ----getMethod-----------------------------------------------------------
getMethod("as.data.frame", "DataFrame")

## ----base_as.data.frame--------------------------------------------------
base::as.data.frame

## ----helpMethod,eval=FALSE-----------------------------------------------
## method?as.data.frame,DataFrame
## ?"as.data.frame-method,DataFrame"

## ----findOverlaps--------------------------------------------------------
showMethods("findOverlaps")

## ----ignore.strand-------------------------------------------------------
getMethod("findOverlaps", signature(query = "Ranges", subject = "Ranges"))
getMethod("findOverlaps", signature(query = "GenomicRanges", subject = "GenomicRanges"))

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

