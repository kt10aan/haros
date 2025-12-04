#!/bin/bash

# Set up a couple of env variables
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/llvm-10/lib
export CMAKE_CXX_COMPILER=/usr/lib/llvm-10/bin/clang++

# install pbt-gen plugin
pip install haros-plugin-pbt-gen

# install haros from source , initialise it and copy configs
cd haros && python3 setup.py install
haros init
cp /root/haros/configs.yaml /root/.haros/configs.yaml

# install turtlebot3 rosdeps and compile, making compile_commands.json file
cd ../turtlebot3
rosdep install --from-paths src --ignore-src
catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1
source devel/setup.bash

# same for fictibot
cd ../fictibot
rosdep install --from-paths src --ignore-src
catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1

