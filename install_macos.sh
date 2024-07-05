# MacOS installation script

#!/bin/sh

brew install exiftool jq glfw glew cglm

git clone https://github.com/jtanx/libclipboard
cd libclipboard
cmake .
make -j$(nproc)
sudo make install
cd ..
rm -rf libclipboard

make -f macos.mak -j$(nproc) && sudo make -f macos.mak install