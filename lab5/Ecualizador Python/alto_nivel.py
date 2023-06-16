from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
import cv2

image_path = "img2.png"
output_file = "output.txt"
image = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)
image_data = np.array(image)

pixels_path = "./pixels_file.txt"
pixels_file = open(pixels_path, "w")

# pixeles sin equalizar

for row in image_data:
    for pixel in row:
        pixel_str = str(pixel).zfill(3)  # Zero-fill the pixel value to three digits
        pixels_file.write("\n")
        pixels_file.write(pixel_str)

pixels_file.close()

# string sin equalizar

with open("pixels_file.txt", "r") as file:
    values = file.readlines()

with open(output_file, "w") as file:
    for i, value in enumerate(values):
        file.write(f"{i} : {value.strip()};\n")

# histograma sin equalizar


hist, b = np.histogram(image_data.flatten(), 256, [0, 256])
cdf = hist.cumsum()
cdf_normalized = cdf * float(hist.max()) / cdf.max()
plt.plot(cdf_normalized, color='b')
n, bins, patches = plt.hist(image_data.flatten(), b, facecolor='blue', alpha=0.5)
plt.xlim([0, 256])
plt.legend(('cdf', 'histogram'), loc='upper left')
plt.xlabel('Valor de pixel')
plt.ylabel('Cantidad de pixeles')
plt.title(r'Histograma de Imagen sin Equalización')
plt.show()

# EQUALIZACIÓN

equ = cv2.equalizeHist(image)
res = np.hstack((image, equ))  # stacking images side-by-side
cv2.imwrite('equalized.png', res)


# calculo de cdf

cdf_m = np.ma.masked_equal(cdf, 0)
cdf_m = (cdf_m - cdf_m.min()) * 255 / (cdf_m.max() - cdf_m.min())
cdf_e = np.ma.filled(cdf_m, 0).astype('uint8')
image_data_e = cdf_e[image_data]

# histograma equalizado

hist, b = np.histogram(image_data_e.flatten(), 256, [0, 256])
cdf = hist.cumsum()
cdf_normalized = cdf * float(hist.max()) / cdf.max()
plt.plot(cdf_normalized, color='b')
plt.hist(image_data_e.flatten(), b, facecolor='blue', alpha=0.5)
plt.xlim([0, 256])
plt.legend(('cdf', 'histogram'), loc='upper left')
plt.xlabel('Valor de pixel')
plt.ylabel('Cantidad de pixeles')
plt.title(r'Histograma de Imagen con Equalización')
plt.show()

def cortar_string(string):
    cortado = ""
    for i in range(0, len(string), 2):
        cortado = cortado + str(string[i:i + 2]) + "\n"

    return cortado


cadena = "EDAB9800"

print(cortar_string(cadena))
