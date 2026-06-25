export SOURCE_VERSION=10.47
export SOURCE_NAME=pcre2-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/PCRE2Project/pcre2/releases/download/${SOURCE_NAME}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr                       \
            --docdir=/usr/share/doc/${SOURCE_NAME} \
            --enable-unicode                    \
            --enable-jit                        \
            --enable-pcre2-16                   \
            --enable-pcre2-32                   \
            --enable-pcre2grep-libz             \
            --enable-pcre2grep-libbz2           \
            --enable-pcre2test-libreadline      \
            --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

