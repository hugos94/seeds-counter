function imSaida = erosao(imEntrada,tamanhoDoElementoEstruturante)

    elementoEstruturante = strel('disk',tamanhoDoElementoEstruturante);
    imSaida = imerode(imEntrada,elementoEstruturante);
    
end