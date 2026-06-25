export SOURCE_VERSION=2.30
export SOURCE_NAME=links-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget http://links.twibright.com/download/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	sed '/*strchr/s/cast_const_char //g' -i ../ftp.c
	../configure --prefix=/usr --mandir=/usr/share/man
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

