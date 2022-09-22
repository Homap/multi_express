#!/bin/sh                                                                
                                                                         
# This is a script to loop over the RNAseq files and submit              
# jobs for Fastqc analysis.                                              
                                                                         
export sampledir='../../data/simlinks'  
mkdir -p ../../result/fastqc                                                                      
export resultdir='../../result/fastqc'

while read -r samplename                                                  
do                                                                       
echo ${samplename}     
fastq1=${sampledir}/${samplename}*R1*.fastq.gz
fastq2=${sampledir}/${samplename}*R2*.fastq.gz
echo ${fastq1} ${fastq2} ${resultdir}
sbatch fastqc.sh ${fastq1} ${fastq2} ${resultdir}
done < ../../data/RNA_seq_samples.txt
