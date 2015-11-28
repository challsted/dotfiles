#!/usr/bin/env bash

# Set Version of Mutt (hard code for now work on variable later)
# 1.5.24
MUTT_VERSION="mutt-1.5.24"
VANINLLA_MUTT="https://bitbucket.org/mutt/mutt/downloads/mutt-1.5.24.tar.gz"
PATCH_SIDEBAR="http://lunar-linux.org/~tchan/mutt/patch-1.5.24.sidebar.20151111.txt"
PATCH_TRASHCAN="http://cedricduval.free.fr/mutt/patches/download/patch-1.5.5.1.cd.trash_folder.3.4"

TEMP_MUTT="$HOME/Downloads/tempMutt"

if [ ! -d "$TEMP_MUTT" ]; then
    mkdir -p $TEMP_MUTT
fi
cd $TEMP_MUTT
wget -q -O - $VANINLLA_MUTT | tar -xfz -
cd $MUTT_VERSION
# download patches (Convert this to a loop!)
wget -q -O $PATCH_SIDEBAR | patch -p1
# Compile Mutt
./configure
make
./mutt
# Install Mutt
sudo make install
# Add Later: Optional Compile Flags
