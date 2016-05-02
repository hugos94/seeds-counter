function [quantidade,imSaida] = contarComponentesConectadas(imEntrada)

    [imRotulada, numeroDeRotulos] = bwlabel(imEntrada);
    
    componentesConectadas = bwconncomp(imEntrada);
    
    labeled = labelmatrix(componentesConectadas);
    imSaida = label2rgb(labeled, @copper, 'c', 'shuffle');
    
    quantidade = numeroDeRotulos;
    
    imSaida = imRotulada;
end