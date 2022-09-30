# Code for processing RNA-seq data

### Quality check for fastq reads

`bash fastqc_run.sh`

### Trimming RNA-seq data

There is an over-representation of Nextera transposase adapters. Trimmomatic software comes with a set of adaptor
sequences with permission from Illumina. In Rackham, copy the sequences:

`cp /sw/bioinfo/trimmomatic/0.39/rackham/adapters/NexteraPE-PE.fa .`

Adaptor sequences are removed from the data. Strange thing after trimming is the larger number of unpaired forward strands which 
would mean there has not been enough reads of reverse strand. I am not sure why this happens, will discuss with bioinfo help desk.

I am not sure which of the following would work best. We have seen that mapping across green algae species does not work well because of long evolutionary distance. Let's map to C. reinhardtii and at the same time, produce transcriptome assemblies and assess both.

**Trimmomatic filtering summary**

| Sample        | Input Read Pairs | Both Surviving Read % | 
| ------------- |:----------------:|:---------------------:|
| Osg10Sin      | 38613164         | 41.59                 |
| Osg12Sin      | 40463366         | 39.15                 |
| Osg03Sin      | 28258686         | 40.79                 |
| Osg11Sin      | 24226009         | 36.66                 |
| Osg10Pal      | 30611959         | 42.12                 |
| Osg12Pal      | 29907662         | 30.00                 |
| Osg03Pal      | 37065999         | 18.95                 |
| Osg11Pal      | 30646894         | 43.29                 |
| Osg10Mul      | 22603175         | 27.98                 |
| Osg12Mul      | 29256523         | 40.96                 |
| Osg03Mul      | 25248234         | 45.47                 |
| Osg11Mul      | 29848148         | 50.34                 |



### Creating transcriptome assembly
`bash trinity_run.sh`

**Transcriptome quality assessed by BUSCO gene set**

| Sample        | BUSCO%        |
| ------------- |:-------------:|
| Osg10Sin      | 48.8          |
| Osg12Sin      | 33.3          |
| Osg03Sin      | 34.6          |
| Osg11Sin      | 46.1          |
| Osg10Pal      | 50.0          |
| Osg12Pal      | 31.5          |
| Osg03Pal      | 28.1          |
| Osg11Pal      | 57.6          |
| Osg10Mul      | 35.1          |
| Osg12Mul      | 50.3          |
| Osg03Mul      | 60.5 |
| Osg11Mul      | 64.2          |

### Mapping reads to reference genome 
For mapping, we use GCA_000002595.3_Chlamydomonas_reinhardtii_v5.5

1. generate STAR index <br>
`bash star_g_generate_run.sh`

2. map reads
`bash star_align_reads_run.sh`

| Sample        | Unmapped reads % |
| ------------- |:----------------:|
| Osg10Sin      | 72.48         |
| Osg12Sin      | 55.61         |
| Osg03Sin      | 53.41         |
| Osg11Sin      | 54.11         |
| Osg10Pal      | 55.42         |
| Osg12Pal      | 59.20         |
| Osg03Pal      | 58.04         |
| Osg11Pal      | 53.98         |
| Osg10Mul      | 69.32         |
| Osg12Mul      | 53.67         |
| Osg03Mul      | 54.35         |
| Osg11Mul      | 53.30         |

### Transcriptome assembly 
I had a meeting with Maria and Charlie (23 September). One suggestion was to create a transcriptome assembly 
using all samples together. The hope is that we get a more complete representation of genes. Let's see!

`sbatch trinity_all.sh`

To run this, we need a larger memory allocation than the 120 GB memory given by a standard Rackham node.

- BUSCO result

