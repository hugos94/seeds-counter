function imSaida = segmentacaoDilatacao(imEntrada)
    
    imDilatada = dilatacao(imEntrada);
    
    imSaida = imDilatada-imEntrada;

end