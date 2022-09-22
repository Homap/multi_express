#!/bin/sh

trimdir='../../result/trimm'
genomedir='../../data/reference/star_index'
reference='../../data/reference/GCA_000002595.3_Chlamydomonas_reinhardtii_v5.5/GCA_000002595.3_Chlamydomonas_reinhardtii_v5.5_genomic.fna'

mkdir -p ../../result/mapping
outdir='../../result/mapping'

while read -r samplename                                                  
do                                                                       
echo ${samplename}  
fastq1=${sampledir}/${samplename}*R1*_trim_pair.fastq.gz
fastq2=${sampledir}/${samplename}*R2*_trim_pair.fastq.gz
echo ${fastq1} ${fastq2} ${outdir}/${samplename}_
sbatch star_align_reads.sh $genomedir ${fastq1} ${fastq2} ${outdir}/${samplename}_
done < ../../data/RNA_seq_samples.txt
