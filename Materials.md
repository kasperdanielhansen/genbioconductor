---
title: Introduction to Bioconductor
author: Kasper D. Hansen
---

# Materials

## Overview of the class

- **What is Bioconductor**  
([Video](../../../Google\ Drive\Kasper\'s\ Videos\Preview\What_is_Bioconductor.mp4) |
[Slides](https://docs.google.com/presentation/d/1rPKLk9tTfoLkRl-PyaboJ4wHTsLhmm2ukBRxOmJg4Kk/edit?usp=sharing))
- FIXME: make video discussing the content of the class

## Getting started with R/Bioconductor.

### Pre-requisite: Installing software

In this class we are using the following software

- R version 3.2.1 (available from [CRAN](https://cran.r-project.org/)).
- RStudio version 0.99.467 (available from [RStudio](https://www.rstudio.org)).
- Bioconductor version 3.1.

For help installing R and RStudio, see these videos from Roger Peng

- **Install R on Windows**  
([Youtube](https://youtu.be/Ohnk9hcxf9M))
- **Install R on Mac**  
([Youtube](https://youtu.be/uxuuWXU-7UQ))
- **Install RStudio on Mac**  
[Youtube](https://youtu.be/bM7Sfz-LADM)

Installing Bioconductor

- FIXME: make video and script on Bioc installation


### Online Resources

- **The Bioconductor website**  
([Video](../../../Dropbox/genbioconductor/week1/Bioconductor_Website.mp4))
- **Useful online help**  
([Video](../../../Dropbox/genbioconductor/week1/OnlineResources.mp4))






- The Bioconductor website (packages / workflows / howtos / vignettes / NEWS). 
- The Bioconductor support site.
- An Introduction to R.
- [R Documentation](http://www.rdocumentation.org/)
- [R Seek](http://rseek.org)
- [Stack Overflow (R)](http://stackoverflow.com/questions/tagged/r)
- [Stack Overflow (Bioconductor)](http://stackoverflow.com/questions/tagged/bioconductor)

FIXME: make cheat sheet with online resources


### R essentials

- Basics of R data structures: vectors, lists, matrices, data.frame.  Subsetting.
- Pointers to introduction to R.
- **R Overview** FIXME: make video and script  
([HTML](R_Overview.html) |
[R code](R_Overview.R) |
[Source](R_Overview.Rmd))

## Module 2: Basic usage of GRanges and AnnotationHub

- **GRanges - Overview Lecture**  
([Video](../../../Google\ Drive\Kasper\'s\ Videos\Preview\Granges_Overview.mp4). |
[Slides](https://docs.google.com/presentation/d/1ETjUipnle-Ps7k8gFGvJIXJ85D_Vjs9qNxNk2KeeaAI/edit?usp=sharing))
- **IRanges - Basic Usage**  
([Video](../../../Dropbox/genbioconductor/week1/IRanges_Basic.mp4) |
[HTML](IRanges_Basic.html) |
[R code](IRanges_Basic.R) |
[Source](IRanges_Basic.Rmd))
- **GenomicRanges - GRanges**  
([Video](../../../Dropbox/genbioconductor/week1/GenomicRanges_GRanges.mp4) |
[HTML](GenomicRanges_GRanges.html) |
[R code](GenomicRanges_GRanges.R) |
[Source](GenomicRanges_GRanges.Rmd))
- **GenomicRanges - Basic GRanges Usage**  
([Video](../../../Dropbox/genbioconductor/week1/GenomicRanges_GRanges_Usage.mp4) |
[HTML](GenomicRanges_GRanges_Usage.html) |
[R code](GenomicRanges_GRanges_Usage.R) |
[Source](GenomicRanges_GRanges_Usage.Rmd))
- **AnnotationHub - Basic Usage**  
([Video](../../../Dropbox/genbioconductor/week1/AnnotationHub.mp4) |
[HTML](AnnotationHub.html) |
[R code](AnnotationHub.R) |
[Source](AnnotationHub.Rmd))
- **Usecase - AnnotationHub and GRanges** FIXME: make video  
([HTML](Usecase_AnnotationHub_GRanges.html) |
[R code](Usecase_AnnotationHub_GRanges.R) |
[Source](Usecase_AnnotationHub_GRanges.Rmd))
- FIXME: make video and script for GenomeInfoDb

## Data containers

- **Basic Data Types**  
([Video](../../../Google\ Drive\Kasper\'s\ Videos\Preview\Basic_Data_Types.mp) |
[Slides](https://docs.google.com/presentation/d/1GidGTxreaffyutdpy4vKcmKdWc-z1KYsWbxihTorI_8/edit?usp=sharing))
- **Overview of ExpressionSet**  
([Video](../../../Google\ Drive\Kasper\'s\ Videos\Preview\ExpressionSet_Overview.mp4) |
[Slides](https://docs.google.com/presentation/d/1ouDEq37R5ReiuLgfSm7c3lexceIovy5IUac9jfYX1L8/edit?usp=sharing))
- **Annotation Overview**  
([Video](../../../Google\ Drive\Kasper\'s\ Videos\Preview\Annotation_Overview.mp4) |
[Slides](https://docs.google.com/presentation/d/14-uvs23suNXr8-xZRDcreo_Ws01VKCLCUy-q99Gf_hc/edit?usp=sharing))
- **ExpressionSet**  
([HTML](ExpressionSet.html) |
[R code](ExpressionSet.R) |
[Source](ExpressionSet.Rmd))
- **SummarizedExperiment**  
([HTML](SummarizedExperiment.html) |
[R code](SummarizedExperiment.R) |
[Source](SummarizedExperiment.Rmd))
- FIXME: make Rmd file for GEOquery

## Core Bioconductor packages

- **Biostrings, Basic Usage**  
([HTML](Biostrings_Basic.html) |
[R code](Biostrings_Basic.R) |
[Source](Biostrings_Basic.Rmd))
- **Biostrings, Intermediate Usage**  
([HTML](Biostrings_Intermediate.html) |
[R code](Biostrings_Intermediate.R) |
[Source](Biostrings_Intermediate.Rmd))
- **GenomicRanges, Rle**  
([HTML](GenomicRanges_Rle.html) |
[R code](GenomicRanges_Rle.R) |
[Source](GenomicRanges_Rle.Rmd))
- **GenomicRanges,Lists**  
([HTML](GenomicRanges_Lists.html) |
[R code](GenomicRanges_Lists.R) |
[Source](GenomicRanges_Lists.Rmd))
- FIXME: make Rmd file for rtracklayer: import data  
- FIXME: make Rmd file for rtracklayer: interface with browser  
- FIXME: make Rmd file for GenomicFeatures

## R programming

- FIXME: make Rmd file for S4 classes and methods

## Useful skills

- Writing R scripts
- Quick introduction to RMarkdown and reproducible research.
- Some mention of version control system.

FIXME: video and/or text presenting useful skills. Perhaps move to week 2



# Notes

## Other stuff

Core

- Rsamtools / ShortRead
- GenomicAlignments
- GenomicFiles
- BiocParallel
- VariantAnnotation

Annotation

- biomaRt
- SNP pckages
- GWAS package

Visualization

- Gviz
- ggbio

Analysis

- limma
- DEseq / edgeR
- genefilter
- DNAcopy
- sva

Other

- Rsubread / Rbowtie
- RBGL / graph / Rgraphviz
- preprocessCore
- oligo
- GOstats
- EBImage


Application areas

- gene expression analysis with microarrays
- gene expression analysis with sequencing
- microarray annotation packages


