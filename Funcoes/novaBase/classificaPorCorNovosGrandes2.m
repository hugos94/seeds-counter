function saida = classificaPorCorNovosGrandes2(r,g,b)

    tipo = 'nenhum';
    pseudocor = 0;
    
    
    %% R
    if r >= 171 & r <= 189 & g >= 89 & g <= 95 & b >= 94 & b <= 100
        
        pseudocor = 6;
        
    end
    
    if r >= 88 & r <= 97 & g >= 93 & g <= 100 & b >= 97 & b <= 104
        
        pseudocor = 4;
        
    end
    
    if r >= 148 & r <= 191 & g >= 113 & g <= 141 & b >= 65 & b <= 80
        
        pseudocor = 5;
        
    end
    
    saida = pseudocor;

end