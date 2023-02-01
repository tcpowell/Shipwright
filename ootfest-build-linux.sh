#!/bin/bash

read -p "Have you updated the ootfest repository (should be cloned to ~/git/ootfest)? Press any key to continue."

if [ ! -f ZELOOTD.z64 ]; then
    echo "Please place rom file ZELOOTD.z64 in this directory and try again"
	exit 1
fi

if [ ! -f ../ootfest/shipofharkinian.json ]; then
    echo "Could not find ootfest repository (should be cloned to ~/git/ootfest)"
	exit 1
fi

set -x

# Copy ROM to directory
cp ZELOOTD.z64 OTRExporter/ZELOOTD.z64

# If you need to clean the project you can run
cmake --build build-cmake --target clean

# Generate Ninja project
cmake -H. -Bbuild-cmake -GNinja -DCMAKE_BUILD_TYPE:STRING=Release

# Extract assets & generate OTR (run this anytime you need to regenerate OTR)
cmake --build build-cmake --target ExtractAssets

# Compile the project
cmake --build build-cmake --config Release

# Copy Icon File
cp soh/sohIcon.png build-cmake/sohIcon.png

# Go to build folder
cd build-cmake

# Generate
cpack -G External

cd ..

# Move the appimage back to root
mv build-cmake/*.appimage ../ootfest/soh.appimage

# Cleanup
rm -rf _packages/

# Copy OTR (for local testing)
cp oot.otr ../ootfest/oot.otr

# Manually copy soh.appimage over to be committed
