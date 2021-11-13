#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
#Extract unmappeed reads and save in new .bam file
samtools view -b -f 12 ~/ncbi/mapped-sequences/$file.bam > ~/ncbi/mapped-sequences/unmapped-reads/$file.bam
done
