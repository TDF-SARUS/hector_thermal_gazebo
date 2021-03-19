source ./devel/setup.bash
roslaunch hector_gazebo_worlds rescue_mission.launch &
roslaunch hector_quadrotor_gazebo spawn_quadrotor_with_thermal.launch &
rosrun image_view image_view image:=/thermal_cam/camera/image &
sleep 20
echo "enabling motors"
rosservice call /enable_motors true
rosrun teleop_twist_keyboard teleop_twist_keyboard.py

