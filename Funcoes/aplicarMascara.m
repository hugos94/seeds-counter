function imSaida = aplicarMascara(imEntrada,imMascara)

    imSaida = imEntrada.*uint8(imMascara);
%     imSaida = imEntrada.*repmat(uint8(imMascara),[1,1,3]); % para saida rgb
    
    imSaida(imSaida == 0) = 255;
    
end