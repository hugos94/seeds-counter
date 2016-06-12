function imSaida = classificacaoJuninho(imMascara,imEntrada)

    imSaida = zeros(size(imMascara));
    
    imR = zeros(size(imMascara,1),size(imMascara,2),1);
    imG = zeros(size(imMascara,1),size(imMascara,2),1);
    imB = zeros(size(imMascara,1),size(imMascara,2),1);

    [imRotulada, numeroDeRotulos] = bwlabel(imMascara);
    
    Propriedades = regionprops(imRotulada,'MajorAxisLength','Area');
    
    for semente = 1:numeroDeRotulos
        
        pseudocor = 0;
        
        indiceLinear = find(imRotulada == semente);
        
        area = Propriedades(semente).Area
        
        auxR = imEntrada(:,:,1);
        auxG = imEntrada(:,:,2);
        auxB = imEntrada(:,:,3);
        
        r = mode(mode(auxR(indiceLinear)))
        g = mode(mode(auxG(indiceLinear)))
        b = mode(mode(auxB(indiceLinear)))
        
        
        
        if area >= 1795 & area <= 3004 %tamanho
            
           %%coento
           
           pseudocor = 1;
           
           disp('coento');
           
        elseif area >= 15977 & area <= 25464 %tamanho
            
            %%abobora
            
            pseudocor = 2;

        elseif area >= 3773 & area <= 13087 %tamanho
            
            pseudocor = classificaPorCorJuninho1(r,g,b);
            
        elseif area >= 38035 %tamanho
            
            pseudocor = classificaPorCorJuninho2(r,g,b);

        end
        
        [r,g,b] = pseudoCor(pseudocor);
        
        imR(indiceLinear) = r;
        imG(indiceLinear) = g;
        imB(indiceLinear) = b;
        
    end
    
    imSaida(:,:,1) = imR;
    imSaida(:,:,2) = imG;
    imSaida(:,:,3) = imB;

