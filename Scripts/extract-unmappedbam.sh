for file in $(cat ../Raw-Data/SraAccList.txt)
do
samtools view -b -f 12 ~/ncbi/mapped-sequences/$file.bam > ~/ncbi/mapped-sequences/unmapped-reads/$file.bam
done
