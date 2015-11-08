#
# Install the compiler.
if [ ! -d ~/toolchains/gcc-arm-none-eabi-4_9-2015q3/ ]; then
   mkdir -p ~/toolchains
   wget -c https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2
   bunzip2 gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 
   tar -xf gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar 
   mv gcc-arm-none-eabi-4_9-2015q3 ~/toolchains/
   export PATH=$PATH:~/toolchains/gcc-arm-none-eabi-4_9-2015q3/bin/
fi