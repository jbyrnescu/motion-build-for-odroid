LIBDIRS= -L /usr/lib/arm-linux-gnueabihf/alsa-lib
LIBS=-lasound
FFMPEGDIR=ffmpeg
MOTIONDIR=motion/trunk

all: ffmpeg motion

ffmpeg: /usr/local/bin/ffmpeg

/usr/local/bin/ffmpeg: ${FFMPEGDIR}/ffmpeg.c
	echo FFMPEGDIR = ${FFMPEGDIR}
	date > ffmpegCompileStartTime.txt; \
	cd ffmpeg; ./configure; \
	make ffmpeg; \
	make install; \
	date > ffmpegCompileEndTime.txt

${FFMPEGDIR}/ffmpeg.c: /usr/bin/git
	git clone git://source.ffmpeg.org/ffmpeg.git --branch release/2.6 --single-branch ffmpeg;

motion: ${MOTIONDIR}/motion.o /usr/lib/arm-linux-gnueabihf/libz.a
	echo motion compile complete

${MOTIONDIR}/motion.c: ${MOTIONDIR}/config.h

${MOTIONDIR}/config.h: /usr/bin/svn
	if ! [ -d motion ]; \
	then \
		mkdir motion; \
	fi; \
	cd motion; \
	svn co http://www.lavrsen.dk/svn/motion/trunk; \
	cd trunk; \
	./configure

${MOTIONDIR}/motion.o: ${MOTIONDIR}/motion.c
	date > motionCompileStartTime.txt; \
	cd ${MOTIONDIR}; \
	sed -i -e 's/\(^LIBS.*\)/\1 -lswresample -lva/' Makefile; \
	make motion; \
	date > motionCompileEndTime.txt

/usr/bin/git:
	sudo apt-get -q -y install git

/usr/bin/svn: 
	sudo apt-get -q -y install subversion

libjpeg8:
	sudo apt-get -q -y install libjpeg8


/usr/lib/arm-linux-gnueabihf/libz.a:
	sudo apt-get -q -y install zlib1g-dev

alsaCapture: alsaCapture.c
	gcc -o alsaCapture alsaCapture.c ${LIBS} ${LIBDIRS}

.SUFFIXES: .c .o

.c.o:
	echo no compile needed at this stage
