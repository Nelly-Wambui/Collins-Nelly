Welcome to our Mini-project

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
#Loops through each file
for file in $(cat  ../Raw-Data/SraAccList.txt)
do
#Download sequence read data
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

We extracted individual .sra file into fastq files using a script named extract-sra.sh

```
#Loops through a list of the sequence reads accession number
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Extract .sra files
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
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Removes adapters, poly-N sequences and filters off low quality reads
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

### Bash script for alignment/mapping of the high-quality reads to the tomato genome named map-sequences.sh

```
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Maps high quality reads to the tomato genome
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
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Convert .sam files to .bam
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
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Extract unmappeed reads and save in new .bam file
samtools view -b -f 12 ~/ncbi/mapped-sequences/$file.bam > ~/ncbi/mapped-sequences/unmapped-reads/$file.bam
done
```

### Sorting bam files with unmapped reads by read name using script named sort-unmappedbam.sh

```
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Sort .bam files with unmapped reads by order of name
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
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Convert .bam files to .fastq
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
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Generate quality check report
fastqc ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file.fastq -o ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/fastqc
done
#Combine multiple quality check reports into one report
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

### De-novo assembly of unmapped reads using megahit using script named denovo-assembly.sh

```
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Perform denovo assembly
megahit --12 ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file.fastq -o ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file-megahitout
done
```

### Output of one sample: SRR12245791-megahitout

```
├── checkpoints.txt
├── done
├── final.contigs.fa
├── intermediate_contigs
│   ├── k119.addi.fa
│   ├── k119.addi.fa.info
│   ├── k119.bubble_seq.fa
│   ├── k119.bubble_seq.fa.info
│   ├── k119.contigs.fa
│   ├── k119.contigs.fa.info
│   ├── k119.final.contigs.fa
│   ├── k119.final.contigs.fa.info
│   ├── k119.local.fa
│   ├── k119.local.fa.info
│   ├── k141.addi.fa
│   ├── k141.addi.fa.info
│   ├── k141.bubble_seq.fa
│   ├── k141.bubble_seq.fa.info
│   ├── k141.contigs.fa
│   ├── k141.contigs.fa.info
│   ├── k141.final.contigs.fa
│   ├── k141.final.contigs.fa.info
│   ├── k21.addi.fa
│   ├── k21.addi.fa.info
│   ├── k21.bubble_seq.fa
│   ├── k21.bubble_seq.fa.info
│   ├── k21.contigs.fa
│   ├── k21.contigs.fa.info
│   ├── k21.final.contigs.fa
│   ├── k21.final.contigs.fa.info
│   ├── k21.local.fa
│   ├── k21.local.fa.info
│   ├── k29.addi.fa
│   ├── k29.addi.fa.info
│   ├── k29.bubble_seq.fa
│   ├── k29.bubble_seq.fa.info
│   ├── k29.contigs.fa
│   ├── k29.contigs.fa.info
│   ├── k29.final.contigs.fa
│   ├── k29.final.contigs.fa.info
│   ├── k29.local.fa
│   ├── k29.local.fa.info
│   ├── k39.addi.fa
│   ├── k39.addi.fa.info
│   ├── k39.bubble_seq.fa
│   ├── k39.bubble_seq.fa.info
│   ├── k39.contigs.fa
│   ├── k39.contigs.fa.info
│   ├── k39.final.contigs.fa
│   ├── k39.final.contigs.fa.info
│   ├── k39.local.fa
│   ├── k39.local.fa.info
│   ├── k59.addi.fa
│   ├── k59.addi.fa.info
│   ├── k59.bubble_seq.fa
│   ├── k59.bubble_seq.fa.info
│   ├── k59.contigs.fa
│   ├── k59.contigs.fa.info
│   ├── k59.final.contigs.fa
│   ├── k59.final.contigs.fa.info
│   ├── k59.local.fa
│   ├── k59.local.fa.info
│   ├── k79.addi.fa
│   ├── k79.addi.fa.info
│   ├── k79.bubble_seq.fa
│   ├── k79.bubble_seq.fa.info
│   ├── k79.contigs.fa
│   ├── k79.contigs.fa.info
│   ├── k79.final.contigs.fa
│   ├── k79.final.contigs.fa.info
│   ├── k79.local.fa
│   ├── k79.local.fa.info
│   ├── k99.addi.fa
│   ├── k99.addi.fa.info
│   ├── k99.bubble_seq.fa
│   ├── k99.bubble_seq.fa.info
│   ├── k99.contigs.fa
│   ├── k99.contigs.fa.info
│   ├── k99.final.contigs.fa
│   ├── k99.final.contigs.fa.info
│   ├── k99.local.fa
│   └── k99.local.fa.info
├── log
└── options.json
```

