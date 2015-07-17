---
title: "Overview of Bioconductor"
author:"Kasper D. Hansen"
---

# Week 1

## Introducing Bioconductor
- overview
- installation
- getting help
- basic R
- levels of trust in online resources

## data.frames(), vectors(), indexing

## IRanges, GRanges

## DataFrames()

## Task
Take some bed file



Data containers: ExpressionSet, AffyBatch, NChannelSet, eSet
Reading data: GEOquery

Biostrings? BSgenome?

## Week 2

IRanges, GRanges
SummarizedExperiment
AnnotationHub
rtracklayer: reading in BigWig, bed files

## Week 3

## Week 4



## Packages

IRanges / GenomicRanges
- Beginning: IRanges(), GRanges(), findOverlaps() etc.
- Intermediate: seqinfo(), Rle's, Views, 


Biostrings
rtracklayer

Biobase
SummarizedExperiment



GenomeInfoDb
VariantAnnotation
Rsamtools



AnnotationHub

limma / edgeR / DEseq(2)
biomaRt

GenomicAlignments / GenomicFeatures
affy / oligo / minfi 

Gviz / ggbio

GOstats / cummerbound?

## Tasks

Heatmaps
Getting data into Bioconductor



## Example tasks

- Take some data (ChIP-seq or DMRs) and overlap it with ENCODE data and/or promoters.
- Find SNPs overlapping this data.
- Display some data on the Genome Browser.

- compute GC content in some regions

- Do this using AnnotationHub, rtracklayer to get information from UCSC / elsewhere.





Resources
=========

[CSHL](http://watson.nci.nih.gov/~sdavis/tutorials/IntroToR/)









# Overview of Bioconductor
## What is Bioconductor (slides)

Slides: Done
Presentation: Recorded

## How to install (interactive)

- Show biocLite()
- Show biocValid()
- Explain different Bioc versions and how biocLite() figures it out (perhaps needs slides)

## Website (interactive, non-R)

- Show how to find a package, see the vignette and see the NEWS file
- Show how to find annotation packages
- Show the workflows page
- Show newsletter
- Just point out developers site

## Getting help

- sessionInfo()
- Support forum
- Stackoverflow
- rseek
- Vignettes

## Getting help in R

- help(package = "bsseq")
- ? ??
- Help depends on which packages are loaded

# Data containers
## 3 types of data
## Several levels of data
## ExpressionSet
## SummarizedExperiment
## Extensions
## limma classes?


# Reading in your data

- Reading in microarry data
- import functions from rtracklayer


# Programming

## S4 objects
## S4 methods? Help page?



# Annotation

## Intro to Annotation (slides)

Slides: Done
Recording: Done

## Microarray annotation packages
## AnnotationHub
## biomaRt
## rtracklayer

a. kjdsfn
b. lkdsja
c. alkd

1. akjhdkas
2. alsdjlakjsd


# Visualization
## Massive scatterplots
- standard
- add loess line
- alpha blending
- smooth scatter
- heatmaps?
## GViz overview
## ggbio overview





# GenomicRanges / IRanges

# Biostrings / BSgenome


# Packages for workflows





# Bioc, generic

## What is Bioc
## 3 types of data (annotation, genomics, metadata)
## Installing / navigating the website
- where do you get help
## S4 classes / methods
## Vignettes
## ExpressionSet
- metadata, pData
- exprs
## SummarizedExperiment
## GenomicRanges
## biomaRt
## Annotation
## Levels of data (raw, processed, results, annotated)
## Manipulating genomes



Case-studies
============

## RNA-seq
## DNAm
## DNA-seq
- VCF files
## ChIP-seq
## Microarray, gene expression
## Microarray, genotype
## Proteomics
## 16S
## Esoteric sequencing (ribo-seq, GRO-seq, Hi-C)




Things we need from other courses 
=================================

## Stats we need
- biological vs. technical replication
- basic experimental design
- moderated (ebayes) t-statistic
- multiple testing
- permutation testing
## Biology we need
- what is rna/dna/protein
## Command line we need (across several modules)
- how to use a shell
- how to do basic mapping, say use bowtie
- how to manipulate sam/bam files and fastq files.
	
