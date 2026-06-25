export SOURCE_VERSION=4.1.1
export SOURCE_NAME=libqrencode-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget  https://github.com/fukuchi/libqrencode/archive/v4.1.1/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	sh autogen.sh
	./configure --prefix=/usr
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
	popd
	return $ret
}

