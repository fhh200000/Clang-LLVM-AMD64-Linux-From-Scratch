export SOURCE_VERSION=1.3.2
export SOURCE_NAME=pinentry-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.gnupg.org/ftp/gcrypt/pinentry/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	sed -i "/FLTK 1/s/3/4/" ../configure   &&
	sed -i '14456 s/1.3/1.4/' ../configure
	../configure --prefix=/usr --enable-pinentry-tty
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

