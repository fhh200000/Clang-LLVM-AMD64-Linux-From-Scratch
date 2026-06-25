export SOURCE_VERSION=0.19.0
export SOURCE_NAME=meson_python-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://files.pythonhosted.org/packages/source/m/meson_python/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	return 0
}
build() {
	pushd ..
	pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir $PWD
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	pip3 install --no-index --find-links dist --no-user meson_python
	popd
	return $ret
}

