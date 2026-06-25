export SOURCE_VERSION=5.4.8
export SOURCE_NAME=lua-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.lua.org/ftp/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/lua-${SOURCE_VERSION}-shared_library-1.patch
}

prebuild() {
	pushd ..
	mkdir overlay
	ln -s /usr/bin/cc overlay/gcc
	ln -s /usr/bin/c++ overlay/g++
	cat > lua.pc << "EOF"
V=5.4
R=5.4.8

prefix=/usr
INSTALL_BIN=${prefix}/bin
INSTALL_INC=${prefix}/include
INSTALL_LIB=${prefix}/lib
INSTALL_MAN=${prefix}/share/man/man1
INSTALL_LMOD=${prefix}/share/lua/${V}
INSTALL_CMOD=${prefix}/lib/lua/${V}
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: Lua
Description: An Extensible Extension Language
Version: ${R}
Requires:
Libs: -L${libdir} -llua -lm -ldl
Cflags: -I${includedir}
EOF
	patch -Np1 -i ../lua-5.4.8-shared_library-1.patch
	popd
}

build() {
	pushd ..
	PATH=${PATH}:$(realpath overlay) make INSTALL_TOP=/usr                \
		INSTALL_DATA="cp -d"            \
		INSTALL_MAN=/usr/share/man/man1 \
		TO_LIB="liblua.so liblua.so.5.4 liblua.so.5.4.8"
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	PATH=${PATH}:$(realpath overlay) make INSTALL_TOP=/usr                \
		INSTALL_DATA="cp -d"            \
		INSTALL_MAN=/usr/share/man/man1 \
		TO_LIB="liblua.so liblua.so.5.4 liblua.so.5.4.8" \
		install
	ret=$?
	mkdir -pv                      /usr/share/doc/lua-5.4.8 &&
	cp -v doc/*.{html,css,gif,png} /usr/share/doc/lua-5.4.8 &&
	/usr/bin/install -v -m644 -D lua.pc /usr/lib/pkgconfig/lua.pc
	popd
	return $ret
}

