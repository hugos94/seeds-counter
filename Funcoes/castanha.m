function castanha()

    for i = 1:10
        
        imCastanha = imread(['../Imagens/Sementes Individuais/Castanha/' num2str(i) '.png']);

        imBinaria = limiarAutomatico(imCastanha);

    %     figure,imshow(~imBinaria),title(['Castanha ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(~imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Castanha ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Castanha ' num2str(i) ' menos ruidos']);

        imwrite(imMenosRuidosa,['../Imagens/Sementes Individuais/Castanha/m' num2str(i) '.png']);
        
    end
    
end