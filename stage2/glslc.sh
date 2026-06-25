export SOURCE_VERSION=2026.1
export SOURCE_NAME=shaderc-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/google/shaderc/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	sed '/build-version/d'   -i ../glslc/CMakeLists.txt            &&
	sed '/third_party/d'     -i ../CMakeLists.txt                  &&
	sed 's|SPIRV|glslang/&|' -i ../libshaderc_util/src/compiler.cc &&
	echo '"2026.1"' > ../glslc/src/build-version.inc
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D SHADERC_SKIP_TESTS=ON     \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	/usr/bin/install -vm755 glslc/glslc /usr/bin
}

