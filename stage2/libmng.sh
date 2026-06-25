export SOURCE_VERSION=2.0.3
export SOURCE_NAME=libmng-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://downloads.sourceforge.net/libmng/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	pushd ..
	./configure --prefix=/usr --disable-static
	ret=$?
	popd
	return $ret
}

build() {
	pushd ..
	make -j$(nproc)
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	make install
	ret=$?
	/usr/bin/install -v -m755 -d        /usr/share/doc/libmng-2.0.3 &&
	/usr/bin/install -v -m644 doc/*.txt /usr/share/doc/libmng-2.0.3
	popd
	return $ret
}

