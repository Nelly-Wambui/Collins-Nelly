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

Tomato production faces threats with one of them being infection by begomoviuses which are associated with tomato leaf curl diseases. Lack of enough information on the molecular properties of tomato begomoviruses in Kenya encouraged the investigation of their population and genetic diversity. The tomato fruits are not only useful for their nutritional value, such as having antioxidant properties to fight cancer, but are also a major source of income for smallholder rural farmers. To help in increase of yields, solving production constraints is of importance; and diseases caused by viruses are the third significant constraint. Sixty of the 136 viruses that infect tomatoes are members of the genus _Begomovirus_ and family Geminiviridae.

There was evaluation odf recombinant isolates within the population and the occurrence of selection pressure. The use of metagenomics in this approach was in identification of viruses in association with the disease.

## Step 1: Downloading SRA data

First, we downloaded the accession list of SRA files from SRA database url provided under additional information in the paper. The file was saved in Raw-Data directory as SraAccList.txt

### Setup

`conda install -c bioconda/label/cf201901 sra-tools`

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
       └── SRR12245799.sra

```

## Step 2: Extracting .sra files

We extracted individual .sra file into fastq using a script named extract-sra.sh

```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
fasterq-dump ~/ncbi/public/sra/$file.sra --split-files  --outdir ~/ncbi/miniproject 
done
```

### Output

```
├── miniproject-fastq
   ├── fqtitle.txt
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
   ├── SRR12245799.sra_2.fastq

```

## Step 3: Quality Control of fastq paired end reads

### Setup

We downloaded FastP using the following command

```
conda install -c bioconda/label/cf201901 fastp
```

### Bash script named fastp.sh for removing adapters,poly-N sequences and filter off low quality reads

```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
fastp -i ~/ncbi/miniproject-fastq/$file.sra_1.fastq -I ~/ncbi/miniproject-fastq/$file.sra_2.fastq -o ~/ncbi/fastp-qc/out$file.sra_1.fastq -O ~/ncbi/fastp-qc/out$file.sra_2.fastq -h ~/ncbi/fastp-qc/out$file.html -j ~/ncbi/fastp-qc/out$file.json
done
```

### Output

```
├── fastp-qc
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

## Step 4: Mapping fastq reads to tomato genome using script named map-sequences.sh

### Setup

We downloaded Bowtie2 v2

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

### Converting sam file to bam file using script named sam-bam.sh

This was done because the sam file was too huge. The bam file is a binary file.
The script below was ran:

```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
samtools view -b -o ~/ncbi/mapped-sequences/$file.bam ~/ncbi/mapped-sequences/$file.sam
done
```

### Output

```
.
├── SRR12245789.bam
├── SRR12245789.sam
├── SRR12245790.bam
├── SRR12245790.sam
├── SRR12245791.bam
├── SRR12245791.sam
├── SRR12245792.bam
├── SRR12245792.sam
├── SRR12245793.bam
├── SRR12245793.sam
├── SRR12245794.bam
├── SRR12245794.sam
├── SRR12245795.bam
├── SRR12245795.sam
├── SRR12245796.bam
├── SRR12245796.sam
├── SRR12245797.bam
├── SRR12245797.sam
├── SRR12245798.bam
├── SRR12245798.sam
├── SRR12245799.bam
├── SRR12245799.sam
```

### Extracting the unmapped reads using script named extract-unmappedbam.sh

```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
samtools view -b -f 12 ~/ncbi/mapped-sequences/$file.bam > ~/ncbi/mapped-sequences/unmapped-reads/$file.bam
done
```

### Sorting bam files with unmapped reads by read name using script named sort-unmappedbam.sh

```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
samtools sort -n ~/ncbi/mapped-sequences/unmapped-reads/$file.bam -o ~/ncbi/mapped-sequences/unmapped-reads/$file.sorted.bam
done
```

### Output

```
├── SRR12245789.bam
├── SRR12245789.sorted.bam
├── SRR12245790.bam
├── SRR12245790.sorted.bam
├── SRR12245791.bam
├── SRR12245791.sorted.bam
├── SRR12245792.bam
├── SRR12245792.sorted.bam
├── SRR12245793.bam
├── SRR12245793.sorted.bam
├── SRR12245794.bam
├── SRR12245794.sorted.bam
├── SRR12245795.bam
├── SRR12245795.sorted.bam
├── SRR12245796.bam
├── SRR12245796.sorted.bam
├── SRR12245797.bam
├── SRR12245797.sorted.bam
├── SRR12245798.bam
├── SRR12245798.sorted.bam
├── SRR12245799.bam
├── SRR12245799.sorted.bam
```

