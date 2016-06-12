function saida = classificaPorCor(r,g,b)

    azeitona = 0;
    cereja = 0;
    amendoim = 0;
    pseudocor = 0;
    
    %% R
    
    if r >= 68 & r <= 84
        
        amendoim = amendoim + 1;
        
    end
    
    if r >= 87 & r <= 134
        
        azeitona = azeitona + 1;
        
    end
    
    %% G
    
    if g >= 36 & g <= 52
        
        amendoim = amendoim + 1;
        
    end
    
    if g >= 65 & g <= 112
        
        azeitona = azeitona + 1;
        
    end
    
    %% B
    
    if b >= 32 & b <= 48
        
        amendoim = amendoim + 1;
        
    end
    
    if b >= 0 & b <= 47
        
        azeitona = azeitona + 1;
        
    end

    if amendoim > azeitona

       %amendoim

       pseudocor = 2;

       disp('amendoim');
       

    elseif azeitona > amendoim

       %azeitona

       pseudocor = 4;

       disp('azeitona');

    end
    
    saida = pseudocor;

end