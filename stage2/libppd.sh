export SOURCE_VERSION=2.1.1
export SOURCE_NAME=libppd-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/OpenPrinting/libppd/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr    \
            --disable-static \
            --with-cups-rundir=/run/cups \
            --disable-mutool             \
	    --enable-ppdc-utils          \
	    --docdir=/usr/share/doc/libcupsfilters-2.1.1
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

