#!/bin/bash

gnome-terminal  \
--tab --title "rgb_saver" --command "bash -c \"
cd ./src/opencv_detection/images/rgb_imgs
rosrun image_view image_saver image:=/rgb_cam/camera/image _save_all_image:=true __name:=rgb_saver;
exec bash\"" \
--tab --title "thermal_saver" --command "bash -c \"
cd ./src/opencv_detection/images/thermal_imgs
rosrun image_view image_saver image:=/thermal_cam/camera/image _save_all_image:=true __name:=thermal_saver;
exec bash\"" \ 
