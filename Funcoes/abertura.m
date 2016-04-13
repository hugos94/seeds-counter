function imSaida = abertura(imEntrada,tamanhoDoElementoEstruturante)

    elementoEstruturante = strel('disk',tamanhoDoElementoEstruturante);
    imSaida = imopen(imEntrada,elementoEstruturante);

end