export SOURCE_VERSION=0.0.29
export SOURCE_NAME=xmlto-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://pagure.io/xmlto/archive/0.0.29/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	autoreconf -fiv
	sed -i 's/XSLTOPTS=\"\${XSLTPARAMS} \${XSLTOPTS}\"/XSLTOPTS=\"--catalogs \${XSLTPARAMS} \${XSLTOPTS}\"/g' xmlto.in
	sed -i 's/SKIP_VALIDATION=0/SKIP_VALIDATION=1/g' xmlto.in
	popd
	LINKS="/usr/bin/links" ../configure --prefix=/usr
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

