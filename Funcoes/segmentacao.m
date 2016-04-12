function segmentacao()

    imEntrada = imread('C:\Users\zenote\Desktop\PDI\Imagens\Teste4.jpg');
    
    R = imEntrada(:,:,1);
    
    pre = preprocessamento(R);
    
    saida = processamento(pre);
    
%     limiar = graythresh(saida);
    
%     bw = im2bw(saida,limiar);
    
%     imshow(bw);

    imshow(saida);
end