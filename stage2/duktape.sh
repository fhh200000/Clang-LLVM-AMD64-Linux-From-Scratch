export SOURCE_VERSION=2.7.0
export SOURCE_NAME=duktape-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://duktape.org/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	return 0
}

build() {
	pushd ..
	sed -i 's/-Os/-O2/' Makefile.sharedlibrary
	make -f Makefile.sharedlibrary INSTALL_PREFIX=/usr
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	make -f Makefile.sharedlibrary INSTALL_PREFIX=/usr install
	ret=$?
	popd
	return $ret
}