### Converting sorted bam files to fastq using script names bam2fq.sh

```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
samtools bam2fq ~/ncbi/mapped-sequences/unmapped-reads/$file.sorted.bam > ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file.fastq
done
```

### Output

```
├── SRR12245789.fastq
├── SRR12245790.fastq
├── SRR12245791.fastq
├── SRR12245792.fastq
├── SRR12245793.fastq
├── SRR12245794.fastq
├── SRR12245795.fastq
├── SRR12245796.fastq
├── SRR12245797.fastq
├── SRR12245798.fastq
└── SRR12245799.fastq
```

### Quality control using fastqc and multiqc using script named fastqc-unmappedreads.sh

```
for file in $(cat ../Raw-Data/SraAccList.txt)
do
fastqc ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file.fastq -o ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/fastqc
done
multiqc ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/fastqc -o ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/fastqc
```

### Output

```
fastqc
     ├── multiqc_data
     │   ├── multiqc_data.json
     │   ├── multiqc_fastqc.txt
     │   ├── multiqc_general_stats.txt
     │   ├── multiqc.log
     │   └── multiqc_sources.txt
     ├── multiqc_report.html
     ├── SRR12245789_fastqc.html
     ├── SRR12245789_fastqc.zip
     ├── SRR12245790_fastqc.html
     ├── SRR12245790_fastqc.zip
     ├── SRR12245791_fastqc.html
     ├── SRR12245791_fastqc.zip
     ├── SRR12245792_fastqc.html
     ├── SRR12245792_fastqc.zip
     ├── SRR12245793_fastqc.html
     ├── SRR12245793_fastqc.zip
     ├── SRR12245794_fastqc.html
     ├── SRR12245794_fastqc.zip
     ├── SRR12245795_fastqc.html
     ├── SRR12245795_fastqc.zip
     ├── SRR12245796_fastqc.html
     ├── SRR12245796_fastqc.zip
     ├── SRR12245797_fastqc.html
     ├── SRR12245797_fastqc.zip
     ├── SRR12245798_fastqc.html
     ├── SRR12245798_fastqc.zip
     ├── SRR12245799_fastqc.html
     └── SRR12245799_fastqc.zip

```
## Step 6: Downloading the ToLCV genomes

### Setup
We downloaded the genomes using the script: retrieving-Begomovirus-genomes.sh

```
for file in $(cat ../Raw-Data/Begomovirus-AccessionList)
do
esearch -db nucleotide -query $file | efetch -format fasta > ~/ncbi/Begomovirus-Genomes/$file.fasta
done
```

### Output
```
.
├── Begomovirus-Genomes
   ├── AB100304.fasta
   ├── AB110218.fasta
   ├── AB116632.fasta
   ├── AF024715.fasta
   ├── AF071228.fasta
   ├── AF105975.fasta
   ├── AF188481.fasta
   ├── AF195782.fasta
   ├── AF271234.fasta
   ├── AF274349.fasta
   ├── AJ223505.fasta
   ├── AJ489258.fasta
   ├── AJ865338.fasta
   ├── AJ865340.fasta
   ├── AM491778.fasta
   ├── AM701758.fasta
   ├── AM701763.fasta
   ├── AM701764.fasta
   ├── AM701765.fasta
   ├── AM701768.fasta
   ├── AM884015.fasta
   ├── AY134494.fasta
   ├── AY297924.fasta
   ├── AY502934.fasta
   ├── AY594174.fasta
   ├── AY602165.fasta
   ├── DQ127170.fasta
   ├── DQ339117.fasta
   ├── DQ519575.fasta
   ├── DQ631892.fasta
   ├── EF060196.fasta
   ├── EF185318.fasta
   ├── EF194760.fasta
   ├── EF450316.fasta
   ├── EF523478.fasta
   ├── EF539831.fasta
   ├── EU350585.fasta
   ├── EU487046.fasta
   ├── EU635776.fasta
   ├── EU862323.fasta
   ├── EU910141.fasta
   ├── FJ685621.fasta
   ├── FM210278.fasta
   ├── GU076440.fasta
   ├── GU325633.fasta
   ├── GU983859.fasta
   ├── HM459851.fasta
   ├── HM991146.fasta
   ├── HQ162270.fasta
   ├── JQ897969.fasta
   ├── JX856172.fasta
   ├── KF150142.fasta
   ├── KF229723.fasta
   ├── KF477277.fasta
   ├── KF551578.fasta
   ├── KF551585.fasta
   ├── KY196216.fasta
   ├── U88692.fasta
   ├── X76319.fasta
   └── Z48182.fasta

```
