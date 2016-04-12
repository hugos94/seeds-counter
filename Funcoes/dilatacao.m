function imSaida = dilatacao(imEntrada)

    elementoEstruturante = strel('disk',5);
    imSaida = imdilate(imEntrada,elementoEstruturante);

end