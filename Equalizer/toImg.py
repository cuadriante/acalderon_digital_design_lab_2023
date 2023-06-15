import cv2
import numpy as np
import matplotlib.pyplot as plt

linkImg = "Lenna.png"
linkRemapeo = "remappedFile.txt"
linkFinal = "final.txt"

def build():
    with open(linkRemapeo, "r") as txt1, open(linkFinal, "w+") as txt2:
        for element in txt1:
            value = element.rstrip("\n")
            pixel = sum(int(value[i]) << (7 - i) for i in range(8))
            txt2.write(str(pixel) + "\n")
    txt2.close()
    create_image()


def create_image():
    with open(linkFinal, "r") as f:
        newMat = []
        img_color = cv2.imread(linkImg)
        vertical, horizontal, _ = img_color.shape
        for _ in range(vertical):
            row = [int(f.readline().rstrip("\n")) for _ in range(horizontal)]
            newMat.append(row)
        
        matriz_np_new = np.array(newMat, dtype=np.uint8)
        cv2.imwrite("equalized.png", matriz_np_new)
    
    histograms()


def histograms():
    img = cv2.imread(linkImg, 0)
    imgeq = cv2.imread("equalized.png")
    cv2.imshow("test",img)
    cv2.imshow("test",imgeq)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

build()
