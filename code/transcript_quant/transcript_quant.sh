#!/bin/bash -l

#SBATCH -A snic2022-22-687
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 1-00:00:00
#SBATCH -J trinity
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools trinity/2.13.2

align_and_estimate_abundance.pl --seqType fq \
--samples_file express_samples.txt --transcripts ../../result/trinity_all/trinity_allsamples.Trinity.fasta \
--est_method salmon --gene_trans_map ../../result/trinity_all/trinity_allsamples.Trinity.fasta.gene_trans_map \
--prep_reference --output_dir ../../result/transcript_quant