#!/bin/bash -l

#SBATCH -A snic2019-3-506
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 1-00:00:00
#SBATCH -J salmon_quant
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

#*********************************************
trimdir='../data/trimm'
salmondir='../data/salmon_analysis'
#*********************************************
# Create the quantification directory
mkdir -p ../data/salmon_analysis/quants
#*********************************************
while read -r sampledir                                                          
do
echo ${sampledir}
Read_1=$(find ${trimdir}/${sampledir} -type f -name "*R1*_trim_pair.fastq.gz") 
Read_2=$(find ${trimdir}/${sampledir} -type f -name "*R2*_trim_pair.fastq.gz")
echo ${Read_1} ${Read_2}
salmon quant -i ${salmondir}/house_trinity_index -l A \
         -1 ${Read_1} \
         -2 ${Read_2} \
         -p 8 --validateMappings -o ../data/salmon_analysis/quants/${sampledir}_quant
done < ../doc/house_samples.txt
#*********************************************
#*********************************************
while read -r sampledir                                                          
do
echo ${sampledir}
Read_1=$(find ${trimdir}/${sampledir} -type f -name "*R1*_trim_pair.fastq.gz") 
Read_2=$(find ${trimdir}/${sampledir} -type f -name "*R2*_trim_pair.fastq.gz")
echo ${Read_1} ${Read_2}
salmon quant -i ${salmondir}/spain_trinity_index -l A \
         -1 ${Read_1} \
         -2 ${Read_2} \
         -p 8 --validateMappings -o ../data/salmon_analysis/quants/${sampledir}_quant
done < ../doc/spain_samples.txt
#*********************************************
#*********************************************
while read -r sampledir                                                          
do
echo ${sampledir}
Read_1=$(find ${trimdir}/${sampledir} -type f -name "*R1*_trim_pair.fastq.gz") 
Read_2=$(find ${trimdir}/${sampledir} -type f -name "*R2*_trim_pair.fastq.gz")
echo ${Read_1} ${Read_2}
salmon quant -i ${salmondir}/italy_trinity_index -l A \
         -1 ${Read_1} \
         -2 ${Read_2} \
         -p 8 --validateMappings -o ../data/salmon_analysis/quants/${sampledir}_quant
done < ../doc/italy_samples.txt
#*********************************************
#*********************************************
while read -r sampledir                                                          
do
echo ${sampledir}
Read_1=$(find ${trimdir}/${sampledir} -type f -name "*R1*_trim_pair.fastq.gz") 
Read_2=$(find ${trimdir}/${sampledir} -type f -name "*R2*_trim_pair.fastq.gz")
echo ${Read_1} ${Read_2}
salmon quant -i ${salmondir}/hybrid_trinity_index -l A \
         -1 ${Read_1} \
         -2 ${Read_2} \
         -p 8 --validateMappings -o ../data/salmon_analysis/quants/${sampledir}_quant
done < ../doc/hybrid_samples.txt
#*********************************************

