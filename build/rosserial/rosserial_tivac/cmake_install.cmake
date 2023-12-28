# Install script for directory: /Users/alessiature/progetto_workspace/src/rosserial/rosserial_tivac

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/alessiature/progetto_workspace/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Users/alessiature/miniforge3/envs/ros_env/bin/llvm-objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/alessiature/progetto_workspace/build/rosserial/rosserial_tivac/catkin_generated/installspace/rosserial_tivac.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosserial_tivac/cmake" TYPE FILE FILES "/Users/alessiature/progetto_workspace/build/rosserial/rosserial_tivac/catkin_generated/installspace/rosserial_tivac-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosserial_tivac/cmake" TYPE FILE FILES
    "/Users/alessiature/progetto_workspace/build/rosserial/rosserial_tivac/catkin_generated/installspace/rosserial_tivacConfig.cmake"
    "/Users/alessiature/progetto_workspace/build/rosserial/rosserial_tivac/catkin_generated/installspace/rosserial_tivacConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosserial_tivac" TYPE FILE FILES "/Users/alessiature/progetto_workspace/src/rosserial/rosserial_tivac/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosserial_tivac/src" TYPE DIRECTORY FILES
    "/Users/alessiature/progetto_workspace/src/rosserial/rosserial_tivac/src/ros_lib"
    "/Users/alessiature/progetto_workspace/src/rosserial/rosserial_tivac/src/ros_lib_energia"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosserial_tivac" TYPE DIRECTORY FILES "/Users/alessiature/progetto_workspace/src/rosserial/rosserial_tivac/tivac-cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosserial_tivac" TYPE PROGRAM FILES
    "/Users/alessiature/progetto_workspace/src/rosserial/rosserial_tivac/src/rosserial_tivac/make_libraries_energia"
    "/Users/alessiature/progetto_workspace/src/rosserial/rosserial_tivac/src/rosserial_tivac/make_libraries_tiva"
    )
endif()

