path1=~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq
for file in $(cat ../Raw-Data/SraAccList.txt)
do
mkdir $path1/kaiju/$file
kaiju -t $path1/kaiju/bin/kaijuDB/nodes.dmp -f $path1/kaiju/bin/kaijuDB/viruses/kaiju_db_viruses.fmi -i $path1/$file-megahitout/final.contigs.fa -o $path1/kaiju/$file/$file.out
grep 'C' $path1/kaiju/$file/$file.out | cut -f 2 > $path1/kaiju/$file/identifiers.txt
touch $path1/kaiju/virus-dna/$file.fasta
for id in $(cat $path1/kaiju/$file/identifiers.txt)
do
grep -A1 $id $path1/$file-megahitout/final.contigs.fa >> $path1/kaiju/virus-dna/$file.fasta
done
done 
