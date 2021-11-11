Welcome to the Mini-project wiki!
# About
As part of the bioinformatics internship, we undertook this mini-project to reproduce the dry lab analysis of this paper
# Members
1. Nelly Wambui
2. Collins Kigen
# Supervisors
1. Dr. Caleb Kibet
2. Ruth Nanjala

# Background Information

Tomato production faces threats with one of them being infection by begomoviuses which are associated with tomato leaf curl diseases. Lack of enough information on the molecular properties of tomato begomoviruses in Kenya encouraged the investigation of their population and genetic diversity. The tomato fruits are not only useful for their nutritional value, such as having antioxidant properties to fight cancer, but are also a major source of income for smallholder rural farmers. To help in increase of yields, solving production constraints is of importance; and diseases caused by viruses are the third significant constraint. Sixty of the 136 viruses that infect tomatoes are members of the genus *Begomovirus* and family Geminiviridae.

The use of metagenomics in this approach was in identification of viruses in association with the disease

## Step 1: Downloading SRA data
First, we downloaded the accession list of SRA files from SRA database url provided under additional information in the paper. The file was saved in Raw-Data directory as SraAccList.txt
### Setup
```conda install -c bioconda/label/cf201901 sra-tools```
### Bash Script called Download-Sra.sh
```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
prefetch $file
done
```

#### Output
```
└── public
    └── sra
        ├── SRR12245789.sra  
        ├── SRR12245790.sra
        ├── SRR12245791.sra
        ├── SRR12245792.sra
        ├── SRR12245793.sra
        ├── SRR12245794.sra
        ├── SRR12245795.sra
        ├── SRR12245796.sra
        ├── SRR12245797.sra
        ├── SRR12245798.sra
        ├── SRR12245799.sra
        └── SRX6727228.sra.cache
```
## Step 2: Extracting .sra files
We extracted individual .sra file into fastq using a script named extract-sra.sh
```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
fasterq-dump ~/ncbi/public/sra/$file.sra --split-files  --outdir ../Raw-Data
done
```
### Output
```
../Raw-Data
├── SraAccList.txt
├── SRR12245789.sra_1.fastq
├── SRR12245789.sra_2.fastq
├── SRR12245790.sra_1.fastq
├── SRR12245790.sra_2.fastq
├── SRR12245791.sra_1.fastq
├── SRR12245791.sra_2.fastq
├── SRR12245792.sra_1.fastq
├── SRR12245792.sra_2.fastq
├── SRR12245793.sra_1.fastq
├── SRR12245793.sra_2.fastq
├── SRR12245794.sra_1.fastq
├── SRR12245794.sra_2.fastq
├── SRR12245795.sra_1.fastq
├── SRR12245795.sra_2.fastq
├── SRR12245796.sra_1.fastq
├── SRR12245796.sra_2.fastq
├── SRR12245797.sra_1.fastq
├── SRR12245797.sra_2.fastq
├── SRR12245798.sra_1.fastq
├── SRR12245798.sra_2.fastq
├── SRR12245799.sra_1.fastq
└── SRR12245799.sra_2.fastq

```
## Step 3: Quality Control of fastq paired end reads
### Setup
We downloaded FastP using thr following command
```
conda install -c bioconda/label/cf201901 fastp
```

