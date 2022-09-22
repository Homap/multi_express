#!/bin/bash -l

#SBATCH -A snic2019-3-506
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 1-00:00:00
#SBATCH -J salmon_index
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

# Build an index on our transcriptomes. The index need only be constructed 
# once per transcriptome, and it can then be reused to quantify many experiments.
salmon index -t ../data/salmon_analysis/spain_trinity.fa.gz -i ../data/salmon_analysis/spain_trinity_index
salmon index -t ../data/salmon_analysis/italy_trinity.fa.gz -i ../data/salmon_analysis/italy_trinity_index
salmon index -t ../data/salmon_analysis/house_trinity.fa.gz -i ../data/salmon_analysis/house_trinity_index
salmon index -t ../data/salmon_analysis/hybrid_trinity.fa.gz -i ../data/salmon_analysis/hybrid_trinity_index
