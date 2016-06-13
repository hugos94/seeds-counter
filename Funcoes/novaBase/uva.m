function uva()

    %Usa CMYK pra definir um limiar

    clc

    qtImagens = 7;
    
    arquivoMaiorEixo = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva/tamanhoDoMaiorEixo.txt'],'wt');
    arquivoArea = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva/area.txt'],'wt');
    arquivoCorR = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva/corR.txt'],'wt');
    arquivoCorG = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva/corG.txt'],'wt');
    arquivoCorB = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva/corB.txt'],'wt');
    
    modaR = zeros(qtImagens,1,1);
    modaG = zeros(qtImagens,1,1);
    modaB = zeros(qtImagens,1,1);
    
    maxMaiorEixo = double(0);
    minMaiorEixo = realmax;
    
    maxArea = double(0);
    minArea = realmax;
    
    destinoEntrada = ['..\..\Imagens\Sementes Individuais\Sementes Novas\Uva\'];
    
    destinoSaida = ['..\..\Imagens\Sementes Individuais\Sementes Novas\Uva\BandasDeCores\'];
    
    mostrarBandasDeCoresVariasImagens(destinoEntrada,destinoSaida,1,qtImagens);

    for i = 1:qtImagens
        
        imUva = imread(['../../Imagens/Sementes Individuais\Sementes Novas\Uva/' num2str(i) '.png']);
        
        CMYK = rgb2cmyk(imUva);

        imBinaria = limiarAutomatico(CMYK(:,:,4));

%         figure,imshow(imBinaria),title(['Uva ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Uva ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Uva ' num2str(i) ' menos ruidos']);
    
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
        
        modaR(i,1,1) = aplicaMascaraCalculaModa(imUva(:,:,1),imMenosRuidosa);
        
        modaG(i,1,1) = aplicaMascaraCalculaModa(imUva(:,:,2),imMenosRuidosa);
        
        modaB(i,1,1) = aplicaMascaraCalculaModa(imUva(:,:,3),imMenosRuidosa);
        
        imwrite(imMenosRuidosa,['../../Imagens/Sementes Individuais\Sementes Novas\Uva/m' num2str(i) '.png']);
        
    end
    
    salvarFaixaDeCores(destinoEntrada,modaR,modaG,modaB,arquivoCorR,arquivoCorG,arquivoCorB);
    
    imprimirDadosDeInteresseEmArquivo(arquivoMaiorEixo,arquivoArea,minMaiorEixo,maxMaiorEixo,minArea,maxArea);
    
    fclose(arquivoMaiorEixo);
    fclose(arquivoArea);
    fclose(arquivoCorR);
    fclose(arquivoCorG);
    fclose(arquivoCorB);
    
end