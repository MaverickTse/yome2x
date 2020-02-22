@ECHO OFF
cls
mkdir build
cd build
cmake -G"NMake Makefiles" -DCMAKE_INSTALL_PREFIX=Win-x64 ..
nmake
nmake install
robocopy ./Win-x64 ../yome2x-w64 /E
cd ../yome2x-w64
rename srmd-ncnn-vulkan.exe yome2x-w64.exe
cd ..
rd /S/Q build
