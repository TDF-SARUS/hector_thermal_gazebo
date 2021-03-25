import cv2

threshold_low=(230, 230, 230)
threshold_up=(255, 255, 255)

samples=1329
digits=4


for s in range (samples):
	name =''
	name_rgb=''
	res=s
	res_rgb=s+1
	for i in range (digits):
		name = str(int(res%10)) + name
		name_rgb = str(int(res%10)) + name_rgb
		res = res/10
		res_rgb = res_rgb/10
	name='left' + name + '.jpg'
	name_rgb='left' + name_rgb + '.jpg'
	img_thermal = cv2.imread('./images/thermal_imgs/'+name) #La camara RGB va adelantado 1 frame respecto a la termica
	img_rgb = cv2.imread('./images/rgb_imgs/'+name_rgb)
	print (name_rgb)
	print (name)


