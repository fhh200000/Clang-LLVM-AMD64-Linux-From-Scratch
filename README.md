# Clang-LLVM-AMD64-Linux-From-Scratch
Scripts to build Clang/LLVM-based (No GCC at all) LFS on AMD64. 
# Package details
| Package name | Package version |
| ----- | ----- |
| LFS | 13.0 Systemd version |
| BLFS | 13.0 Systemd version |
| LLVM | 22.1.5 |
| Glibc | 2.43 |
| zlib-ng | 2.3.3 |
| coreutils-rs | 0.8.0 |

# Build prerequisites
+ Clang/LLVM/LLD
+ libc++
+ patchelf
+ CMake/make
+ meson/ninja
+ flex/bison
+ patch
+ gperf
+ pkgconf
+ Rust
+ wget

# Current status
+ \[x\] Stage 0 (Host compilation)
+ \[x\] Chroot
+ \[x\] Stage 1 (Chroot compilation)
+ \[x\] Boot into LFS
+ \[x\] Stage 2 (Basic software required for a desktop environment)
+ \[ \] Stage 3 -- KDE
