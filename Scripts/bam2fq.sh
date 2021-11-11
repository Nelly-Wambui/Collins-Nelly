for file in $(cat ../Raw-Data/SraAccList.txt)
do
samtools bam2fq ~/ncbi/mapped-sequences/unmapped-reads/$file.sorted.bam > ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file.fastq
done
