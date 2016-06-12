function amendoimJuninho()

    %Usa RGB pra definir um limiar

    clc

    qtImagens = 7;
    
    arquivoMaiorEixo = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Amendoim\tamanhoDoMaiorEixo.txt'],'wt');
    arquivoArea = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Amendoim\area.txt'],'wt');
    arquivoCorR = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Amendoim\corR.txt'],'wt');
    arquivoCorG = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Amendoim\corG.txt'],'wt');
    arquivoCorB = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Amendoim\corB.txt'],'wt');
    
    modaR = zeros(qtImagens,1,1);
    modaG = zeros(qtImagens,1,1);
    modaB = zeros(qtImagens,1,1);
    
    maxMaiorEixo = double(0);
    minMaiorEixo = realmax;
    
    maxArea = double(0);
    minArea = realmax;
    
    destinoEntrada = ['..\..\Imagens\Sementes Individuais\Juninho\Amendoim\'];
    
    destinoSaida = ['..\..\Imagens\Sementes Individuais\Juninho\Amendoim\BandasDeCores\'];
    
    mostrarBandasDeCoresVariasImagens(destinoEntrada,destinoSaida,1,qtImagens);

    for i = 1:qtImagens
        
        imAmendoim = imread(['..\..\Imagens\Sementes Individuais\Juninho\Amendoim\' num2str(i) '.png']);
        
        CMYK = rgb2cmyk(imAmendoim);

        imBinaria = limiarAutomatico(CMYK(:,:,4));

%         figure,imshow(imBinaria),title(['Amendoim ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Amendoim ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Amendoim ' num2str(i) ' menos ruidos']);
    
        Propriedades = regionprops(imMenosRuidosa,'MajorAxisLength','Centroid','Orientation','Area');
                
%         imprimeEixos(Propriedades,imMenosRuidosa);

        maiorEixoAtual = Propriedades.MajorAxisLength;
        
        areaAtual = Propriedades.Area;

        if(maiorEixoAtual < minMaiorEixo)
            
            minMaiorEixo = maiorEixoAtual;
            
        end
        
        if(maiorEixoAtual > maxMaiorEixo)
            
            maxMaiorEixo = maiorEixoAtual;
            
        end
        
        if(areaAtual < minArea)
            
            minArea = areaAtual;
            
        end
        
        if(areaAtual > maxArea)
            
            maxArea = areaAtual;
            
        end
        
        modaR(i,1,1) = aplicaMascaraCalculaModa(imAmendoim(:,:,1),imMenosRuidosa);
        
        modaG(i,1,1) = aplicaMascaraCalculaModa(imAmendoim(:,:,2),imMenosRuidosa);
        
        modaB(i,1,1) = aplicaMascaraCalculaModa(imAmendoim(:,:,3),imMenosRuidosa);

        imwrite(imMenosRuidosa,['..\..\Imagens\Sementes Individuais\Juninho\Amendoim\m' num2str(i) '.png']);
        
    end
    
    salvarFaixaDeCores(modaR,modaG,modaB,arquivoCorR,arquivoCorG,arquivoCorB);
    
    imprimirDadosDeInteresseEmArquivo(arquivoMaiorEixo,arquivoArea,minMaiorEixo,maxMaiorEixo,minArea,maxArea);
    
    fclose(arquivoMaiorEixo);
    fclose(arquivoArea);
    fclose(arquivoCorR);
    fclose(arquivoCorG);
    fclose(arquivoCorB);
    
end