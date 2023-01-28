#!/bin/bash

if [ ! -f ZELOOTD.z64 ]; then
    echo "Please place rom file ZELOOTD.z64 in this directory and try again"
	exit 1
fi

set -x

cp ZELOOTD.z64 OTRExporter/ZELOOTD.z64

