for file in $(cat  ../Raw-Data/SraAccList.txt)
do
prefetch $file
done
