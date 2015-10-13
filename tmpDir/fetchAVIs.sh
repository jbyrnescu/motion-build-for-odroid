cd tmpDir
../rmAllMotionFiles.sh
cd ..
gzip -d fetchTmpDir.tar.gz
tar -xvf fetchTmpDir.tar
cd tmpDir
cpUnrecognized.sh
cd ..
tar -cvf AVIs.tar tmpDir
gzip AVIs.tar
