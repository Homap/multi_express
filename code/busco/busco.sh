#!/bin/bash -l

#SBATCH -A snic2022-22-687
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 10:00:00
#SBATCH -J busco
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools BUSCO/5.3.1
source $AUGUSTUS_CONFIG_COPY

fasta=$1
output_dir=$2

run_BUSCO.py -i $fasta -o $output_dir -l $BUSCO_LINEAGE_SETS/chlorophyta_odb10 -m transcriptome -c 16 

