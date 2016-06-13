function imSaida = classificacaoNovos(imMascara,imEntrada)

    figure, imshow(imEntrada);
    
    imSaida = zeros(size(imMascara));
    
    imR = zeros(size(imMascara,1),size(imMascara,2),1);
    imG = zeros(size(imMascara,1),size(imMascara,2),1);
    imB = zeros(size(imMascara,1),size(imMascara,2),1);
    
    arquivoClassificacao = fopen('classificacao.txt','wt');

    [imRotulada, numeroDeRotulos] = bwlabel(imMascara);
    
    Propriedades = regionprops(imRotulada,'MajorAxisLength','Area');
    
    for semente = 1:numeroDeRotulos
        
%         imComponente = zeros(size(imEntrada));
        
        tipo = 'nenhum';
        
        pseudocor = 0;
        
        indiceLinear = find(imRotulada == semente);
        
        area = Propriedades(semente).Area;
        
        auxR = imEntrada(:,:,1);
        auxG = imEntrada(:,:,2);
        auxB = imEntrada(:,:,3);
        
%         imComponente(indiceLinear) = 255;
        
%         figure,imshow(imComponente);
%         set(gcf,'name',num2str(semente),'numbertitle','off');
        
        modaR = mode(mode(auxR(indiceLinear)));
        modaG = mode(mode(auxG(indiceLinear)));
        modaB = mode(mode(auxB(indiceLinear)));
        
        
        
        if area >= 54494 %tamanho muito grande
           
            %tomate

            pseudocor = 3;
            
            tipo = 'tomate';
            
        elseif area >= 20355 & area < 54494 %tamanho grande
           
            %Uva, Uva Dedo, Azeitona

            [pseudocor,tipo] = classificaPorCorNovosGrandes(modaR,modaG,modaB);
            

        else
                
            [pseudocor,tipo] = classificaPorCorNovosPequenos(modaR,modaG,modaB);
                
        end
        
        fprintf(arquivoClassificacao,['area = ' num2str(area) ' r = ' num2str(modaR) ' g = ' num2str(modaG) ' b = ' num2str(modaB) ' ' tipo '\n']);
        
        [r,g,b] = pseudoCor(pseudocor);
        
        imR(indiceLinear) = r;
        imG(indiceLinear) = g;
        imB(indiceLinear) = b;
        
    end
    
    imSaida(:,:,1) = imR;
    imSaida(:,:,2) = imG;
    imSaida(:,:,3) = imB;

end