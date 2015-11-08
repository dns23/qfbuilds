#
# Install the compiler.
if [ ! -d $HOME/toolchains/gcc-arm-none-eabi-4_9-2015q3/ ]; then
   mkdir -p $HOME/toolchains

   echo "Downloading toolchain..."
   wget -c -nv https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2

   echo "Installing toolchain..."
   bunzip2 gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 
   tar -xf gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar 
   mv gcc-arm-none-eabi-4_9-2015q3 $HOME/toolchains/
   export PATH=$PATH:$HOME/toolchains/gcc-arm-none-eabi-4_9-2015q3/bin/

   echo "System path is now..."
   echo "PATH=$PATH"
fi

#
# Check ARM compiler details
arm-none-eabi-gcc --version
arm-none-eabi-g++ --version
arm-none-eabi-as --version