function imSaida = transformaEmColorida(imEntrada)

    im = zeros(size(imEntrada,1),size(imEntrada,2),3);
    
    im(:,:,1) = imEntrada(:,:,1);
    im(:,:,2) = imEntrada(:,:,1);
    im(:,:,3) = imEntrada(:,:,1);
    
    imSaida = im;

end