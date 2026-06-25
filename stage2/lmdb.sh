export SOURCE_VERSION=LMDB_0.9.35
export SOURCE_NAME=openldap-${SOURCE_VERSION}-69087ced3cb6082f7dcfb4fc2dcaa3b68a7e2e8c
export SCRIPT_DIR=$(pwd)

download() {
        wget https://git.openldap.org/openldap/openldap/-/archive/${SOURCE_VERSION}/${SOURCE_VERSION}.tar.gz
	tar -xf ${SOURCE_VERSION}.tar.gz
}

prebuild() {
	return 0
}

build() {
	pushd ../libraries/liblmdb
	sed -i 's/gcc/cc/g' Makefile
	make CFLAGS="" LDFLAGS="" -j$(nproc)
	ret=$?
	sed -i 's| liblmdb.a||' Makefile
	popd
	return $ret
}

install() {
	pushd ../libraries/liblmdb
	make prefix=/usr install
	ret=$?
	popd
	return $ret
}

