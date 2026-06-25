export SOURCE_VERSION=6.9.10
export SOURCE_NAME=onig-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/kkos/oniguruma/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	CC="clang --sysroot=$LFS" CXX="clang++ --sysroot=$LFS" \
		../configure --prefix=/usr   \
		--host=$LFS_TGT \
		--build=$(../build-aux/config.guess)
}

build() {
	make -j$(nproc)
}

install() {
	make DESTDIR=$LFS install
}

