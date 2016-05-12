function milho()

    for i = 1:24
        
        imMilho = imread(['../Imagens/Sementes Individuais/Milho/' num2str(i) '.png']);

        imBinaria = limiarAutomatico(imMilho(:,:,1));

    %     figure,imshow(~imBinaria),title(['Milho ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(~imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Milho ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Milho ' num2str(i) ' menos ruidos']);

        imwrite(imMenosRuidosa,['../Imagens/Sementes Individuais/Milho/m' num2str(i) '.png']);
        
    end
    
end