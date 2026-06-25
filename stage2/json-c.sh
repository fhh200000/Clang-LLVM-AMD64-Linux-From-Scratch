export SOURCE_VERSION=0.18
export SOURCE_NAME=json-c-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://s3.amazonaws.com/json-c_releases/releases/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	sed -i 's/VERSION 2.8/VERSION 4.0/' ../apps/CMakeLists.txt  &&
	sed -i 's/VERSION 3.9/VERSION 4.0/' ../tests/CMakeLists.txt
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D BUILD_STATIC_LIBS=OFF     \
		..
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

