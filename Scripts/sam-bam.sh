#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do 
#Convert .sam files to .bam
samtools view -b -o ~/ncbi/mapped-sequences/$file.bam ~/ncbi/mapped-sequences/$file.sam
done
