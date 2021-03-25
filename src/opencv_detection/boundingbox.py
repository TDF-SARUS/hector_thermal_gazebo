import cv2
import matplotlib.pyplot as plt

img = cv2.imread('./images/thermal_imgs/left1138.jpg') #La camara RGB va adelantado 1 frame respecto a la termica
#original = img.copy()
original = cv2.imread('./images/rgb_imgs/left1138.jpg')
# cv2.imshow('image', img)
# cv2.waitKey()
img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
# Elegimos el umbral del dron
umbral_bajo = (230, 230,230)
umbral_alto = (255,255,255)
# hacemos la mask y filtramos en la original
mask = cv2.inRange(img, umbral_bajo, umbral_alto)
res = cv2.bitwise_and(img, img, mask=mask)

# imprimimos los resultados
# cv2.imshow('mask', mask)
# cv2.waitKey()
# cv2.imshow('res', res)
# cv2.waitKey()


cnts = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
print(len(cnts))
# x,y,w,h = cv2.boundingRect(cnts[0])
# cv2.rectangle(original, (x, y), (x + w, y + h), (0,0,255), 2)
# roi = original[y:y+h, x:x+w]
# cv2.imwrite("roi.jpg", roi)
# cnts = cnts[0] if len(cnts) == 2 else cnts[1]
# print(len(cnts))

cnts = cnts[1]
print(len(cnts))

for c in range(len(cnts)):
    x,y,w,h = cv2.boundingRect(cnts[c])
  # print(str(x) + ' ' + str(y) + ' ' + str(w) + ' ' + str(h))
    cv2.rectangle(original, (x, y), (x + w, y + h), (0,0,0), 0)

    roi = original[y:y+h, x:x+w]
    cv2.imwrite("roi"+str(c)+".jpg", roi)  

cv2.imshow('image', original)
cv2.waitKey()
