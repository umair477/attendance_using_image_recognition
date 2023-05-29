from email.mime import image
import cv2
import glob
import os

inputFolder = 'datasetB20\\Zarghoon\\output'
os.mkdir('Zarghoon')

i=0
for img in glob.glob(inputFolder +"/*.jpg"):
    image = cv2.imread(img)
    imgResized = cv2.resize(image, (336, 336))
    cv2.imwrite("Zarghoon/image%i.jpg" %i, imgResized)

    i+=1
    cv2.imshow('image', imgResized)
    cv2.waitKey(30)

cv2.destroyAllWindows()