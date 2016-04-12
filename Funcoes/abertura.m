function imSaida = abertura(imEntrada)

    elementoEstruturante = strel('disk',5);
    imSaida = imopen(imEntrada,elementoEstruturante);

end