- BUSCO version is: 5.3.1 
- The lineage dataset is: chlorophyta_odb10 (Creation date: 2020-08-05, number of genomes: 16, number of BUSCOs: 1519)
- Summarized benchmarking in BUSCO notation for file /crex/proj/snic2022-23-81/expression_algae/result/trinity_all/trinity_allsamples.Trinity.fasta

        C:86.0%[S:38.6%,D:47.4%],F:5.5%,M:8.5%,n:1519      
        1306    Complete BUSCOs (C)                        
        586     Complete and single-copy BUSCOs (S)        
        720     Complete and duplicated BUSCOs (D)         
        83      Fragmented BUSCOs (F)                      
        130     Missing BUSCOs (M)                         
        1519    Total BUSCO groups searched  

## Including single end forward reads

Let's try with one sample to combine forward unpaird reads with paired reads.

First observation:
I ran one sample (VA-3180-Osg11Mul) with both paired and unpaired reads and created a Trinity assembly. The BUSCO%
did not change and was 64.1% compared to only using paired reads with the BUSCO score of 64.2%. 
At this moment, I am running Trinity for all samples using only paired reads. The terrible thing is that I really don't know how these software are doing their jobs. 

Second try:
These RNA-seq data were prepared by using Illumina stranded Total RNA-seq library preparation. I think it uses the Truseq ligation technology (?). This time I am running Trinity by specifying `SS_lib_type RF` to see what comes of it. 

The BUSCO% is 64% so this also didn't change much.

## Transcript expression quantification using Salmon

To estimate transcript expression values, we wil use the salmon software. We will run Salmon on each of the sample replicates as listed in `express_samples.txt`.

- Index the transcriptome assembly <br>
`sbatch salmon_index.sh`

- Qunatifying the samples <br>
`sbatch salmon_quant.sh`

## Differential gene expression using DESeq2

- Create a count matrix of all samples

```
module load bioinfo-tools trinity/2.13.2

export trinity_out='../../result/trinity_all'
export resultdir='../../result/transcript_quant'

find ../../result/transcript_quant -name "quant.sf" | tee quant_files.list

abundance_estimates_to_matrix.pl --est_method salmon \
--out_prefix Trinity --name_sample_by_basedir \
--quant_files quant_files.list \
--gene_trans_map ${trinity_out}/trinity_allsamples.Trinity.fasta.gene_trans_map

mv Trinity* ${resultdir}
```

```
module load bioinfo-tools trinity/2.13.2 R_packages/4.1.1

export resultdir='../../result/transcript_quant'

$TRINITY_HOME/Analysis/DifferentialExpression/run_DE_analysis.pl \
--matrix ${resultdir}/Trinity.isoform.counts.matrix \
--samples express_samples.txt \
--method DESeq2 \
--output DESeq2_trans
```

`batch deseq2.sh`

```
$TRINITY_HOME/Analysis/DifferentialExpression/analyze_diff_expr.pl \
--matrix ../Trinity.isoform.TMM.EXPR.matrix \
--samples ../samples.txt \
-P 1e-2 -C 2 

$TRINITY_HOME/Analysis/DifferentialExpression/analyze_diff_expr.pl \
--matrix ../Trinity.isoform.TMM.EXPR.matrix \
--samples ../samples.txt \
-P 1e-3 -C 2
```

## Identification of likely protein-coding regions in transcripts

First run the TransDecoder step that identifies all long ORFs.
Now, run the step that predicts which ORFs are likely to be coding.

`sbatch transcoder.sh`

## Sequence homology searches 

- Using Diamond <br>
`sbatch trinity_allsamples.diamond`

- Using Blastx <br>
`sbatch blastx.sh`

- Using Blastp <br>
`sbatch blastp.sh`

## HMMER search against the Pfam database

`sbatch hmmer.sh`

## Computational prediction of sequence features

The signalP and tmhmm software tools are very useful for predicting signal peptides (secretion signals) and transmembrane domains, respectively.
To predict signal peptides, run signalP like so:

`sbatch signalp.sh`

## Generating a Trinotate annotation report

Build a Trinotate sqlite database <br>

cd ../../result/trinotate

$TRINOTATE_HOME/admin/Build_Trinotate_Boilerplate_SQLite_db.pl  Trinotate