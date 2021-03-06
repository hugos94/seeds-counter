function milho()

    %Usa RGB pra definir um limiar

    clc

    qtImagens = 15;
    
    arquivoMaiorEixo = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Milho\tamanhoDoMaiorEixo.txt'],'wt');
    arquivoArea = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Milho\area.txt'],'wt');
    arquivoCorR = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Milho\corR.txt'],'wt');
    arquivoCorG = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Milho\corG.txt'],'wt');
    arquivoCorB = fopen(['..\..\Imagens\Sementes Individuais\Juninho\Milho\corB.txt'],'wt');
    
    modaR = zeros(qtImagens,1,1);
    modaG = zeros(qtImagens,1,1);
    modaB = zeros(qtImagens,1,1);
    
    maxMaiorEixo = double(0);
    minMaiorEixo = realmax;
    
    maxArea = double(0);
    minArea = realmax;
    
    destinoEntrada = ['..\..\Imagens\Sementes Individuais\Juninho\Milho\'];
    
    destinoSaida = ['..\..\Imagens\Sementes Individuais\Juninho\Milho\BandasDeCores\'];
    
    mostrarBandasDeCoresVariasImagens(destinoEntrada,destinoSaida,1,qtImagens);

    for i = 1:qtImagens
        
        imMilho = imread(['..\..\Imagens\Sementes Individuais\Juninho\Milho\' num2str(i) '.png']);
        
        CMYK = rgb2cmyk(imMilho);

        imBinaria = limiarAutomatico(CMYK(:,:,4));

%         figure,imshow(imBinaria),title(['Milho ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Milho ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Milho ' num2str(i) ' menos ruidos']);
    
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
        
        modaR(i,1,1) = aplicaMascaraCalculaModa(imMilho(:,:,1),imMenosRuidosa);
        
        modaG(i,1,1) = aplicaMascaraCalculaModa(imMilho(:,:,2),imMenosRuidosa);
        
        modaB(i,1,1) = aplicaMascaraCalculaModa(imMilho(:,:,3),imMenosRuidosa);

        imwrite(imMenosRuidosa,['..\..\Imagens\Sementes Individuais\Juninho\Milho\m' num2str(i) '.png']);
        
    end
    
    salvarFaixaDeCores(modaR,modaG,modaB,arquivoCorR,arquivoCorG,arquivoCorB);
    
    imprimirDadosDeInteresseEmArquivo(arquivoMaiorEixo,arquivoArea,minMaiorEixo,maxMaiorEixo,minArea,maxArea);
    
    fclose(arquivoMaiorEixo);
    fclose(arquivoArea);
    fclose(arquivoCorR);
    fclose(arquivoCorG);
    fclose(arquivoCorB);
    
end