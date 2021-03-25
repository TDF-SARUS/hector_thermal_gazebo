#!/bin/bash
source ./devel/setup.bash

gnome-terminal  \
--tab --title "teleop" --command "bash -c \"
rosrun rviz rviz -d `rospack find tdf_rviz`/rviz_tdf_config.rviz;
exec bash\""




