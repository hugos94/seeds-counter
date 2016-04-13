function imSaida = aplicarMascara(imEntrada,imMascara)

    imSaida = imEntrada.*repmat(uint8(imMascara),[1,1,3]);
        
end