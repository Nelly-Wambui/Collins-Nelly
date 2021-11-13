#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Maps high quality reads to the tomato genome
bowtie2 -x ~/Nelly/Tomato-Genome/tomato_t15 -1 ~/ncbi/fastp-qc/out$file.sra_1.fastq -2 ~/ncbi/fastp-qc/out$file.sra_2.fastq -S ~/ncbi/mapped-sequences/out$file.sam
done
