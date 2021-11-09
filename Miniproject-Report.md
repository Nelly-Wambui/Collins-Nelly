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
