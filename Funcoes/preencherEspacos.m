function imSaida = preencherEspacos(imEntrada, tamanhoDoGap)
    
    imEspacosPreenchidos = imfill(imEntrada,tamanhoDoGap,'holes');
    
    imSaida = imEspacosPreenchidos;

end