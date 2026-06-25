export SOURCE_VERSION=v1.2.1
export SOURCE_NAME=xdg-utils-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://gitlab.freedesktop.org/xdg/xdg-utils/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
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

