#!/bin/sh
 
# set path to the adpater sequence 
ADAPT_FAST='NexteraPE-PE.fa' 
export sampledir='../../data/simlinks'
mkdir -p ../../result/trimm                                                                    
export resultdir='../../result/trimm'

while read -r samplename                                                  
do                                                                       
echo ${samplename}     
F_IN=${sampledir}/${samplename}*R1*.fastq.gz
R_IN=${sampledir}/${samplename}*R2*.fastq.gz
echo ${F_IN} ${R_IN} 

F_PAIR_OUT=${resultdir}/$(basename $F_IN .fastq.gz)_trim_pair.fastq.gz
R_PAIR_OUT=${resultdir}/$(basename $R_IN .fastq.gz)_trim_pair.fastq.gz
F_UNPAIR_OUT=${resultdir}/$(basename $F_IN .fastq.gz)_trim_unpair.fastq.gz
R_UNPAIR_OUT=${resultdir}/$(basename $R_IN .fastq.gz)_trim_unpair.fastq.gz
STAT=${resultdir}/$(basename $F_IN _R1_001.fastq.gz).stats
echo $F_PAIR_OUT $R_PAIR_OUT $F_UNPAIR_OUT $R_UNPAIR_OUT $STAT
echo $F_PAIR_OUT $R_PAIR_OUT $F_UNPAIR_OUT $R_UNPAIR_OUT $STAT
echo "submitting trimmomatic job"

sbatch trimm.sh $F_IN $R_IN $F_PAIR_OUT $F_UNPAIR_OUT $R_PAIR_OUT $R_UNPAIR_OUT $ADAPT_FAST $STAT
done < ../../data/RNA_seq_samples.txt

