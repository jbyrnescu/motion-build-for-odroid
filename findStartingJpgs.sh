# created by John Charles Byrne http://www.linkedin.com/in/johncbyrne
# distributed under the Gnu Public License
# copyright 2015
videos=`find . -maxdepth 1 -name "*.jpg" | sort | cut -d\- -f1 | uniq`
find . -maxdepth 1 -name "*.jpg" | sort | uniq > jpgs.txt

#set -x

if [ ! -e tmpDir ] 
then
    mkdir tmpDir
fi

echo $videos

for i in $videos 
do
  for j in 2 10 20 30 40
  do
      echo finding current file: ${i}-${j}p
    curFile=`sed -n -e "${j}p" jpgs.txt`
    echo cp $curFile tmpDir
    if [ "$curFile" != "" ] 
      then
        cp $curFile tmpDir
    fi
  done
  cat jpgs.txt | grep -v "${i}\-" > jpgs.txt.tmp
  mv jpgs.txt.tmp jpgs.txt
done

