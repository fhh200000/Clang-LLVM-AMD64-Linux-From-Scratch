export SOURCE_VERSION=4.20.1
export SOURCE_NAME=iso-codes-v${SOURCE_VERSION}-74623235ae99f6e835e1e465017ce4c544ae6b53
export SCRIPT_DIR=$(pwd)

download() {
        wget https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v${SOURCE_VERSION}/iso-codes-${SOURCE_VERSION}.tar.gz
	tar -xf iso-codes-${SOURCE_VERSION}.tar.gz
}

prebuild() {
	meson setup --prefix=/usr ..
}

build() {
	ninja
}

install() {
	ninja install
}

