# created by John Charles Byrne http://www.linkedin.com/in/johncbyrne
# distributed under the Gnu Public License
# copyright 2015

files=`find . -name "*.jpg" | cut -d\- -f1 | cut -d\/ -f2 | sort | uniq`

for i in $files
do
    echo removing: $i
    rm $i*.jpg
    rm $i*.avi
done
