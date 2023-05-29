from itertools import count
from pickletools import optimize
from imutils import paths
import face_recognition
import argparse
import pickle
import cv2
import os
from PIL import Image
from io import BytesIO
import base64
import time 

# load the known faces and embeddings
print("[INFO] loading encodings...")
data = pickle.loads(open("datasetB20/encodings.pickle", "rb").read())

def recognize(fname):
	start_time = time.time()
	names = []
	image = cv2.imread(fname)
	image_resized = cv2.resize(image, (800,600), interpolation=cv2.INTER_AREA)

	rgb = cv2.cvtColor(image_resized, cv2.COLOR_BGR2RGB)
	# detect the (x, y)-coordinates of the bounding boxes corresponding
	# to each face in the input image, then compute the facial embeddings
	# for each face
	print("[INFO] recognizing faces...")
	boxes = face_recognition.face_locations(rgb)#, model="cnn")
	encodings = face_recognition.face_encodings(rgb, boxes)
	# initialize the list of names for each face detected
	# names = []

	# loop over the facial embeddings
	for encoding in encodings:
		# attempt to match each face in the input image to our known
		# encodings
		matches = face_recognition.compare_faces(data["encodings"],encoding,tolerance = 0.4)
		name = "Unknown"

		# check to see if we have found a match
		if True in matches:
			# find the indexes of all matched faces then initialize a
			# dictionary to count the total number of times each face
			# was matched
			matchedIdxs = [i for (i, b) in enumerate(matches) if b]
			counts = {}
			# loop over the matched indexes and maintain a count for
			# each recognized face face
			#if (len(matchedIdxs)>=25):
			for i in matchedIdxs:
				name = data["names"][i]
				counts[name] = counts.get(name, 0) + 1
			# determine the recognized face with the largest number of
			# votes (note: in the event of an unlikely tie Python will
			# select first entry in the dictionary)
				name = max(counts, key=counts.get)

				
		
		# update the list of names
		names.append(name)
		#print(matchedIdxs)
	# loop over the recognized faces
	for ((top, right, bottom, left), name) in zip(boxes, names):
		# draw the predicted face name on the image
		cv2.rectangle(image_resized, (left, top), (right, bottom), (0, 255, 0), 2)
		y = top - 15 if top - 15 > 15 else top + 15
		cv2.putText(image_resized, name, (left, y), cv2.FONT_HERSHEY_SIMPLEX,
			0.75, (0, 255, 0), 2)
	print(time.time() - start_time, "seconds")
	cv2.imwrite('uploads/output_'+fname, image_resized)
	return names,'uploads/output_'+ fname
	

	


# show the output image
#cv2.imshow("Image", image_resized)
#cv2.imwrite("", img)
# cv2.waitKey(0)
# cv2.destroyAllWindows()