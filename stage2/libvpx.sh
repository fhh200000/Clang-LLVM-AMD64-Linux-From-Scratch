export SOURCE_VERSION=1.16.0
export SOURCE_NAME=libvpx-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/webmproject/libvpx/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/libvpx-1.16.0-security_fix-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../libvpx-1.16.0-security_fix-1.patch
	popd
	CC=cc CXX=c++ CFLAGS="-march=native -mtune=native -ffunction-sections -fdata-sections" \
		CXXFLAGS="-march=native -mtune=native -ffunction-sections -fdata-sections" \
		LDFLAGS="-Wl,--gc-sections" \
       		../configure --prefix=/usr   \
		--enable-shared \
		--disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

