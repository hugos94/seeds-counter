function imSaida = limiarAutomatico(imEntrada)

imSaida = im2bw(imEntrada,graythresh(imEntrada));