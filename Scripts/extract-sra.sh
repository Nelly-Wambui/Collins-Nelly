#Loops through a list of the sequence reads accession number
for file in $(cat ../Raw-Data/SraAccList.txt)                                   
do
#Extract .sra files
fasterq-dump ~/ncbi/public/sra/$file.sra --split-files  --outdir ../Raw-Data   
done
