#!/bin/bash -l

#SBATCH -A snic2022-22-687
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 10:00:00
#SBATCH -J salmon_quant
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

#*********************************************
trimdir='../../result/trimm'
salmondir='../../result/trinity_all'
#*********************************************
# Create the quantification directory
mkdir -p ../../result/transcript_quant
resultdir='../../result/transcript_quant'
#*********************************************
module load bioinfo-tools Salmon/1.6.0

while read -r samplename                                                  
do                                                                       
echo ${samplename}     
fastq1=${trimdir}/${samplename}*R1*_trim_pair.fastq.gz
fastq2=${trimdir}/${samplename}*R2*_trim_pair.fastq.gz
echo ${fastq1} ${fastq2} ${resultdir}/${samplename}_quant
salmon quant -i ${salmondir}/trinity_allsamples.Trinity_index -l A \
         -1 ${fastq1} \
         -2 ${fastq2} \
         -p 8 --validateMappings -o ${resultdir}/${samplename}_quant
done < ../../data/RNA_seq_samples.txt
#*********************************************

# Explanation of the command above
# -l A: tells Salmon that it should automatically determine the library type of the sequencing reads (e.g. stranded vs. unstranded).
