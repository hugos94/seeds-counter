function imSaida = deteccaoBordasDilatacao(imEntrada, tamanhoDoElementoEstruturante)
    
    imDilatada = dilatacao(imEntrada,tamanhoDoElementoEstruturante);
    
    imSaida = imDilatada-imEntrada;

end