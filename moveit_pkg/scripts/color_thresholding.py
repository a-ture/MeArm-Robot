#!/usr/bin/env python3
import cv2
import numpy as np

# Funzione vuota utilizzata come callback per le trackbar
def nothing(pos):
    pass

# Inizializza la cattura video dalla webcam
cap = cv2.VideoCapture(0)

# Crea una finestra per le trackbar
cv2.namedWindow('Thresholds')

# Crea sei trackbar per regolare le soglie dei colori HSV
cv2.createTrackbar('LH', 'Thresholds', 0, 255, nothing)
cv2.createTrackbar('LS', 'Thresholds', 0, 255, nothing)
cv2.createTrackbar('LV', 'Thresholds', 0, 255, nothing)
cv2.createTrackbar('UH', 'Thresholds', 255, 255, nothing)
cv2.createTrackbar('US', 'Thresholds', 255, 255, nothing)
cv2.createTrackbar('UV', 'Thresholds', 255, 255, nothing)

while(1):
    _, img = cap.read()

    # Converte il frame BGR in formato HSV (hue-saturation-value)
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

    # Ottiene i valori attuali delle trackbar per le soglie HSV
    lh = cv2.getTrackbarPos('LH', 'Thresholds')
    ls = cv2.getTrackbarPos('LS', 'Thresholds')
    lv = cv2.getTrackbarPos('LV', 'Thresholds')
    uh = cv2.getTrackbarPos('UH', 'Thresholds')
    us = cv2.getTrackbarPos('US', 'Thresholds')
    uv = cv2.getTrackbarPos('UV', 'Thresholds')

    # Definisce il range di colore in base ai valori delle trackbar
    color_lower = np.array([lh, ls, lv], np.uint8)
    color_upper = np.array([uh, us, uv], np.uint8)

    # Crea una maschera binaria per il colore specificato
    color = cv2.inRange(hsv, color_lower, color_upper)

    # Esegue una trasformazione morfologica (dilatazione) per enfatizzare le regioni del colore rilevate
    kernal = np.ones((5, 5), "uint8")
    color = cv2.dilate(color, kernal)

    # Mostra la maschera binaria (regioni di colore rilevate) in una finestra chiamata "Color"
    # Mostra l'immagine video originale in una finestra chiamata "Original Image"
    cv2.imshow("Color", color)
    cv2.imshow("Original Image", img)

    # Il programma esce quando si preme il tasto 'q'
    if cv2.waitKey(1) == ord('q'):
        break

# Rilascia la cattura video e chiude tutte le finestre OpenCV
cap.release()
cv2.destroyAllWindows()
