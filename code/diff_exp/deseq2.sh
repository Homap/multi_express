#!/bin/bash -l

#SBATCH -A snic2022-22-687
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J trinity
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools trinity/2.13.2 R_packages/4.1.1

$TRINITY_HOME/Analysis/DifferentialExpression/run_DE_analysis.pl --matrix Trinity.isoform.counts.matrix --samples samples.txt \
--method DESeq2 --output DESeq2_output
