function criarPaletaDeCores(destino,minR,maxR,minG,maxG,minB,maxB)

    
    matriz3 = [];
    
    imAux = zeros(100,100,3);

    for r = minR:maxR
        matriz2 = [];
        for g = minG:maxG
            matriz1 = [];
            for b = minB:maxB
                
                imAux(:,:,1) = r;
                imAux(:,:,2) = g;
                imAux(:,:,3) = b;
                
                matriz1 = [matriz1 imAux];
                
            end
            matriz2 = [matriz2 matriz1];
        end
        matriz3 = [matriz3;matriz2];
    end
    
    imwrite(mat2gray(matriz3),[destino 'paleta.png']);
    
end