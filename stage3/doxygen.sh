export SOURCE_VERSION=1.16.1
export SOURCE_NAME=doxygen-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://doxygen.nl/files/${SOURCE_NAME}.src.tar.gz
	tar -xf ${SOURCE_NAME}.src.tar.gz
}

prebuild() {
	grep -rl '^#!.*python$' .. | xargs sed -i '1s/python/&3/'
	cmake -G "Unix Makefiles"          \
		-D CMAKE_BUILD_TYPE=Release  \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D build_wizard=ON           \
		-D force_qt=Qt6              \
		-W no-dev ..
}
build() {
	make -j$(nproc)
}

install() {
	make install
}
