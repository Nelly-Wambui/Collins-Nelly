#Loops through each file
for file in $(cat  ../Raw-Data/SraAccList.txt)  
do
#Download sequence read data
prefetch $file                                  
done 
