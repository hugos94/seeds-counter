function ervilha()

    %Usa RGB pra definir um limiar

    clc

    qtImagens = 8;
    arquivoMaiorEixo = fopen(['../../Imagens/Sementes Individuais/Ervilha/tamanhoDoMaiorEixo.txt'],'wt');
    arquivoArea = fopen(['../../Imagens/Sementes Individuais/Ervilha/area.txt'],'wt');
    arquivoCorR = fopen(['../../Imagens/Sementes Individuais/Ervilha/corR.txt'],'wt');
    arquivoCorG = fopen(['../../Imagens/Sementes Individuais/Ervilha/corG.txt'],'wt');
    arquivoCorB = fopen(['../../Imagens/Sementes Individuais/Ervilha/corB.txt'],'wt');
    
    modaR = zeros(12,1,1);
    modaG = zeros(12,1,1);
    modaB = zeros(12,1,1);
    
    maxMaiorEixo = double(0);
    minMaiorEixo = realmax;
    
    maxArea = double(0);
    minArea = realmax;
    
    destinoEntrada = ['..\..\Imagens\Sementes Individuais\Ervilha\'];
    
    destinoSaida = ['..\..\Imagens\Sementes Individuais\Ervilha\BandasDeCores\'];
    
    mostrarBandasDeCoresVariasImagens(destinoEntrada,destinoSaida,1,qtImagens);

    for i = 1:qtImagens
        
        imErvilha = imread(['../../Imagens/Sementes Individuais/Ervilha/' num2str(i) '.png']);
        
        CMYK = rgb2cmyk(imErvilha);

        imBinaria = limiarAutomatico(CMYK(:,:,4));

%         figure,imshow(imBinaria),title(['Castanha ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Castanha ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Castanha ' num2str(i) ' menos ruidos']);
    
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
        
        modaR(i,1,1) = aplicaMascaraCalculaModa(imErvilha(:,:,1),imMenosRuidosa);
        
        modaG(i,1,1) = aplicaMascaraCalculaModa(imErvilha(:,:,2),imMenosRuidosa);
        
        modaB(i,1,1) = aplicaMascaraCalculaModa(imErvilha(:,:,3),imMenosRuidosa);

        imwrite(imMenosRuidosa,['../../Imagens/Sementes Individuais/Ervilha/m' num2str(i) '.png']);
        
    end
    
    [maxR,minR,maxG,minG,maxB,minB] = salvarFaixaDeCores(modaR,modaG,modaB,destinoEntrada);
    
    imprimirDadosDeInteresseEmArquivo(arquivoMaiorEixo,arquivoArea,arquivoCorR,arquivoCorG,arquivoCorB,minMaiorEixo,maxMaiorEixo,minArea,maxArea,maxR,minR,maxG,minG,maxB,minB);
    
    fclose(arquivoMaiorEixo);
    fclose(arquivoArea);
    fclose(arquivoCorR);
    fclose(arquivoCorG);
    fclose(arquivoCorB);
    
end