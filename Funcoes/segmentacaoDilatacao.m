function imSaida = segmentacaoDilatacao(imEntrada, tamanhoDoElementoEstruturante)
    
    imDilatada = dilatacao(imEntrada,tamanhoDoElementoEstruturante);
    
    imSaida = imDilatada-imEntrada;

end