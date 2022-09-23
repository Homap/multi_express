#!/bin/bash -l

#SBATCH -A snic2022-22-687
#SBATCH -p node
#SBATCH -n 1
#SBATCH -C mem1TB
#SBATCH -t 2-00:00:00
#SBATCH -J trinity_all
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools trinity/2.13.2

Trinity --seqType fq \
--left ../../result/trimm/VA-3180-Osg03Mul_S3_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg03Pal_S2_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg03Sin_S1_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg10Mul_S6_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg10Pal_S5_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg10Sin_S4_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg11Mul_S9_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg11Pal_S8_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg11Sin_S7_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg12Mul_S12_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg12Pal_S11_L001_R1_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg12Sin_S10_L001_R1_001_trim_pair.fastq.gz \
--right ../../result/trimm/VA-3180-Osg03Mul_S3_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg03Pal_S2_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg03Sin_S1_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg10Mul_S6_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg10Pal_S5_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg10Sin_S4_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg11Mul_S9_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg11Pal_S8_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg11Sin_S7_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg12Mul_S12_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg12Pal_S11_L001_R2_001_trim_pair.fastq.gz ../../result/trimm/VA-3180-Osg12Sin_S10_L001_R2_001_trim_pair.fastq.gz \
--output ../../result/trinity_all/trinity_allsamples --max_memory 800G --CPU 16

# #SBATCH -p node
# #SBATCH -n 1
# #SBATCH -C mem1TB