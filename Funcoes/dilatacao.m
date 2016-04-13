function imSaida = dilatacao(imEntrada)

    elementoEstruturante = strel('disk',20);
    imSaida = imdilate(imEntrada,elementoEstruturante);

end