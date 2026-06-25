#!/bin/bash

PACKAGES=("cpio" "zip" "libunistring" "libidn2" "libpsl" "lmdb" "automake-1.16" "automake-1.18"
	  "cyrus-sasl" "openldap" "nghttp2" "krb5" "libssh2" "c-ares" "brotli" "curl" "git" "pciutils"
	  "hwdata" "libusb" "nettle" "lzo" "libarchive" "docbook-xml" "docbook-xsl-nons" "htop"
	  "libxslt" "docutils" "libndp" "glib" "libnl" "libgudev" "upower" "rustc" "cargo-c"
	  "wpa-supplicant" "duktape" "polkit" "nspr" "nss" "libpng" "libpciaccess" "libdrm"
	  "slang" "newt" "popt" "libqrencode" "libpcap" "libmnl" "libnftnl" "jansson" "iptables"
	  "nftables" "libedit" "pcre2" "swig" "json-c" "keyutils" "openmpi" "pyproject_metadata"
	  "patchelf" "meson_python" "cython" "numpy" "which" "boost" "libnvme" "shared-mime-info"
	  "gdk-pixbuf-stage1" "freetype-stage1" "graphite2" "harfbuzz-stage1" "freetype-stage2"
	  "pixman" "cairo" "harfbuzz-stage2" "fontconfig" "fribidi" "pango" "nasm" "libjpeg-turbo"
	  "libtiff" "little-cms2" "bubblewrap" "giflib" "highway" "libjxl" "graphviz" "vala"
	  "librsvg" "x264" "openjpeg" "x265" "wayland" "wayland-protocols" "vulkan-headers"
	  "vulkan-loader" "mako" "libyaml" "pyyaml" "rust-bindgen" "cbindgen" "spirv-headers"
	  "spirv-tools" "spirv-llvm-translator" "libclc" "libdisplay-info" "libva-round1"
	  "glslang" "mesa" "libva-round2" "libglvnd" "glu" "xkeyboard-config" "libxkbcommon"
	  "systemd-round2" "alsa-lib" "libogg" "libvorbis" "opus" "flac" "libsndfile-round1"
	  "fdk-aac" "lua" "sbc" "libtirpc" "libnsl" "gstreamer" "libical" "lame" "fftw"
	  "libsamplerate" "bluez" "pulseaudio" "pipewire-round1" "wireplumber" "SDL3"
	  "sdl2-compat" "libde265" "mpg123" "libsndfile-round2" "libmbim" "libqmi" "modem-manager"
	  "libcloudproviders" "iso-codes" "libepoxy" "pycairo" "pygobject" "d-bus" "at-spi2-core"
	  "json-glib" "libgusb" "colord" "libevent" "links" "xmlto" "xdg-utils" "libpaper" "cups"
	  "gtk3" "adwaita-icon-theme" "libcanberra" "dbus-python" "libdaemon" "avahi" "libaom"
	  "abseil-cpp" "protobuf" "libuv" "gsettings-desktop-schemas" "libproxy" "glslc" "svt-av1"
	  "mtdev" "libmng" "freeglut" "jasper" "libevdev" "libwacom" "libinput" "double-conversion"
	  "gnutls" "glib-networking" "libvpx" "libsoup" "dav1d" "libheif" "libwebp" "libavif"
	  "glycin" "gdk-pixbuf-stage2" "babl" "gegl" "ghostscript" "libass" "v4l-utils-round1"
	  "ffmpeg" "gst-plugins-base" "gst-plugins-good" "gst-plugins-bad" "qt6" "nodejs"
	  "webencodings" "six" "html5lib" "libgpg-error" "libassuan" "pinentry" "npth" "libksba"
	  "libgcrypt" "gnupg" "gpgme" "gpgmepp" "poppler" "qpdf" "libexif" "libcupsfilters"
	  "libppd" "cups-filters" "qtwebengine" "v4l-utils-round2" "cmake" "mobile-broadband-provider-info"
	  "network-manager" "remove-debug"
)

source ./settings.sh
source ../common.sh

for p in ${PACKAGES[@]}; do
	source $p.sh
	prebuild_common 2 $p || break
	build_common 2 $p || break
	install_common 2 $p || break
done

