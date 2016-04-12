function imSaida = processamento(imEntrada)
    
%     imBordas = imgradient(imEntrada);
    
    imDilatada = dilatacao(imEntrada);
    
    imSaida = imDilatada-imEntrada;

end