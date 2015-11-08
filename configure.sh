#!/usr/bin/env sh

if [ -z ${TOOLCHAIN_DIR+1} ]; then
   export TOOLCHAIN_DIR=$HOME/toolchains
fi

#
# Install the compiler.
if [ ! -d $TOOLCHAIN_DIR/gcc-arm-none-eabi-4_9-2015q3/ ]; then
   mkdir -p $TOOLCHAIN_DIR

   echo "Downloading toolchain..."
   wget -c -nv https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2

   echo "Installing toolchain..."
   bunzip2 gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 
   tar -xf gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar 
   mv gcc-arm-none-eabi-4_9-2015q3 $TOOLCHAIN_DIR
   ls -l $TOOLCHAIN_DIR/gcc-arm-none-eabi-4_9-2015q3/bin
fi
