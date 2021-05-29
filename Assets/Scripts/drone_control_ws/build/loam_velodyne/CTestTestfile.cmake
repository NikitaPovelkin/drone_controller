# CMake generated Testfile for 
# Source directory: /home/nikita/Unity/lidar/Assets/Scripts/drone_control_ws/src/loam_velodyne
# Build directory: /home/nikita/Unity/lidar/Assets/Scripts/drone_control_ws/build/loam_velodyne
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_loam_velodyne_rostest_test_loam.test "/home/nikita/Unity/lidar/Assets/Scripts/drone_control_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/nikita/Unity/lidar/Assets/Scripts/drone_control_ws/build/test_results/loam_velodyne/rostest-test_loam.xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/nikita/Unity/lidar/Assets/Scripts/drone_control_ws/src/loam_velodyne --package=loam_velodyne --results-filename test_loam.xml --results-base-dir \"/home/nikita/Unity/lidar/Assets/Scripts/drone_control_ws/build/test_results\" /home/nikita/Unity/lidar/Assets/Scripts/drone_control_ws/build/loam_velodyne/test/loam.test ")
set_tests_properties(_ctest_loam_velodyne_rostest_test_loam.test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/nikita/Unity/lidar/Assets/Scripts/drone_control_ws/src/loam_velodyne/CMakeLists.txt;63;add_rostest;/home/nikita/Unity/lidar/Assets/Scripts/drone_control_ws/src/loam_velodyne/CMakeLists.txt;0;")
subdirs("src/lib")
