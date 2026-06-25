export SOURCE_VERSION=1.3.14
export SOURCE_NAME=graphite2-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/silnrsi/graphite/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tgz
	tar -xf ${SOURCE_NAME}.tgz
}

prebuild() {
	pushd ..
	sed -i '/cmake_policy(SET CMP0012 NEW)/d' CMakeLists.txt &&
	sed -i 's/PythonInterp/Python3/' CMakeLists.txt          &&
	find . -name CMakeLists.txt | xargs sed -i 's/VERSION 2.8.0 FATAL_ERROR/VERSION 4.0.0/'
	sed -i '/Font.h/i #include <cstdint>' tests/featuremap/featuremaptest.cpp
	popd
	cmake -D CMAKE_INSTALL_PREFIX=/usr ..
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

