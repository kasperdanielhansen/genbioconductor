---
title: Introduction to Bioconductor
author: Kasper D. Hansen
---

# Materials

## Overview of the class

- **What is Bioconductor** (7:18)  
([Video](dropbox/Drive/BiocIntro_What_is_Bioconductor_version1.mp4) |
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
([Youtube](https://youtu.be/bM7Sfz-LADM))

Installing Bioconductor

- **Installing Bioconductor** (3:39)  
([Video](dropbox/Videos/BiocIntro_Installing_Bioconductor_version1.mp4) |
[HTML](week1/Install_Bioconductor.html) |
[Source](week1/Install_Bioconductor.Rmd))


### Online Resources

- **The Bioconductor website** (9:56)  
([Video](dropbox/Videos/BiocIntro_Bioconductor_Website_version1.mp4))
- **Useful online help** (5:08)  
([Video](dropbox/Videos/BiocIntro_OnlineResources_version1.mp4))
- **Some links** (from the two videos above)  
([HTML](week1/Online_Resources.html) |
[Source](week1/Online_Resources.Rmd))

### R essentials

- Link to Roger's R course
- **An Introduction to R** (ships with R)  
([HTML](https://cran.r-project.org/doc/manuals/r-release/R-intro.html) |
[PDF](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf))
- **R Base Types** (18:11)  
([Video](dropbox/Videos/BiocIntro_R_Base_Types_version1.mp4) |
[HTML](week1/R_Base_Types.html) |
[R code](week1/R_base_Types.R) |
[Source](week1/R_Base_Types.Rmd))


(44 minutes)

## Basic usage of GRanges and AnnotationHub

- **GRanges - Overview Lecture** (4:42)  
([Video](dropbox/Drive/BiocIntro_Granges_Overview_version1.mp4) |
[Slides](https://docs.google.com/presentation/d/1ETjUipnle-Ps7k8gFGvJIXJ85D_Vjs9qNxNk2KeeaAI/edit?usp=sharing))
- **IRanges - Basic Usage** (12:12)  
([Video](dropbox/Videos/BiocIntro_IRanges_Basic_version1.mp4) |
[HTML](week1/IRanges_Basic.html) |
[R code](week1/IRanges_Basic.R) |
[Source](week1/IRanges_Basic.Rmd))
- **GenomicRanges - GRanges** (8:44)  
([Video](dropbox/Videos/BiocIntro_GenomicRanges_GRanges_version1.mp4) |
[HTML](week1/GenomicRanges_GRanges.html) |
[R code](week1/GenomicRanges_GRanges.R) |
[Source](week1/GenomicRanges_GRanges.Rmd))
- **GenomicRanges - Basic GRanges Usage** (8:14)  
([Video](dropbox/Videos/BiocIntro_GenomicRanges_GRanges_Usage_version1.mp4) |
[HTML](week1/GenomicRanges_GRanges_Usage.html) |
[R code](week1/GenomicRanges_GRanges_Usage.R) |
[Source](week1/GenomicRanges_GRanges_Usage.Rmd))
- **GenomicRanges - seqinfo** (6:13)  
([Video](dropbox/Videos/BiocIntro_GenomicRanges_seqinfo_version1.mp4) |
[HTML](week1/GenomicRanges_seqinfo.html) |
[R code](week1/GenomicRanges_seqinfo.R) |
[Source](week1/GenomicRanges_seqinfo.Rmd))
- **AnnotationHub - Basic Usage** (8:23)  
([Video](dropbox/Videos/BiocIntro_AnnotationHub_version1.mp4) |
[HTML](week1/AnnotationHub.html) |
[R code](week1/AnnotationHub.R) |
[Source](week1/AnnotationHub.Rmd))
- **Usecase - AnnotationHub and GRanges** (12:56) + (13:46)  
([Video (part 1)](dropbox/Videos/BiocIntro_Usecase_AnnotationHub_GRanges_Part1_version1.mp4) |
[Video (part 2)](dropbox/Videos/BiocIntro_Usecase_AnnotationHub_GRanges_Part2_version1.mp4) |
[HTML](week1/Usecase_AnnotationHub_GRanges.html) |
[R code](week1/Usecase_AnnotationHub_GRanges.R) |
[Source](week1/Usecase_AnnotationHub_GRanges.Rmd))

(75 minutes)

## Data containers

- **Basic Data Types** (4:59)  
([Video](dropbox/Drive/BiocIntro_Basic_Data_Types.mp) |
[Slides](https://docs.google.com/presentation/d/1GidGTxreaffyutdpy4vKcmKdWc-z1KYsWbxihTorI_8/edit?usp=sharing))
- **Overview of ExpressionSet** (4:19)  
([Video](dropbox/Drive/BiocIntro_ExpressionSet_Overview_version1.mp4) |
[Slides](https://docs.google.com/presentation/d/1ouDEq37R5ReiuLgfSm7c3lexceIovy5IUac9jfYX1L8/edit?usp=sharing))
- **Annotation Overview** (4:33)  
([Video](dropbox/Drive/BiocIntro_Annotation_Overview_version1.mp4) |
[Slides](https://docs.google.com/presentation/d/14-uvs23suNXr8-xZRDcreo_Ws01VKCLCUy-q99Gf_hc/edit?usp=sharing))
- **ExpressionSet** (9:50)  
([Video](dropbox/Videos/BiocIntro_ExpressionSet_version1.mp4) |
[HTML](week2/ExpressionSet.html) |
[R code](week2/ExpressionSet.R) |
[Source](week2/ExpressionSet.Rmd))
- **SummarizedExperiment** (7:44)  
([Video](dropbox/Videos/BiocIntro_SummarizedExperiment_version1.mp4) |
[HTML](week2/SummarizedExperiment.html) |
[R code](week2/SummarizedExperiment.R) |
[Source](week2/SummarizedExperiment.Rmd))
- **GEOquery** (6:34)  
([Video](dropbox/Videos/BiocIntro_GEOquery_version1.mp4) |
[HTML](week2/GEOquery.html) |
[R code](week2/GEOquery.R) |
[Source](week2/GEOquery.Rmd))

(38 minutes)

## Core Bioconductor packages

- **Biostrings** (7:04)  
([Video](dropbox/Videos/BiocIntro_Biostrings_version1.mp4) |
[HTML](week2/Biostrings.html) |
[R code](week2/Biostrings.R) |
[Source](week2/Biostrings.Rmd))
- **BSgenome** (6:35)  
([Video](dropbox/Videos/BiocIntro_BSgenome_version1.mp4) |
[HTML](week2/BSgenome.html) |
[R code](week2/BSgenome.R) |
[Source](week2/BSgenome.Rmd))
- **Biostrings - Matching** (6:18)  
([Video](dropbox/Videos/BiocIntro_Biostrings_Matching_version1.mp4) |
[HTML](week2/Biostrings_Matching.html) |
[R code](week2/Biostrings_Matching.R) |
[Source](week2/Biostrings_Matching.Rmd))
- **BSgenome - Views** (9:21)  
([Video](dropbox/Videos/BiocIntro_BSgenome_Views_version1.mp4) |
[HTML](week2/BSgenome_Views.html) |
[R code](week2/BSgenome_Views.R) |
[Source](week2/BSgenome_Views.Rmd))
- **GenomicRanges - Rle** (12:01)  
([Video](dropbox/Videos/BiocIntro_GenomicRanges_Rle_version1.mp4) |
[HTML](week2/GenomicRanges_Rle.html) |
[R code](week2/GenomicRanges_Rle.R) |
[Source](week2/GenomicRanges_Rle.Rmd))
- **GenomicRanges - Lists** (8:02)  
([Video](dropbox/Videos/BiocIntro_GenomicRanges_Lists_version1.mp4) |
[HTML](week2/GenomicRanges_Lists.html) |
[R code](week2/GenomicRanges_Lists.R) |
[Source](week2/GenomicRanges_Lists.Rmd))
- **GenomicFeatures** (18:30)  
([Video](dropbox/Videos/BiocIntro_GenomicFeatures_version1.mp4) |
[HTML](week2/GenomicFeatures.html) |
[R code](week2/GenomicFeatures.R) |
[Source](week2/GenomicFeatures.Rmd))
- **rtracklayer - Data Import** (14:44)  
([Video](dropbox/Videos/BiocIntro_rtracklayer_Import_version1.mp4) |
[HTML](week2/rtracklayer_Import.html) |
[R code](week2/rtracklayer_Import.R) |
[Source](week2/rtracklayer_Import.Rmd))

(82 minutes)

## R programming

- **S4 objects and methods** FIXME: make video  
([HTML](week2/R_S4.html) |
[R code](week2/R_S4.R) |
[Source](week2/R_S4.Rmd))

## Annotation

- **biomaRt** FIXME: make video  
([HTML](week2/biomaRt.html) |
[R code](week2/biomaRt.R) |
[Source](week2/biomaRt.Rmd))

## Analysis

- **Analysis of 450k DNA Methylation arrays** FIXME: make Rmd


## ToDo


## Useful skills

- Writing R scripts
- Quick introduction to RMarkdown and reproducible research.
- Some mention of version control system.

FIXME: video and/or text presenting useful skills. Perhaps move to week 2


## More Annotation

- **SNPpackages** FIXME: make Rmd file
- **GWAS package**


## Analysis packages

- **limma**
- **edgeR**
- **DEseq**
- **sva**
- **DNAcopy**
- **oligo** ? Should we include this?


## Visualization

- **GViz**
- **ggbio**
- FIXME: make Rmd file for rtracklayer: interface with browser

Both?



# Recording mistakes

- IRanges Basic has a different RStudio theme
- The following videos have mono sound - was it not captured using the good microphone? (`GenomicRanges_seqinfo`, `Usecase_AnnotationHub_GRanges_part2`, `rtracklayer_Import`).



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


