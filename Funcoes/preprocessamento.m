function imEqualizada = preprocessamento(imEntrada)

    imSemRuido = filtroMediana(imEntrada);
    
    imEqualizada = equalizarHistograma(imSemRuido);
    
end