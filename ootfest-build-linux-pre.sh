#!/bin/bash
set -x

# Install Dependencies
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git gcc curl python3 cmake lld libpng-dev libglew-dev libsdl2-net-dev libsdl2-dev libx11-dev ninja-build -y

# Install latest SDL
export PATH="/usr/lib/ccache:/usr/local/opt/ccache/libexec:$PATH"
wget https://www.libsdl.org/release/SDL2-2.26.1.tar.gz
tar -xzf SDL2-2.26.1.tar.gz
cd SDL2-2.26.1
./configure
make -j 10
sudo make install
sudo cp -av /usr/local/lib/libSDL* /lib/x86_64-linux-gnu/

# Install latest SDL_net
export PATH="/usr/lib/ccache:/usr/local/opt/ccache/libexec:$PATH"
wget https://www.libsdl.org/projects/SDL_net/release/SDL2_net-2.2.0.tar.gz
tar -xzf SDL2_net-2.2.0.tar.gz
cd SDL2_net-2.2.0
./configure
make -j 10
sudo make install
sudo cp -av /usr/local/lib/libSDL* /lib/x86_64-linux-gnu/
