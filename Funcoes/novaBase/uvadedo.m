function uvadedo()

    %Usa CMYK pra definir um limiar

    clc

    qtImagens = 7;
    
    arquivoMaiorEixo = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Dedo/tamanhoDoMaiorEixo.txt'],'wt');
    arquivoArea = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Dedo/area.txt'],'wt');
    arquivoCorR = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Dedo/corR.txt'],'wt');
    arquivoCorG = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Dedo/corG.txt'],'wt');
    arquivoCorB = fopen(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Dedo/corB.txt'],'wt');
    
    modaR = zeros(qtImagens,1,1);
    modaG = zeros(qtImagens,1,1);
    modaB = zeros(qtImagens,1,1);
    
    maxMaiorEixo = double(0);
    minMaiorEixo = realmax;
    
    maxArea = double(0);
    minArea = realmax;
    
    destinoEntrada = ['..\..\Imagens\Sementes Individuais\Sementes Novas\Uva Dedo\'];
    
    destinoSaida = ['..\..\Imagens\Sementes Individuais\Sementes Novas\Uva Dedo\BandasDeCores\'];
    
    mostrarBandasDeCoresVariasImagens(destinoEntrada,destinoSaida,1,qtImagens);

    for i = 1:qtImagens
        
        imUvaDedo = imread(['../../Imagens/Sementes Individuais\Sementes Novas\Uva Dedo/' num2str(i) '.png']);
        
        CMYK = rgb2cmyk(imUvaDedo);

        imBinaria = limiarAutomatico(CMYK(:,:,4));

%         figure,imshow(imBinaria),title(['Uva Dedo ' num2str(i) ' binaria']);

        imPreenchida =  preencherEspacos(imBinaria,8);

    %     figure,imshow(imPreenchida),title(['Uva Dedo ' num2str(i) ' preenchida']);

        imMenosRuidosa = bwareaopen(imPreenchida,50);

    %     figure,imshow(imMenosRuidosa),title(['Uva Dedo ' num2str(i) ' menos ruidos']);
    
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
        
        modaR(i,1,1) = aplicaMascaraCalculaModa(imUvaDedo(:,:,1),imMenosRuidosa);
        
        modaG(i,1,1) = aplicaMascaraCalculaModa(imUvaDedo(:,:,2),imMenosRuidosa);
        
        modaB(i,1,1) = aplicaMascaraCalculaModa(imUvaDedo(:,:,3),imMenosRuidosa);
        
        imwrite(imMenosRuidosa,['../../Imagens/Sementes Individuais\Sementes Novas\Uva Dedo/m' num2str(i) '.png']);
        
    end
    
    salvarFaixaDeCores(modaR,modaG,modaB,arquivoCorR,arquivoCorG,arquivoCorB);
    
    imprimirDadosDeInteresseEmArquivo(arquivoMaiorEixo,arquivoArea,minMaiorEixo,maxMaiorEixo,minArea,maxArea);
    
    fclose(arquivoMaiorEixo);
    fclose(arquivoArea);
    fclose(arquivoCorR);
    fclose(arquivoCorG);
    fclose(arquivoCorB);
    
end