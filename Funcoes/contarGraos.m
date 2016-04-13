function contarGraos()

    clc
    
    imEntrada = imread('C:\Users\zenote\Desktop\seeds-counter\Imagens\Teste4.jpg');
    
    R = imEntrada(:,:,1);
    
    imshow(R);
    
    pre = preprocessamento(R);
    
    imSegmentada = segmentacaoDilatacao(pre,20); % parametro tamanho do elemento estruturante
    
    imLimiarizada = limiar(imSegmentada,90,255); % parametro limites inferior e superior
    
    imPreenchida = preencherEspacos(imLimiarizada,9); % parametro tamanho do elemento estruturante
    
    imComMascara = aplicarMascara(imEntrada,imPreenchida);
    
    [quantidade,imLabel] = contarComponentesConectadas(imPreenchida);
    
    quantidade
    
    figure, imshow(imComMascara);
    
    figure, imshow(imLabel);
    
end