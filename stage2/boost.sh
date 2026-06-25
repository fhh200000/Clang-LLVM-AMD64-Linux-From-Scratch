export SOURCE_VERSION=1.90.0
export SOURCE_NAME=boost-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/boostorg/boost/releases/download/${SOURCE_NAME}/${SOURCE_NAME}-b2-nodocs.tar.xz
	tar -xf ${SOURCE_NAME}-b2-nodocs.tar.xz
}

prebuild() {
	pushd ..
	./bootstrap.sh --prefix=/usr --with-python=python3
	ret=$?
	popd
	return $ret
}

build() {
	pushd ..
	sed -i 's/vendor = pc ; sys = linux/vendor = unknown ; sys = linux-gnu/g' tools/build/src/tools/clang.jam
	echo "using mpi ;" >> project-config.jam
	./b2 stage -j$(nproc) threading=multi link=shared cxxflags="-I$(realpath .)"
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	./b2 install threading=multi link=shared
	ret=$?
	popd
	return $ret
}

