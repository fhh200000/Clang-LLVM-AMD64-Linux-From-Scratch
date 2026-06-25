export SOURCE_VERSION=1.59
export SOURCE_NAME=libgpg-error-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	../configure --prefix=/usr --sysconfdir=/etc
}

build() {
	make -j$(nproc)
}

install() {
	make install &&
		/usr/bin/install -v -m644 -D ../README /usr/share/doc/libgpg-error-1.59/README
}

