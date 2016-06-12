function imSaida = deteccaoDeBorda(imEntrada,valor)

    switch(valor)
        case 1
            imSaida = deteccaoBordasDilatacao(imEntrada,20);
        case 2
            imSaida = edge(imEntrada, 'Canny');
        case 3
            imSaida = edge(imEntrada, 'log');
        case 4
            imSaida = edge(imEntrada, 'Prewitt');
        case 5
            imSaida = edge(imEntrada, 'Roberts');
        case 6
            imSaida = edge(imEntrada, 'Sobel');
        case 7
            imSaida = edge(imEntrada, 'zerocross');
    end
   
end