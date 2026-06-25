export SOURCE_VERSION=4.1
export SOURCE_NAME=x265_${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://bitbucket.org/multicoreware/x265_git/downloads/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	sed -r '/cmake_policy.*(0025|0054)/d' -i ../source/CMakeLists.txt
	cmake -D CMAKE_INSTALL_PREFIX=/usr        \
		-D GIT_ARCHETYPE=1                  \
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-W no-dev                           \
		../source
}

build() {
	make -j$(nproc)
}

install() {
	make install
	rm -vf /usr/lib/libx265.a
}

