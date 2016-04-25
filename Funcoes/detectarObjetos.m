function imSaida = detectarObjetos(imEntrada)
    
    imSaida = im2bw(imEntrada,graythresh(imEntrada));
    
    figure, imshow(imSaida);

end