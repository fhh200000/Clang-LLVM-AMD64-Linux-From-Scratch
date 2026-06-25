export SOURCE_VERSION=1.1
export SOURCE_NAME=html5lib-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://files.pythonhosted.org/packages/source/h/html5lib/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/html5lib-1.1-python_3.14_buildfix-1.patch
}

prebuild() {
	return 0
}
build() {
	pushd ..
	patch -Np1 -i ../html5lib-1.1-python_3.14_buildfix-1.patch
	sed -i 's/from pkg_resources import/from packaging.version import parse as/' setup.py &&
		sed -i 's/import pkg_resources/pkg_resources = None/' setup.py
	pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir $PWD
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	pip3 install --no-index --find-links dist --no-user html5lib
	popd
	return $ret
}

