export SOURCE_VERSION=22.1.5
export SOURCE_NAME=libclc-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/llvm/llvm-project/releases/download/llvmorg-${SOURCE_VERSION}/llvm-project-${SOURCE_VERSION}.src.tar.xz
	tar -xf llvm-project-${SOURCE_VERSION}.src.tar.xz
	cp -rf llvm-project-${SOURCE_VERSION}.src/libclc ${SOURCE_NAME}
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr     \
		-D CMAKE_BUILD_TYPE=Release      \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

