#!/bin/bash

source ./devel/setup.bash

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
exec bash\"" \
--tab --title "ros_rviz" --command "bash -c \"
rosrun rviz rviz -d `rospack find tdf_rviz`/rviz_tdf_config.rviz;
exec bash\""

# --tab --title "enable_save" --command "bash -c \"
# sleep 3
# rosservice call /rgb_saver/save & rosservice call /thermal_saver/save;
# exec bash\""
# sleep 20
# while :
# do	
# 	sleep 1
# 	rosservice call /rgb_saver/save & rosservice call /thermal_saver/save
# done
# rosservice call /rgb_saver/save & rosservice call /thermal_saver/save
# rosrun image_view image_saver image:=/rgb_cam/camera/image _save_all_image:=false __name:=rgb_saver
# rosrun image_view image_saver image:=/thermal_cam/camera/image _save_all_image:=false __name:=thermal_saver

# gnome-terminal  \
# --tab --title "ros_rviz" --command "bash -c \"
# source ./devel/setup.bash
# rosrun rviz rviz -d `rospack find tdf_rviz`/rviz_tdf_config.rviz;
# exec bash\"" 



