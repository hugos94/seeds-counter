function saida = classificaPorCorJuninho2(r,g,b)

    alho = 0;
    amendoim = 0;
    pseudocor = 0;
    
    %% R
    
    if r >= 68 & r <= 129
        
        alho = alho + 1;
        
    end
    
    if r >= 85 & r <= 166
        
        amendoim = amendoim + 1;
        
    end
    
    %% G
    
    if g >= 37 & g <= 98
        
        alho = alho + 1;
        
    end
    
    if g >= 56 & g <= 117
        
        amendoim = amendoim + 1;
        
    end

    amendoim
    alho
    
    if alho > amendoim

       %alho

       pseudocor = 5;

       disp('alho');
       

    elseif amendoim > alho

       %amendoim

       pseudocor = 6;

       disp('amendoim');

    end
    
    saida = pseudocor;

end