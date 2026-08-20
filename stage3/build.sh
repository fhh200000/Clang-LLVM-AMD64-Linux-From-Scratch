#!/bin/bash

PACKAGES=("blfs-systemd-units" "openssh" "extra-cmake-modules" "utfcpp" "taglib" "libmad"
	  "a52dec" "desktop-file-utils" "vlc" "phonon" "phonon-backend-vlc" "polkit-qt"
	  "plasma-wayland-protocols" "libraw" "libatasmart" "libbytesize" "smartmontools"
  	  "libaio" "lvm2" "cryptsetup" "libblockdev" "udisks2" "zxing-cpp" "qca" "libdmtx"
	  "spidermonkey" "gjs" "libsecret" "breeze-icons" "perl-business-isbn-data"
	  "perl-business-isbn" "perl-mime-base32" "perl-uri" "aspell" "chardet" "doxygen"
	  "doxypypy" "doxyqml" "kde-frameworks-6" "ark" "inih" "exiv2" "libkexiv2"
	  "qcoro" "plasma-activities" "plasma-activities-stats" "kdsoap" "kdsoap-ws-discovery-client"
	  "kio-extras" "dolphin" "dolphin-plugins" "fmt" "kddockwidgets" "konsole" "corrosion"
	  "kirigami-addons" "pulseaudio-qt" "qtkeychain" "kquickimageeditor" "libxmlb" "cxx-rust-cssparser"
	  "libfyaml" "lxml" "itstool" "appstream" "libnotify" "geoclue" "fuse"
	  "xdg-desktop-portal" "accountsservice" "power-profiles-daemon" "lm-sensors" "leptonica"
	  "tesseract" "libsass" "opencv" "libqalculate" "cracklib" "libpwquality" "libxcvt"
	  "wayland-protocols" "kde-plasma-6" "clean" "remove-debug")

source ./settings.sh
source ../common.sh

for p in ${PACKAGES[@]}; do
	source $p.sh
	prebuild_common 3 $p || break
	build_common 3 $p || break
	install_common 3 $p || break
done

