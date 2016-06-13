function mostrarBandasDeCoresVariasImagens(destinoEntrada,destinoSaida,salvarImagem,qtImagens)
    
    for i = 1:qtImagens
        
        im = imread([destinoEntrada num2str(i) '.png']);
        
        mostrarBandasDeCores(im,[destinoSaida num2str(i) ],salvarImagem);
        
    end

end