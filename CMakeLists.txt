project(srmd-ncnn-vulkan)
cmake_minimum_required(VERSION 3.1)
include(ExternalProject)

# Build Protobuf
ExternalProject_Add(protobuf 
    URL https://github.com/google/protobuf/archive/master.zip
    PREFIX  protobuf
    CMAKE_CACHE_ARGS
        -Dprotobuf_BUILD_TESTS:BOOL=OFF
        -Dprotobuf_MSVC_STATIC_RUNTIME:BOOL=OFF
        -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_CURRENT_BINARY_DIR}/protobuf
        -DCMAKE_BUILD_TYPE:STRING=Release
    SOURCE_SUBDIR   ./cmake
)

# Build NCNN
ExternalProject_Add(ncnn
    URL https://github.com/Tencent/ncnn/archive/master.zip
    PREFIX ncnn
    CMAKE_CACHE_ARGS
        -DNCNN_VULKAN:BOOL=ON
        -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_CURRENT_BINARY_DIR}/ncnn
        -DProtobuf_INCLUDE_DIR:PATH=${CMAKE_CURRENT_BINARY_DIR}/protobuf/include
        -DProtobuf_LIBRARIES:PATH=${CMAKE_CURRENT_BINARY_DIR}/protobuf/lib/libprotobuf.lib
        -DProtobuf_PROTOC_EXECUTABLE:PATH=${CMAKE_CURRENT_BINARY_DIR}/protobuf/bin/protoc.exe
        -DCMAKE_BUILD_TYPE:STRING=Release
    DEPENDS protobuf
)

#Build SRMD-NCNN-Vulkan
ExternalProject_Add(yome2x
    URL https://github.com/nihui/srmd-ncnn-vulkan/archive/master.zip
    PREFIX yome2x
    CMAKE_CACHE_ARGS
        -DCMAKE_BUILD_TYPE:STRING=Release
        -DCMAKE_PREFIX_PATH:PATH=${CMAKE_PREFIX_PATH};${CMAKE_BINARY_DIR}/ncnn/lib/cmake/ncnn
        
    INSTALL_COMMAND ""
    SOURCE_SUBDIR   ./src
    DEPENDS ncnn
)

install(FILES ${CMAKE_BINARY_DIR}/yome2x/src/yome2x-build/srmd-ncnn-vulkan.exe DESTINATION ${CMAKE_INSTALL_PREFIX})
install(FILES ${CMAKE_BINARY_DIR}/yome2x/src/yome2x/images/0.jpg DESTINATION ${CMAKE_INSTALL_PREFIX})
install(FILES ${CMAKE_BINARY_DIR}/yome2x/src/yome2x/README.md DESTINATION ${CMAKE_INSTALL_PREFIX})
install(FILES ${CMAKE_BINARY_DIR}/yome2x/src/yome2x/LICENSE DESTINATION ${CMAKE_INSTALL_PREFIX})
install(DIRECTORY ${CMAKE_BINARY_DIR}/yome2x/src/yome2x/models/models-srmd DESTINATION ${CMAKE_INSTALL_PREFIX})
