export SOURCE_VERSION=2.0.1
export SOURCE_NAME=cups-filters-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/OpenPrinting/cups-filters/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/cups-filters-2.0.1-security_fix-1.patch
}

prebuild() {
	pushd ..
	sed -i '/proc_func)()/s/()/(FILE*, FILE*, void*)/' filter/foomatic-rip/process.h
	patch -Np1 -i ../cups-filters-2.0.1-security_fix-1.patch
	popd
	../configure --prefix=/usr    \
            --disable-static \
	    --disable-mutool \
            --docdir=/usr/share/doc/${SOURCE_NAME}
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

