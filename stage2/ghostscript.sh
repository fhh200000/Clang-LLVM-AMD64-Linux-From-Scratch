export SOURCE_VERSION=10.06.0
export SOURCE_NAME=ghostscript-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10060/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://downloads.sourceforge.net/gs-fonts/ghostscript-fonts-std-8.11.tar.gz
	wget https://downloads.sourceforge.net/gs-fonts/gnu-gs-fonts-other-6.0.tar.gz
}

prebuild() {
	pushd ..
	rm -rf freetype lcms2mt jpeg libpng openjpeg zlib
	sed -i "s/-lstdc++/-lc++ -lc++abi/g" configure
	./configure --prefix=/usr           \
            --disable-compile-inits \
            --with-system-libtiff   \
            CFLAGS="${CFLAGS:--g -O3} -fPIC"
	ret=$?
	popd
	return $ret
}

build() {
	pushd ..
	make -j$(nproc) &&
	make -j$(nproc) so
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	make install && 
	make soinstall                                     &&
	/usr/bin/install -v -m644 base/*.h /usr/include/ghostscript &&
	ln -sfvn ghostscript /usr/include/ps
	ret=$?
	tar -xvf ../ghostscript-fonts-std-8.11.tar.gz -C /usr/share/ghostscript --no-same-owner &&
	tar -xvf ../gnu-gs-fonts-other-6.0.tar.gz     -C /usr/share/ghostscript --no-same-owner &&
	fc-cache -v /usr/share/ghostscript/fonts/
	popd
	return $ret
}

