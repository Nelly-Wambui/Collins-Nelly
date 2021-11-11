for file in $(cat ../Raw-Data/SraAccList.txt)
do
fastqc ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file.fastq -o ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/fastqc
done
multiqc ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/fastqc -o ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/fastqc
