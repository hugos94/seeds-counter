function imSaida = escurecerImagem(imEntrada,intensidade)

    imSaida = imEntrada*360;
    
    figure,imshow(imSaida);

    imSaida(imEntrada<intensidade) = 0;

end