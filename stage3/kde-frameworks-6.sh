#!/bin/bash

export SOURCE_VERSION="6.27"
export SOURCE_NAME=kde-frameworks-6-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	mkdir -p kde-frameworks-6-${SOURCE_VERSION}
	pushd kde-frameworks-6-${SOURCE_VERSION}
	wget -r -nH -nd -A '*.xz' -np https://download.kde.org/stable/frameworks/${SOURCE_VERSION}/
	cat > ../frameworks-${SOURCE_VERSION}.0.md5 << "EOF"
1d894e1d2c9921dc10d90bdc960f579d  attica-6.27.0.tar.xz
#cf3e1cb18cb1ab27ed748fe54b5f96b5  extra-cmake-modules-6.27.0.tar.xz
f6525f6ba7f1d56003144c545fe50dc0  kapidox-6.27.0.tar.xz
4577568ead873840c33605a6a2f8e6bf  karchive-6.27.0.tar.xz
6e8b5074a386196a4b6a5cdebb181a31  kcodecs-6.27.0.tar.xz
d7f8374dffaaf1834bbd2abdd0de8600  kconfig-6.27.0.tar.xz
e84b56d5e9d12c9feae4aff47fb257c2  kcoreaddons-6.27.0.tar.xz
00ab246c8f1c590c5440bcb0772c9dcd  kdbusaddons-6.27.0.tar.xz
c0237c0b6409b6343dfd5ca8e47154a3  kdnssd-6.27.0.tar.xz
e78314359500c3c3717d3be86ff6ce0b  kguiaddons-6.27.0.tar.xz
7c50a1a36840652a3fa2f55f9dec27ec  ki18n-6.27.0.tar.xz
834a1574f188247668dc1eff247baf5f  kidletime-6.27.0.tar.xz
e1ca0e24b75b11080c915ccdcbb1fe50  kimageformats-6.27.0.tar.xz
206c0d4a4ca89c2b07b5ead926844c4f  kitemmodels-6.27.0.tar.xz
b9895c58b69c8b0224bfa6a24421b760  kitemviews-6.27.0.tar.xz
229153343490f2599138c7f49f826dcd  kplotting-6.27.0.tar.xz
64172297c51e16d7f85f6899aefcfc87  kwidgetsaddons-6.27.0.tar.xz
ce6b0ef1e7aec55adc21aff4b294c07c  kwindowsystem-6.27.0.tar.xz
0d24650972e660b37dc70f682efc208d  networkmanager-qt-6.27.0.tar.xz
f6faa25294da0f9a67a89789d67746f9  solid-6.27.0.tar.xz
1bd2bc1615e428a3454154d2319aa498  sonnet-6.27.0.tar.xz
24fc314e9eeaa8373bde7885c1f926b1  threadweaver-6.27.0.tar.xz
2bfde5692f8a414ecc7003991331367a  kauth-6.27.0.tar.xz
1ff0243e69c1138c77136cf13359172e  kcompletion-6.27.0.tar.xz
0e5065cf59454f7351aea79de533eeaa  kcrash-6.27.0.tar.xz
1184e8571b08469002e0e6e4142000e1  kdoctools-6.27.0.tar.xz
1666fce053297ac34a222fd1a8f48a82  kpty-6.27.0.tar.xz
a59469540968b5e5fa2e4f5542bf15e8  kunitconversion-6.27.0.tar.xz
8a4d471df4dcaa3db3309e673ae19a05  kcolorscheme-6.27.0.tar.xz
084fba8efb1268f89ab21fd32da85404  kconfigwidgets-6.27.0.tar.xz
e948c615adcfbbddda25031eb434ac5e  kservice-6.27.0.tar.xz
1cb340ed8ec7a6f0fda482ebb905ec99  kglobalaccel-6.27.0.tar.xz
7ef43e27d2bf72da17a1cea0e071e8aa  kpackage-6.27.0.tar.xz
e8fe29c7e05a046c5546a7d24ca74568  kdesu-6.27.0.tar.xz
e34b9fcafc7313cf93f5d0a6af19b718  kiconthemes-6.27.0.tar.xz
2a6bc3a1a45df8e586c663cb8e901d63  knotifications-6.27.0.tar.xz
2fb66cb0f11fb1ef92e36f87c9f9102a  kjobwidgets-6.27.0.tar.xz
97c7c08ca39f79b23f7b78de66b63809  kmime-6.27.0.tar.xz
776e5226abccc922208c2dcb7b6544d3  ktextwidgets-6.27.0.tar.xz
1be754881c4fe99dbe2cb2e4cdf87225  kxmlgui-6.27.0.tar.xz
47a7f341d587470f8caf732c0976c07e  kbookmarks-6.27.0.tar.xz
719366c165fa55bd2f61718154a98b56  kwallet-6.27.0.tar.xz
a0482c6dfbfd78dfdc7fc2bff743981c  kded-6.27.0.tar.xz
47a25c75c50bb66d5a7205f5a84c8d5f  kio-6.27.0.tar.xz
09b7a6f666ae4157b7ed2097478945dc  kdeclarative-6.27.0.tar.xz
ae1d82d0bef7355e45c2629d7a0870d9  kirigami-6.27.0.tar.xz
4b9c47880d66fea2faa5664c603d633b  kcmutils-6.27.0.tar.xz
adb843abfc7847a75f249bed2cfb32c9  syndication-6.27.0.tar.xz
a74f0d2764a281d46a0c81bd0e869274  knewstuff-6.27.0.tar.xz
0129f08d97ecc1efd0c17b1951ac8632  frameworkintegration-6.27.0.tar.xz
8a6fd0386cf611c90a392510a204e876  kparts-6.27.0.tar.xz
bc5a9048197d126746359ab99c0fcd5b  syntax-highlighting-6.27.0.tar.xz
05641079ddad2ef15ffb98be99d437e6  ktexteditor-6.27.0.tar.xz
a7465b323d28324432e03d0fd4be499e  modemmanager-qt-6.27.0.tar.xz
5d12e870ab660ea7e364ac96b23c4f03  kcontacts-6.27.0.tar.xz
d110058ad6a2123a84503a22862412c1  kpeople-6.27.0.tar.xz
29237a0593f62d94372b28446faf53bf  bluez-qt-6.27.0.tar.xz
a2874135f302df42b2f3431eec2442d0  kfilemetadata-6.27.0.tar.xz
f565416fd20bbf8949400db78444b7fc  baloo-6.27.0.tar.xz
#bb43e03226b54361c1ffef23dc107be3  breeze-icons-6.27.0.tar.xz
4dee7f526adf1978ce930352d5920aa0  krunner-6.27.0.tar.xz
1c805f43039afa760cd84cad3903c36b  prison-6.27.0.tar.xz
bca22ebc8c07c063ecaf62722e3ce43e  qqc2-desktop-style-6.27.0.tar.xz
767ab6c6e6db3e2ed44ab6df21ddb0d1  kholidays-6.27.0.tar.xz
fe7fe6676662b72d4f2c28a34cb3e2eb  purpose-6.27.0.tar.xz
d0d91dafa4da67c0e59dfb77053ea718  kcalendarcore-6.27.0.tar.xz
23f49b823f6c2d89e4ef525d764cf327  kquickcharts-6.27.0.tar.xz
10c03c38487dd29a6595b97317c57651  knotifyconfig-6.27.0.tar.xz
e568f6bf6f522da51103e78432596dd3  kdav-6.27.0.tar.xz
af2c5c7276497bdcacfabe6a4577585f  kstatusnotifieritem-6.27.0.tar.xz
2f0949b05f1d9142cbb70c70820df2f6  ksvg-6.27.0.tar.xz
13fe849a841804a31a220d2bdec034af  ktexttemplate-6.27.0.tar.xz
2cea2124692ca489bade73cfb5c3326d  kuserfeedback-6.27.0.tar.xz
EOF
	popd
}

