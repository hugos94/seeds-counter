function imSaida = dilatacao(imEntrada, tamanhoElementoEstruturante)

    elementoEstruturante = strel('disk',tamanhoElementoEstruturante);
    imSaida = imdilate(imEntrada,elementoEstruturante);

end