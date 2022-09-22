#!/bin/bash -l

#SBATCH -A snic2022-22-687
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J fastqc
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools FastQC/0.11.9
fastq1=$1
fastq2=$2
output_dir=$3

# Run the fastqc for quality control before trimming
fastqc $fastq1 $fastq2 -o $output_dir
