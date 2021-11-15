#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do 
#Perform denovo assembly
megahit --12 ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file.fastq --k-list 15 -o ~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/$file-megahitout 
done
