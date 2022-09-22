#!/bin/bash -l

#SBATCH -A snic2022-22-687
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 1-00:00:00
#SBATCH -J trinity
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools trinity/2.13.2

forward=$1
reverse=$2
outdir=$3

Trinity --seqType fq \
--left $forward \
--right $reverse \
--output ${outdir} --max_memory 120G --CPU 16

