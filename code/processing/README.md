# Code for processing RNA-seq data

### Quality check for fastq reads

`bash fastqc_run.sh`

### Trimming RNA-seq data

There is an over-representation of Nextera transposase adapters. Trimmomatic software comes with a set of adaptor
sequences with permission from Illumina. In Rackham, copy the sequences:

`cp /sw/bioinfo/trimmomatic/0.39/rackham/adapters/NexteraPE-PE.fa .`

Adaptor sequences are removed from the data. Strange thing after trimming is the larger number of unpaired forward strands which 
would mean there has not been enough reads of reverse strand. I am not sure why this happens, will discuss with bioinfo help desk.

I am not sure which of the following would work best. We have seen that mapping across green algae species does not work well
because of long evolutionary distance. Let's map to C. reinhardtii and at the same time, produce transcriptome assemblies and
assess both.

### Creating transcriptome assembly
`bash trinity_run.sh`

### Mapping reads to reference genome 
For mapping, we use GCA_000002595.3_Chlamydomonas_reinhardtii_v5.5

1. generate STAR index <br>
`bash star_g_generate_run.sh`

2. map reads
`bash star_align_reads_run.sh``



