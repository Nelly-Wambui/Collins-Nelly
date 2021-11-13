#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Convert .bam files to .fastq
samtools bam2fq ~/ncbi/mapped-sequences/unmapped-reads/$file.sorted.bam > ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file.fastq
done
