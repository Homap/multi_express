#!/bin/bash -l

#SBATCH -A snic2019-3-619
#SBATCH -p node
#SBATCH -n 1
#SBATCH -t 10-00:00:00
#SBATCH -J house_trinity
#SBATCH -C mem1TB
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools trinity/2.9.1 perl_modules/5.26.2 bowtie/1.2.3 samtools/1.10

sp='/proj/uppstore2018213/sparrow_rna_analysis/data/trimm'
house_outdir='/proj/uppstore2018213/sparrow_rna_analysis/data/trinity_assembly/house_trinity'
Trinity --seqType fq \
--left ${sp}/Sample_HTE01/HLGWWBBXX_HTE01_GAGATTCC-TAAGATTA_L001_R1_001_trim_pair.fastq.gz,${sp}/Sample_HTE02/HLGWWBBXX_HTE02_ATTCAGAA-ACGTCCTG_L001_R1_001_trim_pair.fastq.gz,${sp}/Sample_HTE03/HLGWWBBXX_HTE03_TCCGGAGA-TCAGAGCC_L001_R1_001_trim_pair.fastq.gz,${sp}/Sample_HTE04/HLGWWBBXX_HTE04_GAATTCGT-GTCAGTAC_L001_R1_001_trim_pair.fastq.gz,${sp}/Sample_HTE05/HLGWWBBXX_HTE05_CGGCTATG-AGGCTATA_L001_R1_001_trim_pair.fastq.gz,${sp}/Sample_HTE06/HLGWWBBXX_HTE06_TCCGCGAA-GCCTCTAT_L001_R1_001_trim_pair.fastq.gz,${sp}/Sample_HTE07/HLGWWBBXX_HTE07_TAATGCGC-AGGATAGG_L001_R1_001_trim_pair.fastq.gz,${sp}/Sample_HTE08/HLGWWBBXX_HTE08_AGCGATAG-CTTCGCCT_L001_R1_001_trim_pair.fastq.gz,${sp}/Sample_HTE09/HLGWWBBXX_HTE09_CGCTCATT-ACGTCCTG_L002_R1_001_trim_pair.fastq.gz,${sp}/Sample_HTE10/HLGWWBBXX_HTE10_ATTACTCG-TAAGATTA_L002_R1_001_trim_pair.fastq.gz \
--right ${sp}/Sample_HTE01/HLGWWBBXX_HTE01_GAGATTCC-TAAGATTA_L001_R2_001_trim_pair.fastq.gz,${sp}/Sample_HTE02/HLGWWBBXX_HTE02_ATTCAGAA-ACGTCCTG_L001_R2_001_trim_pair.fastq.gz,${sp}/Sample_HTE03/HLGWWBBXX_HTE03_TCCGGAGA-TCAGAGCC_L001_R2_001_trim_pair.fastq.gz,${sp}/Sample_HTE04/HLGWWBBXX_HTE04_GAATTCGT-GTCAGTAC_L001_R2_001_trim_pair.fastq.gz,${sp}/Sample_HTE05/HLGWWBBXX_HTE05_CGGCTATG-AGGCTATA_L001_R2_001_trim_pair.fastq.gz,${sp}/Sample_HTE06/HLGWWBBXX_HTE06_TCCGCGAA-GCCTCTAT_L001_R2_001_trim_pair.fastq.gz,${sp}/Sample_HTE07/HLGWWBBXX_HTE07_TAATGCGC-AGGATAGG_L001_R2_001_trim_pair.fastq.gz,${sp}/Sample_HTE08/HLGWWBBXX_HTE08_AGCGATAG-CTTCGCCT_L001_R2_001_trim_pair.fastq.gz,${sp}/Sample_HTE09/HLGWWBBXX_HTE09_CGCTCATT-ACGTCCTG_L002_R2_001_trim_pair.fastq.gz,${sp}/Sample_HTE10/HLGWWBBXX_HTE10_ATTACTCG-TAAGATTA_L002_R2_001_trim_pair.fastq.gz \
--SS_lib_type RF --output ${house_outdir} --max_memory 800G --CPU 16

