# based on https://github.com/buresu/ndi-python/blob/master/cmake/Modules/FindNDI.cmake

set(NDI_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libs/include")

if(WIN32)
    if(DEFINED ENV{NDI_SDK_DIR})
        set(NDI_FOUND TRUE)
        set(NDI_DIR $ENV{NDI_SDK_DIR})
        string(REPLACE "\\" "." NDI_DIR "${NDI_DIR}")
        set(NDI_LIBRARY_DIR "${NDI_DIR}/Lib/x64")
        set(NDI_LIBS "Processing.NDI.Lib.x64")
    else()
        set(NDI_FOUND FALSE)
    endif()
elseif(APPLE)
    if(EXISTS "/Library/NDI SDK for Apple/lib/x64/libndi.4.dylib")
        set(NDI_FOUND TRUE)
        set(NDI_DIR "/Library/NDI SDK for Apple")
        set(NDI_LIBRARY_DIR "${NDI_DIR}/lib/x64")
        file(GLOB NDI_LIBS "${NDI_LIBRARY_DIR}/*.dylib")
    else()
        set(NDI_FOUND FALSE)
    endif()
elseif(UNIX AND NOT APPLE)
    if (EXISTS "/usr/lib/libndi.so.4")
        set(NDI_FOUND TRUE)
        set(NDI_LIBRARY_DIR "/usr/lib")
        set(NDI_LIBS "ndi")
    else()
        set(NDI_FOUND FALSE)
    endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(NDI DEFAULT_MSG ${NDI_FOUND})