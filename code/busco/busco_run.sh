#!/bin/bash

assemblydir='../../result/trinity'

for i in $assemblydir/*fasta
do
samplename=$(basename $i .Trinity.fasta)
echo $i $samplename
sbatch busco.sh $i $samplename
done

