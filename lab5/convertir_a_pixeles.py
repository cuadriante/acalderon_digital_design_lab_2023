from PIL import Image
import numpy as np
import matplotlib.pyplot as plt


def obtener_pixeles(img):
    img = img.convert("L")
    pixeles = np.array(img, dtype=np.uint8).flatten().tolist()
    return pixeles

def pasar_a_string(pixeles):
    string = ""
    i = 0
    for p in pixeles:
        string = string + str(i) + ":" + str(p) + ";\n"
        i = i + 1
    return string

imagen = Image.open("img.png")
pixeles = obtener_pixeles(imagen)
print("string: ", pasar_a_string(pixeles))


num_bins = 10
n, bins, patches = plt.hist(pixeles, num_bins, facecolor='blue', alpha=0.5)
plt.xlabel('Valor de pixel')
plt.ylabel('Cantidad de pixeles')
plt.title(r'Histograma de Imagen')
plt.show()








def cortar_string(string):
    cortado = ""
    for i in range(0, len(string), 2):
        cortado = cortado + str(string[i:i+2]) + "\n"

    return cortado


cadena = "EDAB9800"

print(cortar_string(cadena))

