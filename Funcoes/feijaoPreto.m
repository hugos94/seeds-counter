function feijaoPreto()

    for i = 1:17
        
        imFeijaoPreto = imread(['../Imagens/Sementes Individuais/Feijao Preto/' num2str(i) '.png']);

        imBinaria = limiarAutomatico(imFeijaoPreto(:,:,1));

    %     figure,imshow(~imBinaria),title(['Feijao Preto ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(~imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Feijao Preto ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Feijao Preto ' num2str(i) ' menos ruidos']);

        imwrite(imMenosRuidosa,['../Imagens/Sementes Individuais/Feijao Preto/m' num2str(i) '.png']);
    end
    
end