# Code for processing RNA-seq data

### Quality check for fastq reads

`bash fastqc_run.sh`

### Trimming RNA-seq data

There is an over-representation of Nextera transposase adapters. Trimmomatic software comes with a set of adaptor
sequences with permission from Illumina. In Rackham, copy the sequences:

`cp /sw/bioinfo/trimmomatic/0.39/rackham/adapters/NexteraPE-PE.fa .`


