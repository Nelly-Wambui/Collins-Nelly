path1=~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/kaiju/virus-dna

for file in $(cat ../Raw-Data/SraAccList.txt)
do
blastn -db nt -query $path1/$file.fasta -out $path1/blast-results/$file.out -remote
done 
