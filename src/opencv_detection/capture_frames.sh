rosservice call /rgb_saver/save & rosservice call /thermal_saver/save
rosrun image_view image_saver image:=/rgb_cam/camera/image _save_all_image:=false __name:=rgb_saver
rosrun image_view image_saver image:=/thermal_cam/camera/image _save_all_image:=false __name:=thermal_saver

