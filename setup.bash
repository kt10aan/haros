#!/bin/bash
source /opt/ros/noetic/setup.bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/llvm-10/lib
export CMAKE_CXX_COMPILER=/usr/lib/llvm-10/bin/clang++
pip install haros-plugin-pbt-gen
cd haros && python3 setup.py install
haros init
cp haros/configs.yaml /root/.haros/configs.yaml
cd ../turtlebot3
rosdep install --from-paths src --ignore-src
catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1
source devel/setup.bash
