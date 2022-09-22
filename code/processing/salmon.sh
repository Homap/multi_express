#!/usr/bin/python

module load bioinfo-tools Salmon/1.1.0

# Analyzing your RNA-seq data with Salmon

# Create an analysis directory
mkdir salmon_analysis

# Copy transcrimptomes to salmon_analysis

cp spain_trinity.fa.gz salmon_analysis
cp italy_trinity.fa.gz salmon_analysis
cp house_trinity.fa.gz salmon_analysis
cp hybrid_trinity.fa.gz salmon_analysis

# Using the most recent version of Salmon
wget https://github.com/COMBINE-lab/salmon/releases/download/v1.3.0/salmon-1.3.0_linux_x86_64.tar.gz
# Saving it to the PATH by adding the following in the .bash_profile
export PATH="/proj/uppstore2018213/sparrow_rna_analysis/bin/salmon-1.3.0_linux_x86_64/bin"

# Create index for transcriptomes
sbatch salmon_index.sh

# Quantifying the samples
sbatch salmon_quant.sh


