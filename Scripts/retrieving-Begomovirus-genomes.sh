#Loops through each file
for file in $(cat ../Raw-Data/Begomovirus-AccessionList)
do
#search for the file accession against nucleotide database, then outputs the match in fasta format and saves in a file
esearch -db nucleotide -query $file | efetch -format fasta > ~/ncbi/Begomovirus-Genomes/$file.fasta
done
