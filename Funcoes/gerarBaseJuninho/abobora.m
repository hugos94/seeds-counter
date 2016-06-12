function abobora()

    %Usa RGB pra definir um limiar

    clc
    qtImagens = 9;

    arquivoMaiorEixo = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Abobora\tamanhoDoMaiorEixo.txt'],'wt');
    arquivoArea = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Abobora\area.txt'],'wt');
    arquivoCorR = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Abobora\corR.txt'],'wt');
    arquivoCorG = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Abobora\corG.txt'],'wt');
    arquivoCorB = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Abobora\corB.txt'],'wt');
    
    modaR = zeros(qtImagens,1,1);
    modaG = zeros(qtImagens,1,1);
    modaB = zeros(qtImagens,1,1);
    
    maxMaiorEixo = double(0);
    minMaiorEixo = realmax;
    
    maxArea = double(0);
    minArea = realmax;
    
    destinoEntrada = ['..\..\Imagens\Sementes Individuais\Juninho\Abobora\'];
    
    destinoSaida = ['..\..\Imagens\Sementes Individuais\Juninho\Abobora\BandasDeCores\'];
    
    mostrarBandasDeCoresVariasImagens(destinoEntrada,destinoSaida,1,qtImagens);

    for i = 1:qtImagens
        
        imAbobora = imread(['..\..\Imagens\Sementes Individuais\Juninho\Abobora\' num2str(i) '.png']);
        
%         CMYK = rgb2cmyk(imAbobora);

        imBinaria = limiarAutomatico(imAbobora(:,:,2));

%         figure,imshow(imBinaria),title(['Abobora ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(~imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Abobora ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Abobora ' num2str(i) ' menos ruidos']);
    
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
        
        modaR(i,1,1) = aplicaMascaraCalculaModa(imAbobora(:,:,1),imMenosRuidosa);
        
        modaG(i,1,1) = aplicaMascaraCalculaModa(imAbobora(:,:,2),imMenosRuidosa);
        
        modaB(i,1,1) = aplicaMascaraCalculaModa(imAbobora(:,:,3),imMenosRuidosa);

        imwrite(imMenosRuidosa,['..\..\Imagens\Sementes Individuais\Juninho\Abobora\m' num2str(i) '.png']);
        
    end
    
    salvarFaixaDeCores(modaR,modaG,modaB,arquivoCorR,arquivoCorG,arquivoCorB);
    
    imprimirDadosDeInteresseEmArquivo(arquivoMaiorEixo,arquivoArea,minMaiorEixo,maxMaiorEixo,minArea,maxArea);
    
    fclose(arquivoMaiorEixo);
    fclose(arquivoArea);
    fclose(arquivoCorR);
    fclose(arquivoCorG);
    fclose(arquivoCorB);
    
end