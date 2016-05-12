function feijaoMarrom()

    for i = 1:17
        
        imFeijaoMarrom = imread(['../Imagens/Sementes Individuais/Feijao Marrom/' num2str(i) '.png']);
        
        hsv = rgb2hsv(imFeijaoMarrom);
        
        h = hsv(:,:,1);
        s = hsv(:,:,2);
        
%         figure,imshow(s),title(['Feijao Marrom ' num2str(i)]);

        imEqualizada = histeq(s);
        
%         figure,imshow(imEqualizada),title(['Feijao Marrom ' num2str(i) ' equalizado']);
        
%         imSuavizada = filtroDeMinimo(imEqualizada,3);
        
%         figure,imshow(imSuavizada),title(['Feijao Marrom ' num2str(i) ' suavizada']);

        imBinaria = limiarAutomatico(imEqualizada);

%         figure,imshow(imBinaria),title(['Feijao Marrom ' num2str(i) ' binaria']);

        imMenosRuidosa = bwareaopen(imBinaria,1000);

%         figure,imshow(imMenosRuidosa),title(['Feijao Marrom ' num2str(i) ' menos ruidos']);
        
        imPreenchida =  preencherEspacos(imMenosRuidosa,8);

%         figure,imshow(imPreenchida),title(['Feijao Marrom ' num2str(i) ' preenchida']);

        imErodida = erosao(imPreenchida,5);

        imwrite(imErodida,['../Imagens/Sementes Individuais/Feijao Marrom/m' num2str(i) '.png']);
        
    end
    
end