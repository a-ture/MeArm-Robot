# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Users/alessiature/miniforge3/envs/ros_env/bin/cmake

# The command to remove a file.
RM = /Users/alessiature/miniforge3/envs/ros_env/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/alessiature/progetto_workspace/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/alessiature/progetto_workspace/build

# Utility rule file for vision_pkg_generate_messages_py.

# Include any custom commands dependencies for this target.
include vision_pkg/CMakeFiles/vision_pkg_generate_messages_py.dir/compiler_depend.make

# Include the progress variables for this target.
include vision_pkg/CMakeFiles/vision_pkg_generate_messages_py.dir/progress.make

vision_pkg/CMakeFiles/vision_pkg_generate_messages_py: /Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg/_GeometricShape.py
vision_pkg/CMakeFiles/vision_pkg_generate_messages_py: /Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg/__init__.py

/Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg/_GeometricShape.py: /Users/alessiature/miniforge3/envs/ros_env/lib/genpy/genmsg_py.py
/Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg/_GeometricShape.py: /Users/alessiature/progetto_workspace/src/vision_pkg/msg/GeometricShape.msg
/Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg/_GeometricShape.py: /Users/alessiature/miniforge3/envs/ros_env/share/geometry_msgs/msg/Point.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/alessiature/progetto_workspace/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating Python from MSG vision_pkg/GeometricShape"
	cd /Users/alessiature/progetto_workspace/build/vision_pkg && ../catkin_generated/env_cached.sh /Users/alessiature/miniforge3/envs/ros_env/bin/python3.9 /Users/alessiature/miniforge3/envs/ros_env/share/genpy/cmake/../../../lib/genpy/genmsg_py.py /Users/alessiature/progetto_workspace/src/vision_pkg/msg/GeometricShape.msg -Ivision_pkg:/Users/alessiature/progetto_workspace/src/vision_pkg/msg -Isensor_msgs:/Users/alessiature/miniforge3/envs/ros_env/share/sensor_msgs/cmake/../msg -Istd_msgs:/Users/alessiature/miniforge3/envs/ros_env/share/std_msgs/cmake/../msg -Igeometry_msgs:/Users/alessiature/miniforge3/envs/ros_env/share/geometry_msgs/cmake/../msg -p vision_pkg -o /Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg

/Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg/__init__.py: /Users/alessiature/miniforge3/envs/ros_env/lib/genpy/genmsg_py.py
/Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg/__init__.py: /Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg/_GeometricShape.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/alessiature/progetto_workspace/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating Python msg __init__.py for vision_pkg"
	cd /Users/alessiature/progetto_workspace/build/vision_pkg && ../catkin_generated/env_cached.sh /Users/alessiature/miniforge3/envs/ros_env/bin/python3.9 /Users/alessiature/miniforge3/envs/ros_env/share/genpy/cmake/../../../lib/genpy/genmsg_py.py -o /Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg --initpy

vision_pkg_generate_messages_py: vision_pkg/CMakeFiles/vision_pkg_generate_messages_py
vision_pkg_generate_messages_py: /Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg/_GeometricShape.py
vision_pkg_generate_messages_py: /Users/alessiature/progetto_workspace/devel/lib/python3.9/site-packages/vision_pkg/msg/__init__.py
vision_pkg_generate_messages_py: vision_pkg/CMakeFiles/vision_pkg_generate_messages_py.dir/build.make
.PHONY : vision_pkg_generate_messages_py

# Rule to build all files generated by this target.
vision_pkg/CMakeFiles/vision_pkg_generate_messages_py.dir/build: vision_pkg_generate_messages_py
.PHONY : vision_pkg/CMakeFiles/vision_pkg_generate_messages_py.dir/build

vision_pkg/CMakeFiles/vision_pkg_generate_messages_py.dir/clean:
	cd /Users/alessiature/progetto_workspace/build/vision_pkg && $(CMAKE_COMMAND) -P CMakeFiles/vision_pkg_generate_messages_py.dir/cmake_clean.cmake
.PHONY : vision_pkg/CMakeFiles/vision_pkg_generate_messages_py.dir/clean

vision_pkg/CMakeFiles/vision_pkg_generate_messages_py.dir/depend:
	cd /Users/alessiature/progetto_workspace/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/alessiature/progetto_workspace/src /Users/alessiature/progetto_workspace/src/vision_pkg /Users/alessiature/progetto_workspace/build /Users/alessiature/progetto_workspace/build/vision_pkg /Users/alessiature/progetto_workspace/build/vision_pkg/CMakeFiles/vision_pkg_generate_messages_py.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vision_pkg/CMakeFiles/vision_pkg_generate_messages_py.dir/depend

