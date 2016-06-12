function bordas = metodosDeDeteccaoDeBorda(nomeFiltro,I)

    switch(nomeFiltro)
        
        case 'sobel'

            [~, threshold] = edge(I, 'sobel');
            fudgeFactor = .5;
            bordas = edge(I,'sobel', threshold * fudgeFactor);
            
        case 'canny'
            
            bordas = edge(I,'Canny');
            
        case 'Prewitt'
            
            bordas = edge(I,'Prewitt');
            
        case 'log'

            bordas = edge(I,'log');
            
        case 'Roberts'
            
            bordas = edge(I,'Roberts');
            
    end
    
end