prebuild() {	
	return 0
}

build() {
	while read -r line; do
		if [ -z "$line" ]; then continue; fi
		# Get the file name, ignoring comments and blank lines
		file=$(echo $line | cut -d" " -f2)
		if $(echo $line | grep -E -q '^ *$|^#' ); then
			echo "==> Package ${file} SKIP"
			continue
		fi

		pkg=$(echo $file|sed 's|^.*/||')          # Remove directory
		packagedir=$(echo $pkg|sed 's|\.tar.*||') # Package directory

		name=$(echo $pkg|sed 's|-6.*$||') # Isolate package name
		echo "==> Package ${file} BEGIN"

		rm -rf $packagedir
		tar -xf ../$file
		pushd $packagedir
		# kapidox is a python module
		case $name in
			kapidox)
				pip3 install requests
				pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir $PWD
				pip3 install --no-index --find-links dist --no-user kapidox
			popd
			rm -rf $packagedir
			sed -i "s/${line}/#${line}/g" ../frameworks-${SOURCE_VERSION}.0.md5
			continue
			;;
		esac
		mkdir build
	       	cd    build

		cmake -D CMAKE_INSTALL_PREFIX=/usr          \
			-D CMAKE_INSTALL_LIBEXECDIR=libexec \
			-D CMAKE_PREFIX_PATH=/usr           \
			-D CMAKE_SKIP_INSTALL_RPATH=ON      \
			-D CMAKE_BUILD_TYPE=Release         \
			-D BUILD_TESTING=OFF                \
			-D BUILD_PYTHON_BINDINGS=OFF        \
			-D WITH_X11=OFF                     \
			-D KWINDOWSYSTEM_X11=OFF            \
			-W no-dev ..
		ret=$?
		if [ $ret -ne 0 ]; then
			popd
			return $ret
		fi
		make -j$(nproc)
		ret=$?
		if [ $ret -ne 0 ]; then
			popd
			return $ret
		fi
		make install
		ret=$?
		if [ $ret -ne 0 ]; then
			popd
			return $ret
		fi

		popd
		rm -rf $packagedir
		sed -i "s/${line}/#${line}/g" ../frameworks-${SOURCE_VERSION}.0.md5
	done < ../frameworks-${SOURCE_VERSION}.0.md5
}

install() {
	return 0
}

