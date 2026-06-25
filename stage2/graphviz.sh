export SOURCE_VERSION=14.1.2
export SOURCE_NAME=graphviz-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.com/graphviz/graphviz/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	sed '/ORIGIN/d' -i ../lib/CMakeLists.txt
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		..                           &&
		
	sed -i '/GZIP/s/:.*$/=/' CMakeCache.txt
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

