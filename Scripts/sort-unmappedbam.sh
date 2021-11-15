#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Sort .bam files with unmapped reads by order of name
samtools sort -n ~/ncbi/mapped-sequences/unmapped-reads/$file.bam -o ~/ncbi/mapped-sequences/unmapped-reads/$file.sorted.bam
done
