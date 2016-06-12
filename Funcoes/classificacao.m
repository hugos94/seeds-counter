function imSaida = classificacao(imMascara,imEntrada)

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
        
        
        
        if area > 6500 %tamanho
            
           %%castanha
           
           pseudocor = 1;
           
           disp('castanha');
           
        elseif area <= 6500 & area >= 2000 %tamanho
            
            disp('aqui');
            
            pseudocor = classificaPorCor(r,g,b);

        else

            if r <= 132 & r >= 108 & g <= 47 & g >= 23 & b <= 24 & b >= 0 %cor
                
                %ervilha

                pseudocor = 5;
                
                disp('ervilha');
                
            end

        end
        
        [r,g,b] = pseudoCor(pseudocor);
        
        imR(indiceLinear) = r;
        imG(indiceLinear) = g;
        imB(indiceLinear) = b;
        
    end
    
    imSaida(:,:,1) = imR;
    imSaida(:,:,2) = imG;
    imSaida(:,:,3) = imB;

end