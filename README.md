expression-workshop
===================

Materials for UPR-CCC U54 bioconductor workshop

## Objectives

 1. Understand what the bioconductor project is
 1. Learn to install bioconductor packages
 1. Learn to construct, import, and manipulate gene expression objects
 containing experimental data
 1. Fit linear models to gene expression data
 1. Determine which genes are differentially expressed in an
 experiment
 1. Determine which pathways are altered in an experiment
 1. Prepare tables and plots to summarize the results of gene
 expression experiments

## Installation

To prepare for the workshop, I recommend installing these packages in
bioconductor. You can cut and paste the following instructions into
the RStudio console. You will need a good Internet connection.

```
source("http://bioconductor.org/biocLite.R")
biocLite("affy")
biocLite("limma")
biocLite("pathview")
biocLite("breastCancerMAINZ")
biocLite("hgu133a.db")
```