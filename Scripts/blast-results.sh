#Assign data directory to a variable
path1=~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/kaiju/virus-dna
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Performs a blastn search of each sequence and saves results to an output file
blastn -db nt -query $path1/$file.fasta -out $path1/blast-results/$file.out -remote
done 
