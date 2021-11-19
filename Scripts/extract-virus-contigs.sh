path1=~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/kaiju/virus-dna
for file in $(cat ../Raw-Data/SraAccList.txt)
do
grep -B1 ">" $path1/blast-results/$file-blast-result.txt | head -n 1 > $path1/blast-results/$file-identifiers.txt 
grep -A1 $(cat $path1/blast-results/$file-identifiers.txt) $path1/$file.fasta > $path1/final-blast-contigs/$file.fasta
done 
