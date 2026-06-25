export SOURCE_VERSION=1.79.2
export SOURCE_NAME=docbook-xsl-nons-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/docbook/xslt10-stylesheets/releases/download/release/${SOURCE_VERSION}/${SOURCE_NAME}.tar.bz2
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/docbook-xsl-nons-1.79.2-stack_fix-1.patch
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	pushd ..
	patch -Np1 -i ../docbook-xsl-nons-1.79.2-stack_fix-1.patch
	popd
}

build() {
	return 0
}

install() {
	pushd ..
	/usr/bin/install -v -m755 -d /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2 &&

	cp -v -R VERSION assembly common eclipse epub epub3 extensions fo        \
		highlighting html htmlhelp images javahelp lib manpages params  \
		profiling roundtrip slides template tests tools webhelp website \
		xhtml xhtml-1_1 xhtml5                                          \
	/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2 &&

	ln -svf VERSION /usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2/VERSION.xsl &&

	/usr/bin/install -v -m644 -D README \
		/usr/share/doc/docbook-xsl-nons-1.79.2/README.txt &&

	/usr/bin/install -v -m644    RELEASE-NOTES* NEWS* \
		/usr/share/doc/docbook-xsl-nons-1.79.2
	popd


	(set -e
 		/usr/bin/install -v -d -m755 /etc/xml
		[ -e /etc/xml/catalog ] || xmlcatalog --noout --create /etc/xml/catalog

 		for uri in http{,s}://cdn.docbook.org/release/xsl-nons/{1.79.2,current} \
            		http://docbook.sourceforge.net/release/xsl/current; do
 			for rewrite in System URI; do
				xmlcatalog --noout --add "rewrite$rewrite"             \
					"$uri"                                               \
					"/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2" \
					/etc/xml/catalog
			done
		done
	)
}

