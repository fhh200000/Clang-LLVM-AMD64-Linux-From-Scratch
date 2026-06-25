export SOURCE_VERSION=8.0.1
export SOURCE_NAME=ffmpeg-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://ffmpeg.org/releases/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/ffmpeg-8.0.1-chromium_method-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../ffmpeg-8.0.1-chromium_method-1.patch
	sed -e '/adaptive/c\ param->aq_mode = 0;' -i libavcodec/libsvtav1.c
	popd
	../configure --prefix=/usr        \
            --enable-gpl         \
	    --cc=cc		 \
	    --cxx=c++            \
            --enable-version3    \
            --enable-nonfree     \
            --disable-static     \
            --enable-shared      \
            --disable-debug      \
            --enable-libaom      \
            --enable-libass      \
	    --enable-libdav1d    \
	    --enable-libdrm     \
            --enable-libfdk-aac  \
            --enable-libfreetype \
            --enable-libmp3lame  \
            --enable-libopus     \
            --enable-libvorbis   \
            --enable-libvpx      \
            --enable-libx264     \
            --enable-libx265     \
            --enable-openssl     \
            --enable-libdav1d    \
            --enable-libsvtav1   \
	    --enable-libpulse    \
            --ignore-tests=enhanced-flv-av1,enhanced-flv-multitrack \
	    --docdir=/usr/share/doc/${SOURCE_NAME}
}

build() {
	make -j$(nproc) && cc ../tools/qt-faststart.c -o ../tools/qt-faststart
}

install() {
	make install && /usr/bin/install -v -m755    ../tools/qt-faststart /usr/bin
}

