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
+ \[x\] Stage 3 -- KDE

# Screenshot
<img width="1740" height="1106" alt="setup" src="https://github.com/user-attachments/assets/24640234-d0f6-4acd-b887-aed9e9b62700" />
<img width="2062" height="1460" alt="welcome" src="https://github.com/user-attachments/assets/f70f665b-ab28-48b8-ba19-57fb20bc1081" />
