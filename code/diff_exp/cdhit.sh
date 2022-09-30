#!/bin/bash -l

#SBATCH -A snic2019-3-506
#SBATCH -p core
#SBATCH -n 12
#SBATCH -t 12:00:00
#SBATCH -J cdhit
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

#*********************************************
module load bioinfo-tools cd-hit/4.8.1
output_cd=$1
trinity_fa=$2

cd-hit-est -o $output_cd -c 0.98 -i $trinity_fa -p 1 -d 0 -b 3 -T 10 -M 60000

