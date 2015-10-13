ssh odroid@10.0.0.8 "~/checkMotion.sh"
scp odroid@10.0.0.8:~/tmpDir/tmpDir.tar.gz tmpDir
cd tmpDir
gzip -f -d tmpDir.tar.gz
tar -xvf tmpDir.tar
