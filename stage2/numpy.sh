export SOURCE_VERSION=2.4.2
export SOURCE_NAME=numpy-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://files.pythonhosted.org/packages/source/n/numpy/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	return 0
}
build() {
	pushd ..
	pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir -C setup-args=-Dallow-noblas=true $PWD
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	pip3 install --no-index --find-links dist --no-user numpy
	popd
	return $ret
}

