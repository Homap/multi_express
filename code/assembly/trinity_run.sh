#!/bin/sh                                                                
                                                                         
# This is a script to loop over the RNAseq files and submit              
# jobs for Fastqc analysis.                                              
                                                                         
export sampledir='../../result/trimm'  
mkdir -p ../../result/trinity                                                                     
export resultdir='../../result/trinity'

while read -r samplename                                                  
do                                                                       
echo ${samplename}     
fastq1=${sampledir}/${samplename}*R1*_trim_pair.fastq.gz
fastq2=${sampledir}/${samplename}*R2*_trim_pair.fastq.gz
echo ${fastq1} ${fastq2} ${resultdir}/trinity_${samplename}
sbatch trinity.sh ${fastq1} ${fastq2} ${resultdir}/trinity_${samplename}
done < ../../data/RNA_seq_samples.txt

# Samples failed
# VA-3180-Osg11Pal
# VA-3180-Osg11Mul