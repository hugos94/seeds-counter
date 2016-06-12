function imSaida = fechamento(imEntrada,tamanhoDoElementoEstruturante)

    imDilatada = dilatacao(imEntrada,tamanhoDoElementoEstruturante);
    imErodida = erosao(imDilatada,tamanhoDoElementoEstruturante);
    
    imSaida = imErodida;

end