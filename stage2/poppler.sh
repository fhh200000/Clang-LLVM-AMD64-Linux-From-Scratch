export SOURCE_VERSION=26.02.0
export SOURCE_NAME=poppler-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://poppler.freedesktop.org/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://poppler.freedesktop.org/poppler-data-0.4.12.tar.gz
}

prebuild() {
	cmake -D CMAKE_BUILD_TYPE=Release   \
		-D CMAKE_INSTALL_PREFIX=/usr  \
		-D TESTDATADIR=$(realpath ${PWD}/../)/testfiles \
		-D ENABLE_QT5=OFF             \
		-D ENABLE_UNSTABLE_API_ABI_HEADERS=ON \
		-G Ninja ..
}

build() {
	ninja -j$(nproc)
}

install() {
	ninja install
	ret=$?
	tar -xf ../../poppler-data-0.4.12.tar.gz &&
	cd poppler-data-0.4.12
	make prefix=/usr install
	cd ..
}

