for file in $(cat ../Raw-Data/SraAccList.txt)
do
samtools sort -n ~/ncbi/mapped-sequences/unmapped-reads/$file.bam -o ~/ncbi/mapped-sequences/unmapped-reads/$file.sorted.bam
done
