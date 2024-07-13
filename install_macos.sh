#!/bin/sh
# MacOS installation script

brew install exiftool jq glfw glew cglm

git clone https://github.com/jtanx/libclipboard
cd libclipboard
cmake .
make -j$(nproc)
sudo make install
cd ..
rm -rf libclipboard

make -B -f macos.mak -j$(nproc) && sudo make -f macos.mak install