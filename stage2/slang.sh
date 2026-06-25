export SOURCE_VERSION=2.3.3
export SOURCE_NAME=slang-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://www.jedsoft.org/releases/slang/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	pushd ..
	LDFLAGS="-Wl,--undefined-version" ./configure --prefix=/usr       \
		--sysconfdir=/etc   \
		--with-readline=gnu
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
	make install_doc_dir=/usr/share/doc/slang-2.3.3   \
		SLSH_DOC_DIR=/usr/share/doc/slang-2.3.3/slsh \
		RPATH= install
	ret=$?
	popd
	return $ret
}

