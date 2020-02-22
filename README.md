# yome2x
Convenient build and package script for [srmd-ncnn-vulkan](https://github.com/nihui/srmd-ncnn-vulkan) high-quality upscaler (Win64)
## Requirement
* Windows 10
* A Vulkan-compatible graphics card and driver
* 300MB free storage space (on top of additional software requirement)
## Usage
1. Install Visual Studio 2019 (C++ components, around __10GB__ in total)
2. Install [CMake](https://cmake.org/download/), with CMake added to user ``PATH``
3. Install [Vulkan SDK](https://vulkan.lunarg.com/sdk/home#sdk/downloadConfirm/latest/windows/vulkan-sdk.exe)
4. Download and extract this repo to a folder, e.g. ``C:\yome-tmp``
5. open up VS2019 Developer Command Prompt
6. ``cd yome-tmp``
7. ``win-build.bat``
8. Everything required should be inside ``yome-tmp\yome2x-w64``
