function imSaida = converterRGBParaLab(imEntrada)

    colorTransform = makecform('srgb2lab');
    imSaida = applycform(imEntrada, colorTransform);
    
end