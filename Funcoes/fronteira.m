function imSaida = fronteira(imEntrada, tamanhoDoElementoEstruturante)

    imErodida = erosao(imEntrada,tamanhoDoElementoEstruturante);
    
    imSaida = imEntrada-imErodida;
    
end