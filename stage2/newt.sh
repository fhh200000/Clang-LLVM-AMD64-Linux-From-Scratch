export SOURCE_VERSION=0.52.25
export SOURCE_NAME=newt-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://releases.pagure.org/newt/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	sed -e '/install -m 644 $(LIBNEWT)/ s/^/#/' \
		-e '/$(LIBNEWT):/,/rv/ s/^/#/'          \
		-e 's/$(LIBNEWT)/$(LIBNEWTSH)/g'        \
    		-i Makefile.in
	./configure --prefix=/usr      \
            --with-gpm-support
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

