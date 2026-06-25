export SOURCE_VERSION=3.4.0
export SOURCE_NAME=double-conversion-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/google/double-conversion/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr        \
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-D BUILD_SHARED_LIBS=ON             \
		-D BUILD_TESTING=ON                 \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

