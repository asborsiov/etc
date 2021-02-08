PATH=$PATH:/usr/local/bin
for ((i=0; i < 2; i++))
do
date -d "$i day ago" | awk '{print $1" "$2" "$3" "$6;}x' >> 1
done

helm ls | grep -v "master\|develop\" | awk '{print $3" "$4" "$5" "$7;}x' > 2

grep -v -f 1 2 > 3

sed -e 's/[0-9][0-9][0-9][0-9]/[0-9][0-9]:[0-9][0-9]:[0-9][0-9] &/' 3 > 4

sed -e 's/ [0-9] / &/' 4 > 5

helm delete $(helm ls | grep -f 5 | grep -v "master\|develop\" | awk '{print $1}') --purge

echo "" > 1 > 2 > 3 > 4 > 5
