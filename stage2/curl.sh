export SOURCE_VERSION=8.18.0
export SOURCE_NAME=curl-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://curl.se/download/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr    \
		--disable-static \
		--with-openssl   \
		--with-ca-path=/etc/ssl/certs
}

build() {
	make -j$(nproc)
}

install() {
	make install &&
	rm -rf docs/examples/.deps &&
	find docs \( -name Makefile\* -o  \
		-name \*.1       -o  \
		-name \*.3       -o  \
		-name CMakeLists.txt \) -delete &&
	cp -v -R docs -T /usr/share/doc/curl-8.18.0
}

