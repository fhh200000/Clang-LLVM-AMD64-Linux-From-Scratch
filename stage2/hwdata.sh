export SOURCE_VERSION=0.385
export SOURCE_NAME=hwdata-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/vcrhonek/hwdata/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	./configure --prefix=/usr --disable-blacklist
	ret=$?
	popd
	return $ret
}

build() {
	return 0
}

install() {
	pushd ..
	make install
	ret=$?
	popd
	return $ret
}