## Step 6: Verification using kaiju script named kaiju-virus-dna-identifier.sh
### Setup
```
#Assigns data directory to a variable
path1=~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq
#Loops through each de-novo assembled file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Creates a directory for each file
mkdir $path1/kaiju/$file
#Queries each sequence read against Kaiju viruses database and returns the output to a file
kaiju -t $path1/kaiju/bin/kaijuDB/nodes.dmp -f $path1/kaiju/bin/kaijuDB/viruses/kaiju_db_viruses.fmi -i $path1/$file-megahitout/final.contigs.fa -o $path1/kaiju/$file/$file.out
#Extracts the reads which matched virus DNA and assinged code 'C' for 'Classified'
grep 'C' $path1/kaiju/$file/$file.out | cut -f 2 > $path1/kaiju/$file/identifiers.txt
#Creates an empty fasta file
touch $path1/kaiju/virus-dna/$file.fasta
mkdir $path1/kaiju/virus-dna/$file-contigs
#Loops through each sequence read file and extracts all the identified virus DNA
for id in $(cat $path1/kaiju/$file/identifiers.txt)
do
grep -A1 $id" " $path1/$file-megahitout/final.contigs.fa >> $path1/kaiju/virus-dna/$file.fasta
grep -A1 $id" " $path1/$file-megahitout/final.contigs.fa > $path1/kaiju/virus-dna/$file-contigs/$id.fasta
done
echo $file' complete'
done
```

### Output of one of the samples: SRR12245790-contigs
```
├── k141_1100.fasta
├── k141_1149.fasta
├── k141_1257.fasta
├── k141_1265.fasta
├── k141_159.fasta
├── k141_176.fasta
├── k141_180.fasta
├── k141_186.fasta
├── k141_205.fasta
├── k141_236.fasta
├── k141_29.fasta
├── k141_2.fasta
├── k141_308.fasta
├── k141_479.fasta
├── k141_558.fasta
├── k141_604.fasta
├── k141_618.fasta
├── k141_69.fasta
├── k141_710.fasta
├── k141_815.fasta
├── k141_822.fasta
├── k141_889.fasta
├── k141_929.fasta
├── k141_933.fasta
└── k141_939.fasta
```

## Step 7: Blastn for similarity match and virus identification script named blast-results.sh

### Downloading the ToLCV genomes using script named retrieving-Begomovirus-genomes.sh

#### Setup

We downloaded the genomes using the script: retrieving-Begomovirus-genomes.sh

