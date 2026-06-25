export SOURCE_VERSION=3.13.0
export SOURCE_NAME=pciutils-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://mj.ucw.cz/download/linux/pci/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	sed -r '/INSTALL/{/PCI_IDS|update-pciids /d; s/update-pciids.8//}' \
		-i Makefile
	ret=$?
	popd
	return $ret
}

build() {
	pushd ..
	make PREFIX=/usr                \
		SHAREDIR=/usr/share/hwdata \
		SHARED=yes
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	make PREFIX=/usr                \
		SHAREDIR=/usr/share/hwdata \
		SHARED=yes                 \
		install install-lib        
	ret=$?
	chmod -v 755 /usr/lib/libpci.so
	popd
	return $ret
}

