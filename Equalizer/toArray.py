import numpy as np
import cv2

image_path = "Lenna.png"
image = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)
image_data = np.array(image)

pixels_path = "./pixels_file.txt"
pixels_file = open(pixels_path, "w")

for row in image_data:
    for pixel in row:
        pixel_str = str(pixel).zfill(3)  # Zero-fill the pixel value to three digits
        pixels_file.write(pixel_str)

pixels_file.close()
