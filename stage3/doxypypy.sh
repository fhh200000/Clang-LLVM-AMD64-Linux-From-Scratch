export SOURCE_VERSION=0.8.8.7
export SOURCE_NAME=doxypypy-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://files.pythonhosted.org/packages/source/d/doxypypy/${SOURCE_NAME}.tar.gz
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
	pip3 install --no-index --find-links dist --no-user doxypypy
	popd
	return $ret
}

