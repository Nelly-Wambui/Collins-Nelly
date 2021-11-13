for file in $(cat  ../Raw-Data/SraAccList.txt)  #Loops through a list of the sequence reads accession number
do
prefetch $file                                  #Download sequence read data
done 
