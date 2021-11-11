for file in $(cat ../Raw-Data/SraAccList.txt)
do 
samtools view -b -o ~/ncbi/mapped-sequences/$file.bam ~/ncbi/mapped-sequences/$file.sam
done
