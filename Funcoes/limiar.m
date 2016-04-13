function imSaida = limiar(imEntrada, limiteInferior, limiteSuperior)

    mascara = imEntrada>=limiteInferior & imEntrada<=limiteSuperior;
    
    imSaida = mascara;
    
end