### Bash script for removing adapters,poly-N sequences and filter off low quality reads
```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
fastp -i ~/ncbi/miniproject-fastq/$file.sra_1.fastq -I ~/ncbi/miniproject-fastq/$file.sra_2.fastq -o ~/ncbi/fastp-qc/out$file.sra_1.fastq -O ~/ncbi/fastp-qc/out$file.sra_2.fastq -h ~/ncbi/fastp-qc/out$file.html -j ~/ncbi/fastp-qc/out$file.json
done
```
### Output
```
├── outSRR12245789.html
├── outSRR12245789.json
├── outSRR12245789.sra_1.fastq
├── outSRR12245789.sra_2.fastq
├── outSRR12245790.html
├── outSRR12245790.json
├── outSRR12245790.sra_1.fastq
├── outSRR12245790.sra_2.fastq
├── outSRR12245791.html
├── outSRR12245791.json
├── outSRR12245791.sra_1.fastq
├── outSRR12245791.sra_2.fastq
├── outSRR12245792.html
├── outSRR12245792.json
├── outSRR12245792.sra_1.fastq
├── outSRR12245792.sra_2.fastq
├── outSRR12245793.html
├── outSRR12245793.json
├── outSRR12245793.sra_1.fastq
├── outSRR12245793.sra_2.fastq
├── outSRR12245794.html
├── outSRR12245794.json
├── outSRR12245794.sra_1.fastq
├── outSRR12245794.sra_2.fastq
├── outSRR12245795.html
├── outSRR12245795.json
├── outSRR12245795.sra_1.fastq
├── outSRR12245795.sra_2.fastq
├── outSRR12245796.html
├── outSRR12245796.json
├── outSRR12245796.sra_1.fastq
├── outSRR12245796.sra_2.fastq
├── outSRR12245797.html
├── outSRR12245797.json
├── outSRR12245797.sra_1.fastq
├── outSRR12245797.sra_2.fastq
├── outSRR12245798.html
├── outSRR12245798.json
├── outSRR12245798.sra_1.fastq
├── outSRR12245798.sra_2.fastq
├── outSRR12245799.html
├── outSRR12245799.json
├── outSRR12245799.sra_1.fastq
└── outSRR12245799.sra_2.fastq
```
## Step 4: Mapping fasq reads to tomato genome
### Setup
We downloaded Bowtie2 v2 using 
```
conda install -c bioconda bowtie2
```
### Downloading index genome = tomato genome (GenBank RefSeq accession number GCA_000188115.3)
```
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/188/115/GCF_000188115.4_SL3.0/GCF_000188115.4_SL3.0_genomic.fna.gz
```
### Unzipping the genome file
```
gunzip GCF_000188115.4_SL3.0_genomic.fna.gz
```
### Building the bowtie index for storing the genome
```
bowtie2-build GCF_000188115.4_SL3.0_genomic.fna tomato_t15
```
### Bash script for alignment/mapping of the high-quality reads to the tomato genome
```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
bowtie2 -x ~/Nelly/Tomato-Genome/tomato_t15 -1 ~/ncbi/fastp-qc/out$file.sra_1.fastq -2 ~/ncbi/fastp-qc/out$file.sra_2.fastq -S ~/ncbi/mapped-sequences/out$file.sam
done
```
### Output
```
.
├── outSRR12245789.sam
├── outSRR12245790.sam
├── outSRR12245791.sam
├── outSRR12245792.sam
├── outSRR12245793.sam
├── outSRR12245794.sam
├── outSRR12245795.sam
├── outSRR12245796.sam
├── outSRR12245797.sam
├── outSRR12245798.sam
└── outSRR12245799.sam
```
## Step 5: Assembling unmapped reads into contigs de novo
### Setup
We downloaded Megahit using
```
conda install -c bioconda megahit
```
We then renamed the alignment output by removing the prefix "out" for ease of use of the files
```
rename 's/out//g' *
```
### Converting sam file to bam file
This was done because the sam file was too huge. The bam file is a binary file.
The script below was ran:
```
for file in $(cat ../Raw-Data/SraAccList.txt)
do 
samtools view -b -o ~/ncbi/mapped-sequences/$file.bam ~/ncbi/mapped-sequences/$file.sam
done
```
### Extracting the unmapped reads
```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
samtools view -b -f 12 ~/ncbi/mapped-sequences/$file.bam > ~/ncbi/mapped-sequences/unmapped-reads/$file.bam
done
```
### Sorting bam files with unmapped reads by read name
```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
samtools sort -n ~/ncbi/mapped-sequences/unmapped-reads/$file.bam -o ~/ncbi/mapped-sequences/unmapped-reads/$file.sorted.bam
done
```
### Converting sorted bam files to fastq
```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
samtools bam2fq ~/ncbi/mapped-sequences/unmapped-reads/$file.sorted.bam > ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file.fastq
done
```
### Quality control using fastqc and multiqc
```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
fastqc ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file.fastq -o ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/fastqc
done
multiqc ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/fastqc -o ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/fastqc
```
