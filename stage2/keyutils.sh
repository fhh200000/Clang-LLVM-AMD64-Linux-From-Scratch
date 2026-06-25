export SOURCE_VERSION=1.6.3
export SOURCE_NAME=keyutils-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	return 0
}

build() {
	pushd ..
	sed -i 's/-Werror/-Werror -Wno-unused-function/g' Makefile
	LDFLAGS="-Wl,--undefined-version" make -j$(nproc)
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	LDFLAGS="-Wl,--undefined-version" make NO_ARLIB=1 LIBDIR=/usr/lib BINDIR=/usr/bin SBINDIR=/usr/bin install
	ret=$?
	popd
	return $ret
}

