function moda = aplicaMascaraCalculaModa(imEntrada,imMascara)

    [X,Y] = find(imMascara == 1);
    
    intensidades = zeros(size(X));
    
    for i = 1:size(X,1)
        
            intensidades(i) = imEntrada(X(i),Y(i));
            
    end
    
    moda = mode(mode(intensidades));

end