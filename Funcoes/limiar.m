function imagemSaida = limiar(imagemEntrada, limiteInferior, limiteSuperior)

    mascara = imagemEntrada>=limiteInferior & imagemEntrada<=limiteSuperior;
      
%     imagemSaida = times(imagemEntrada,uint8(mascara));
    
%     componentesConectadas = bwconncomp(mascara);
    
    imprimir = uint8(mascara);
    
    imprimir(imprimir==1) = 255;
    
    imshow(imprimir);
    
%     labeled = labelmatrix(componentesConectadas);
%     RGB_label = label2rgb(labeled, @copper, 'c', 'shuffle');

    
    


end