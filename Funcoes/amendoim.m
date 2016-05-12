function amendoim()

    for i = 1:12
        
        imAmendoim = imread(['../Imagens/Sementes Individuais/Amendoim/' num2str(i) '.png']);

        imBinaria = limiarAutomatico(imAmendoim);

    %     figure,imshow(~imBinaria),title(['Castanha ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(~imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Castanha ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Castanha ' num2str(i) ' menos ruidos']);

        imwrite(imMenosRuidosa,['../Imagens/Sementes Individuais/Amendoim/m' num2str(i) '.png']);
        
    end
    
end