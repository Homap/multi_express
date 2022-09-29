# Clean the working environment
rm(list=ls())
# Loading the required libraries
library(DESeq2)
library(dplyr)
library(tximport)
library(readr)

metaData <- read.table(file.annotations, header=T)

metaData <- metaData[metaData$state!="Pal",]

files <- file.path(".", metaData$sample, "quant.sf")
names(files) <- metaData$sample
tx2gene <- read.table("trinity_allsamples.Trinity.fasta.gene_trans_map")
tx <- tx2gene$V2
gene <- tx2gene$V1
tx2gene <- data.frame(tx, gene)
txi <- tximport(files, type="salmon", tx2gene=tx2gene)

# Construct DESEQDataSet Object
ddsTxi <- DESeqDataSetFromTximport(txi,
                                   colData = metaData,
                                   design = ~ state)
# Run the DESEQ function
dds <- DESeq(ddsTxi)

# Count matrix
count <- counts(dds, normalize = TRUE)

# Dispersion plot
plotDispEsts(dds)

# Take a look at the result table
res <- results(dds)
head(results(dds, tidy=TRUE))

# PCA
vsdata <- rsd(dds, blind=FALSE)
plotPCA(vsdata, intgroup="state")

