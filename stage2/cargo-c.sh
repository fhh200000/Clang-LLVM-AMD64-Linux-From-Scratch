export SOURCE_VERSION=0.10.23
export SOURCE_NAME=cargo-c-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/lu-zero/cargo-c/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	curl -fLO https://github.com/lu-zero/cargo-c/releases/download/v0.10.23/Cargo.lock
	ret=$?
	popd
	return $ret
}

build() {
	pushd ..
	export LIBSSH2_SYS_USE_PKG_CONFIG=1    &&
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1 &&
	cargo build --release
	ret=$?
	popd
	return $ret
}

install() {
	unset LIB{SSH2,SQLITE3}_SYS_USE_PKG_CONFIG
	/usr/bin/install -vm755 ../target/release/cargo-{capi,cbuild,cinstall,ctest} /usr/bin/
}

