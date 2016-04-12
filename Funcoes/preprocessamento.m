function imSaida = preprocessamento(imEntrada)

    imSemRuido = filtroMediana(imEntrada);
    
    imEqualizada = equalizarHistograma(imSemRuido);
    
    imSaida = imEqualizada;

end