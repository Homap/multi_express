#!/bin/bash -l

#SBATCH -A snic2022-22-687
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J salmon_index
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools Salmon/1.6.0

# Build an index on our transcriptomes. The index need only be constructed 
# once per transcriptome, and it can then be reused to quantify many experiments.
salmon index -t ../../result/trinity_all/trinity_allsamples.Trinity.fasta -i ../../result/trinity_all/trinity_allsamples.Trinity_index 
