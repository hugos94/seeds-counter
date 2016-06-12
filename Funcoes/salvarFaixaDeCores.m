function [maxR,minR,maxG,minG,maxB,minB] = salvarFaixaDeCores(modaR,modaG,modaB,destinoSaida)

    r = max(modaR(:,1,1));
    maxR = r;
    fimR = min(modaR(:,1,1));
    
    g = max(modaG(:,1,1));
    maxG = g;
    fimG = min(modaG(:,1,1));
    
    b = max(modaB(:,1,1));
    maxB = b;
    fimB = min(modaB(:,1,1));
    
    faixaDeCores = [];
    
    matrizAux = zeros(100,100,3);
    
    while r > 0 & b > 0 & g > 0 & r >= fimR & g >= fimG & b >= fimB
        
        matrizAux(:,:,1) = r;
        matrizAux(:,:,2) = g;
        matrizAux(:,:,3) = b;
        
        faixaDeCores = [faixaDeCores matrizAux];
        
        r = r-1;
        b = b-1;
        g = g-1;
        
    end
    
    minR = r;
    minG = g;
    minB = b;
    
    imwrite(mat2gray(faixaDeCores),[destinoSaida 'faixaDeCores.png']);

end