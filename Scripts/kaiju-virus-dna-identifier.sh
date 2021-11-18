
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
