#!/bin/bash

gnome-terminal  \
--tab --title "gazebo_world" --command "bash -c \"
source ./devel/setup.bash
roslaunch hector_gazebo_worlds rescue_mission.launch ;
exec bash\"" \
--tab --title "spawn" --command "bash -c \"
sleep 3
source ./devel/setup.bash 
roslaunch hector_quadrotor_gazebo spawn_quadrotor_with_thermal.launch;
exec bash\"" &

sleep 15
gnome-terminal  \
--tab --title "teleop" --command "bash -c \"
source ./devel/setup.bash
rosservice call /enable_motors true
rosrun teleop_twist_keyboard teleop_twist_keyboard.py;
exec bash\"" &

# gnome-terminal  \
# --tab --title "ros_rviz" --command "bash -c \"
# source ./devel/setup.bash
# rosrun rviz rviz -d `rospack find tdf_rviz`/rviz_tdf_config.rviz;
# exec bash\"" 



