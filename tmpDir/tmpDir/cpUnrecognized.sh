# created by John Charles Byrne http://www.linkedin.com/in/johncbyrne
# distributed under the Gnu Public License
# copyright 2015

for i in `ls -1 | grep -v cp | cut -d\- -f1 | sort | uniq`
do
  echo  cp ../$i\-*.avi .
  cp ../$i\-*.avi .
done
