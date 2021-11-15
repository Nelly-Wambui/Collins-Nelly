for file in $(cat ../Raw-Data/Begomovirus-AccessionList)
do
esearch -db nucleotide -query $file | efetch -format fasta > ~/ncbi/Begomovirus-Genomes/$file.fasta
done
