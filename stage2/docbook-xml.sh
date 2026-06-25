export SOURCE_VERSION=4.5
export SOURCE_NAME=docbook-xml-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://archive.docbook.org/xml/${SOURCE_VERSION}/${SOURCE_NAME}.zip
	mkdir ${SOURCE_NAME}
	pushd ${SOURCE_NAME}
	unzip ../${SOURCE_NAME}.zip
	popd 
}

prebuild() {
	return 0
}

build() {
	return 0
}

install() {
	pushd ..
	/usr/bin/install -v -d -m755 /usr/share/xml/docbook/xml-dtd-4.5 &&
	/usr/bin/install -v -d -m755 /etc/xml                           &&
	cp -v -af --no-preserve=ownership                      \
    	catalog.xml docbook.cat *.dtd ent/ *.mod           \
    	/usr/share/xml/docbook/xml-dtd-4.5

	xmlcatalog --noout --add "rewriteSystem"        \
		"http://www.oasis-open.org/docbook/xml/4.5" \
		"file:///usr/share/xml/docbook/xml-dtd-4.5" \
		/usr/share/xml/docbook/xml-dtd-4.5/catalog.xml &&

	xmlcatalog --noout --add "rewriteURI"           \
		"http://www.oasis-open.org/docbook/xml/4.5" \
		"file:///usr/share/xml/docbook/xml-dtd-4.5" \
		/usr/share/xml/docbook/xml-dtd-4.5/catalog.xml

	if [ ! -e /etc/xml/catalog ]; then
		xmlcatalog --noout --create /etc/xml/catalog
	fi &&

	xmlcatalog --noout --add "delegatePublic"                   \
		"-//OASIS//ENTITIES DocBook XML"                        \
		"file:///usr/share/xml/docbook/xml-dtd-4.5/catalog.xml" \
		/etc/xml/catalog                                        &&

	xmlcatalog --noout --add "delegatePublic"                   \
		"-//OASIS//DTD DocBook XML"                             \
		"file:///usr/share/xml/docbook/xml-dtd-4.5/catalog.xml" \
		/etc/xml/catalog                                        &&

	xmlcatalog --noout --add "delegateSystem"                   \
		"http://www.oasis-open.org/docbook/"                    \
		"file:///usr/share/xml/docbook/xml-dtd-4.5/catalog.xml" \
		/etc/xml/catalog                                        &&

	xmlcatalog --noout --add "delegateURI"                      \
		"http://www.oasis-open.org/docbook/"                    \
		"file:///usr/share/xml/docbook/xml-dtd-4.5/catalog.xml" \
		/etc/xml/catalog
	popd

	for DTDVERSION in 4.1.2 4.2 4.3 4.4
	do
	xmlcatalog --noout --add "public"                                  \
		"-//OASIS//DTD DocBook XML V$DTDVERSION//EN"                     \
		"http://www.oasis-open.org/docbook/xml/$DTDVERSION/docbookx.dtd" \
		/usr/share/xml/docbook/xml-dtd-4.5/catalog.xml

	xmlcatalog --noout --add "rewriteSystem"              \
		"http://www.oasis-open.org/docbook/xml/$DTDVERSION" \
		"file:///usr/share/xml/docbook/xml-dtd-4.5"         \
		/usr/share/xml/docbook/xml-dtd-4.5/catalog.xml

	xmlcatalog --noout --add "rewriteURI"                 \
		"http://www.oasis-open.org/docbook/xml/$DTDVERSION" \
		"file:///usr/share/xml/docbook/xml-dtd-4.5"         \
		/usr/share/xml/docbook/xml-dtd-4.5/catalog.xml
	done
}

