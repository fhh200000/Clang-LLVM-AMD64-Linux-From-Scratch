export SOURCE_VERSION=4.38.2
export SOURCE_NAME=nspr-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://archive.mozilla.org/pub/nspr/releases/v${SOURCE_VERSION}/src/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	sed -i '/^RELEASE/s|^|#|' ../nspr/pr/src/misc/Makefile.in &&
	sed -i 's|$(LIBRARY) ||'  ../nspr/config/rules.mk         &&

	../nspr/configure --prefix=/usr   \
		--with-mozilla  \
		--with-pthreads \
		--enable-64bit
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

