export SOURCE_VERSION=3.3.10
export SOURCE_NAME=fftw-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.fftw.org/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr    \
		--enable-shared  \
		--disable-static \
		--enable-threads \
		--enable-sse2    \
		--enable-avx     \
		--enable-avx2  
}

build() {
	make -j$(nproc)
}

install() {
	make install
	make clean &&

	../configure --prefix=/usr    \
            --enable-shared  \
            --disable-static \
            --enable-threads \
            --enable-sse2    \
            --enable-avx     \
            --enable-avx2    \
            --enable-float
	make -j$(nproc)
	make install
	../configure --prefix=/usr    \
            --enable-shared  \
            --disable-static \
            --enable-threads \
            --enable-long-double
	make -j$(nproc)
	make install
}

