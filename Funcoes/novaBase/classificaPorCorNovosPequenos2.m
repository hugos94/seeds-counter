function saida = classificaPorCorNovosPequenos2(r,g,b)

    tipo = 'nenhum';
    pseudocor = 0;
    
    
    %% R
    if r >= 206 & r <= 224 & g >= 140 & g <= 155 & b >= 51 & b <= 65
        
        pseudocor = 2;
        
    end
    
    if r >= 84 & r <= 93 & g >= 88 & g <= 99 & b >= 91 & b <= 100
        
        pseudocor = 1;
        
    end
    
    saida = pseudocor;

end