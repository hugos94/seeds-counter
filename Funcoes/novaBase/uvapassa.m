function uvapassa()

    %Usa CMYK pra definir um limiar

    clc

    qtImagens = 11;
    
    arquivoMaiorEixo = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Passa/tamanhoDoMaiorEixo.txt'],'wt');
    arquivoArea = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Passa/area.txt'],'wt');
    arquivoCorR = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Passa/corR.txt'],'wt');
    arquivoCorG = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Passa/corG.txt'],'wt');
    arquivoCorB = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Passa/corB.txt'],'wt');
    
    modaR = zeros(qtImagens,1,1);
    modaG = zeros(qtImagens,1,1);
    modaB = zeros(qtImagens,1,1);
    
    maxMaiorEixo = double(0);
    minMaiorEixo = realmax;
    
    maxArea = double(0);
    minArea = realmax;
    
    destinoEntrada = ['..\..\Imagens\Sementes Individuais\Sementes Novas\Uva Passa\'];
    
    destinoSaida = ['..\..\Imagens\Sementes Individuais\Sementes Novas\Uva Passa\BandasDeCores\'];
    
    mostrarBandasDeCoresVariasImagens(destinoEntrada,destinoSaida,1,qtImagens);

    for i = 1:qtImagens
        
        imUvaPassa = imread(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Passa/' num2str(i) '.png']);
        
        CMYK = rgb2cmyk(imUvaPassa);

        imBinaria = limiarAutomatico(CMYK(:,:,4));

%         figure,imshow(imBinaria),title(['Uva Passa ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Uva Passa ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,1000);

    %     figure,imshow(imMenosRuidosa),title(['Uva Passa ' num2str(i) ' menos ruidos']);
    
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
        
        modaR(i,1,1) = aplicaMascaraCalculaModa(imUvaPassa(:,:,1),imMenosRuidosa);
        
        modaG(i,1,1) = aplicaMascaraCalculaModa(imUvaPassa(:,:,2),imMenosRuidosa);
        
        modaB(i,1,1) = aplicaMascaraCalculaModa(imUvaPassa(:,:,3),imMenosRuidosa);
        
        imwrite(imMenosRuidosa,['../../Imagens/Sementes Individuais\Sementes Novas\Uva Passa/m' num2str(i) '.png']);
        
    end
    
    salvarFaixaDeCores(destinoEntrada,modaR,modaG,modaB,arquivoCorR,arquivoCorG,arquivoCorB);
    
    imprimirDadosDeInteresseEmArquivo(arquivoMaiorEixo,arquivoArea,minMaiorEixo,maxMaiorEixo,minArea,maxArea);
    
    fclose(arquivoMaiorEixo);
    fclose(arquivoArea);
    fclose(arquivoCorR);
    fclose(arquivoCorG);
    fclose(arquivoCorB);
    
end