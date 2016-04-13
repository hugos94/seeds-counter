function contarGraos()

    clc
    
    imEntrada = imread('C:\Users\zenote\Desktop\seeds-counter\Imagens\Teste4.jpg');
    
    R = imEntrada(:,:,1);
    
    imshow(R);
    
    pre = preprocessamento(R);
    
    imSegmentada = segmentacaoDilatacao(pre);
    
    imLimiarizada = limiar(imSegmentada,90,255);
    
    imPreenchida = preencherEspacos(imLimiarizada);

%     teste = imEntrada.*repmat(uint8(imLimiarizada),[1,1,3]);
%     //aplicar máscara a imagem de entrada

    [quantidade,imLabel] = contarComponentesConectadas(imPreenchida);
    
    quantidade

    figure, imshow(imLabel);
    
    
end