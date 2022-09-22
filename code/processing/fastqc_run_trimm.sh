#!/bin/sh                                                                
                                                                         
# This is a script to loop over the RNAseq files and submit              
# jobs for Fastqc analysis.                                              
                                                                         
export sampledir='../../result/trimm'  
mkdir -p ../../result/fastqc_trimm                                                                      
export resultdir='../../result/fastqc_trimm'

while read -r samplename                                                  
do                                                                       
echo ${samplename}     
fastq1=${sampledir}/${samplename}*R1*_trim_pair.fastq.gz
fastq2=${sampledir}/${samplename}*R2*_trim_pair.fastq.gz
echo ${fastq1} ${fastq2} ${resultdir}
sbatch fastqc.sh ${fastq1} ${fastq2} ${resultdir}
done < ../../data/RNA_seq_samples.txt
