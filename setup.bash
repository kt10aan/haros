#!/bin/bash
pip install haros-plugin-pbt-gen
cd haros && python3 setup.py install
haros init
cp configs.yaml ./haros/
cd ../turtlebot3
rosdep install --from-paths src --ignore-src
catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1
