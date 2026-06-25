export SOURCE_VERSION=2.1.1
export SOURCE_NAME=libcupsfilters-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/OpenPrinting/libcupsfilters/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/libcupsfilters-2.1.1-security_fixes-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../libcupsfilters-2.1.1-security_fixes-1.patch
	popd
	../configure --prefix=/usr    \
            --disable-static \
	    --disable-mutool \
            --docdir=/usr/share/doc/libcupsfilters-2.1.1
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

