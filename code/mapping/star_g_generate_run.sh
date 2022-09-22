#!/usr/bin/bash

reference='../../data/reference/GCA_000002595.3_Chlamydomonas_reinhardtii_v5.5/GCA_000002595.3_Chlamydomonas_reinhardtii_v5.5_genomic.fna'

mkdir -p ../../data/reference/star_index

sbatch star_g_generate.sh ../../data/reference/star_index $reference ../../data/reference/GCA_000002595.3_Chlamydomonas_reinhardtii_v5.5/GCA_000002595.3_Chlamydomonas_reinhardtii_v5.5_genomic.gff