```
#Loops through each file
for file in $(cat ../Raw-Data/Begomovirus-AccessionList)
do
#search for the file accession against nucleotide database, then outputs the match in fasta format and saves in a file
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
### Making Blast Database using downloaded ToLCV genomes

#### Setup

We put all genome files in one file called All_BG_Genomes.fasta

```
#Loops through each file
for file in $(cat list.txt)
do
#open each file and redirects the content to another file containing output of all the sequences
cat $file >> All_BG_Genomes.fasta
done
```

#### Making Database 

##### Setup
```
makeblastdb -in All_BG_Genomes.fasta -out BGdb.out dbtype 'nucl'
```

#### Output
```
├── BGdb.ndb
├── BGdb.nhr
├── BGdb.nin
├── BGdb.not
├── BGdb.nsq
├── BGdb.ntf
├── BGdb.nto
```

### Blastn for each sequence using the blast-results.sh script
```
#Assign data directory to a variable
path1=~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/kaiju
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
mkdir $path1/virus-dna/$file-contigs/blast-results
touch $path1/virus-dna/blast-results/$file-blast-results.txt
for id in $(cat $path1/$file/identifiers.txt)
do
#Performs a blastn search of each sequence and saves results to an output file
blastn -db BGdb -query $path1/virus-dna/$file-contigs/$id.fasta -out $path1/virus-dna/$file-contigs/blast-results/$id.out -max_target_seqs 1 
echo $id >> $path1/virus-dna/blast-results/$file-blast-result.txt
grep '>' $path1/virus-dna/$file-contigs/blast-results/$id.out >> $file-blast-result.txt
done
echo $file' complete'
done 
```

### Output of one of the samples
```
k141_2
k141_29
k141_69
k141_710
k141_1100
k141_815
k141_159
k141_822
k141_479
k141_176
k141_180
k141_186
k141_1149
k141_205
k141_889
k141_236
k141_558
k141_929
k141_933
k141_939
k141_604
k141_618
k141_308
k141_1257
k141_1265
>EF194760.1 Tomato leaf curl Arusha virus isolate AFTT23 segment 
```


## Step 8: Extraction of specific identified begomovirus contigs using the extract-virus-contigs.sh script

### Setup
```
path1=~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/kaiju/virus-dna
for file in $(cat ../Raw-Data/SraAccList.txt)
do
grep -B1 ">" $path1/blast-results/$file-blast-result.txt | head -n 1 > $path1/blast-results/$file-identifiers.txt 
grep -A1 $(cat $path1/blast-results/$file-identifiers.txt) $path1/$file.fasta > $path1/final-blast-contigs/$file.fasta
done 
```
### Output
```
├── SRR12245789.fasta
├── SRR12245790.fasta
├── SRR12245791.fasta
├── SRR12245792.fasta
├── SRR12245793.fasta
├── SRR12245794.fasta
├── SRR12245795.fasta
├── SRR12245796.fasta
├── SRR12245797.fasta
├── SRR12245798.fasta
└── SRR12245799.fasta
```

## Step 9: Protein prediction of ORFs using ORF Finder 

[Link for ORF finder](http://www.ncbi.nlm.nih.gov/projects/gorf)

### Output
```
├── SRR12245789.fa
├── SRR12245790.fa
├── SRR12245791.fa
├── SRR12245792.fa
├── SRR12245793.fa
├── SRR12245794.fa
├── SRR12245795.fa
├── SRR12245796.fa
├── SRR12245797.fa
├── SRR12245798.fa
└── SRR12245799.fa
```

### ORF results of SRR12245790.fa
```
>lcl|ORF5
MPPPKRFQINSKNYFLTYPKCSLNKEEALSQLLNTDTPTNKKFIKICREL
HEDGEPHLHVLIQFEGKFNCKNNRFFDLVSPTRSTHFHPNIQGAKSSSDV
KSYIDKDGDTLEWGEFQIDGRSARGGCHNANDACADALNAGSAEAALAII
REKLPKDFIFQYHNLKCNLERIFTPPFEDYVSPFLSSSFDQVPEELEEWA
AENVVGAAARPLRPMSIVIEGDSRTGKTMWARSLGPHNYLCGHLDLSPKV
YSNNAWYNVIDDVDPHYLKHFKEFMGAQRDWQSNTKYGKPIQIKGGIPTI
FLCNSGPTSSYKEYLDEEKNAQLKAWAIKNAVFFTIQQPLYSSSHQDTTQ
SSQAEAPAEEENRP
```
