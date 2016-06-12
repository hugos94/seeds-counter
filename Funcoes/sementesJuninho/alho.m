function alho()

    %Usa RGB pra definir um limiar

    clc

    qtImagens = 5;
    
    arquivoMaiorEixo = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Alho\tamanhoDoMaiorEixo.txt'],'wt');
    arquivoArea = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Alho\area.txt'],'wt');
    arquivoCorR = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Alho\corR.txt'],'wt');
    arquivoCorG = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Alho\corG.txt'],'wt');
    arquivoCorB = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Alho\corB.txt'],'wt');
    
    modaR = zeros(12,1,1);
    modaG = zeros(12,1,1);
    modaB = zeros(12,1,1);
    
    maxMaiorEixo = double(0);
    minMaiorEixo = realmax;
    
    maxArea = double(0);
    minArea = realmax;
    
    destinoEntrada = ['..\..\Imagens\Sementes Individuais\Juninho\Alho\'];
    
    destinoSaida = ['..\..\Imagens\Sementes Individuais\Juninho\Alho\BandasDeCores\'];
    
    mostrarBandasDeCoresVariasImagens(destinoEntrada,destinoSaida,1,qtImagens);

    for i = 1:qtImagens
        
        imAlho = imread(['..\..\Imagens\Sementes Individuais\Juninho\Alho\' num2str(i) '.png']);
        
        CMYK = rgb2cmyk(imAlho);

        imBinaria = limiarAutomatico(CMYK(:,:,4));

%         figure,imshow(imBinaria),title(['Alho ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Alho ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Alho ' num2str(i) ' menos ruidos']);
    
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
        
        modaR(i,1,1) = aplicaMascaraCalculaModa(imAlho(:,:,1),imMenosRuidosa);
        
        modaG(i,1,1) = aplicaMascaraCalculaModa(imAlho(:,:,2),imMenosRuidosa);
        
        modaB(i,1,1) = aplicaMascaraCalculaModa(imAlho(:,:,3),imMenosRuidosa);

        imwrite(imMenosRuidosa,['..\..\Imagens\Sementes Individuais\Juninho\Alho\m' num2str(i) '.png']);
        
    end
    
    [maxR,minR,maxG,minG,maxB,minB] = salvarFaixaDeCores(modaR,modaG,modaB,destinoEntrada);
    
    imprimirDadosDeInteresseEmArquivo(arquivoMaiorEixo,arquivoArea,arquivoCorR,arquivoCorG,arquivoCorB,minMaiorEixo,maxMaiorEixo,minArea,maxArea,maxR,minR,maxG,minG,maxB,minB);
    
    fclose(arquivoMaiorEixo);
    fclose(arquivoArea);
    fclose(arquivoCorR);
    fclose(arquivoCorG);
    fclose(arquivoCorB);
    
end