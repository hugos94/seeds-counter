function imSaida = detectarBordasBanda(imEntrada,tamanhoDoElementoEstruturanteDeteccaoDeBordas)

    imSemRuido = filtroMediana(imEntrada);

%     figure, imshow(imSemRuido),title('Imagem sem ruidos');
        
    imBordas = fronteira(imSemRuido,tamanhoDoElementoEstruturanteDeteccaoDeBordas); % parametro tamanho do elemento estruturante
    
%     figure, imshow(imBordas),title(['Bordas']);
    
    imLimiarAutomatico = limiarAutomatico(imBordas);

%     figure, imshow(imLimiarAutomatico),title(['Limiar = ' num2str(tamanhoDoElementoEstruturanteDeteccaoDeBordas)]);
      
    imBordas1 = metodosDeDeteccaoDeBorda('Roberts',imSemRuido);
    
%     figure, imshow(imBordas1),title(['Bordas']);
    
    imBordas2 = metodosDeDeteccaoDeBorda('Prewitt',imSemRuido);
    
%     figure, imshow(imBordas2),title(['Bordas']);

    imSomaBordas = imLimiarAutomatico+imBordas1+imBordas2;
    
    imSaida = imSomaBordas;

end