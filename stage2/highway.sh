export SOURCE_VERSION=1.3.0
export SOURCE_NAME=highway-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/google/highway/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D BUILD_TESTING=OFF         \
		-D BUILD_SHARED_LIBS=ON      \
		-G Ninja .. 
}

build() {
	ninja
}

install() {
	ninja install
}

