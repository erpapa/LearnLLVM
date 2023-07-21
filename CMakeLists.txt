cmake_minimum_required (VERSION 3.8.0)

project("tutorial")
message("Found project tutorial")
set(PROJECT_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_SUPPRESS_REGENERATION FALSE)

find_package(LLVM REQUIRED CONFIG)
message("Found LLVM ${LLVM_PACKAGE_VERSION}, build type ${LLVM_BUILD_TYPE}")
list(APPEND CMAKE_MODULE_PATH ${LLVM_DIR})
llvm_map_components_to_libnames(llvm_libs Core)

add_definitions(${LLVM_DEFINITIONS})
include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})

if(LLVM_COMPILER_IS_GCC_COMPATIBLE)
  if(NOT LLVM_ENABLE_RTTI)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
  endif()
  if(NOT LLVM_ENABLE_EH)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions")
  endif()
endif()

file(GLOB MAIN_SOURCES "${PROJECT_ROOT_DIR}/*.cpp")
file(GLOB ALL_SOURCES "${PROJECT_ROOT_DIR}/src/*.cpp")
file(GLOB ALL_INCLUDES "${PROJECT_ROOT_DIR}/include/*.h")
set(ALL_SRCS ${MAIN_SOURCES} ${ALL_SOURCES} ${ALL_INCLUDES})
source_group(TREE ${PROJECT_ROOT_DIR} FILES ${ALL_SRCS})

include_directories(${PROJECT_ROOT_DIR}/include)
#add_subdirectory(${PROJECT_ROOT_DIR}/src src.out)
set(LINK_LIBS ${llvm_libs})

# 只有在add_executable中的文件才会被source_group分组
#add_library(tutorial STATIC ${ALL_SRCS})
add_executable(tutorial ${ALL_SRCS})
target_link_libraries(tutorial ${LINK_LIBS})
