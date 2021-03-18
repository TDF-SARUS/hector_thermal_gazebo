Commands for testing thermal camera in rescue mission world

Launch rescue mission test world: roslaunch hector_gazebo_worlds rescue_mission.launch

Launch quadrotor with thermal camera(bottom camera): roslaunch hector_quadrotor_gazebo spawn_quadrotor_with_thermal.launch

Display thermal camera: rosrun image_view image_view image:=/thermal_cam/camera/image

Display RGB camera: rosrun image_view image_view image:=/rgb_cam/camera/image

Activate hector_quadrotor motors: rosservice call /enable_motors true

Teleoperation terminal: if not installed run: sudo apt-get install ros-melodic-teleop-twist-keyboard
Display teleoperation terminal: rosrun teleop_twist_keyboard teleop_twist_keyboard.py
