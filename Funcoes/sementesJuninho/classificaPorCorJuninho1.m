function saida = classificaPorCorJuninho1(r,g,b)

    feijao = 0;
    milho = 0;
    pseudocor = 0;
    
    %% R
    
    if r >= 33 & r <= 52
        
        feijao = feijao + 1;
        
    end
    
    if r >= 203 & r <= 255
        
        milho = milho + 1;
        
    end
    
    %% G
    
    if g >= 33 & g <= 52
        
        feijao = feijao + 1;
        
    end
    
    if g >= 203 & g <= 255
        
        milho = milho + 1;
        
    end
    
    %% B
    
    if b >= 41 & b <= 64
        
        feijao = feijao + 1;
        
    end
    
    if b >= 51 & b <= 103
        
        milho = milho + 1;
        
    end

    if feijao > milho

       %feijao

       pseudocor = 3;

       disp('feijao');
       

    elseif milho > feijao

       %milho

       pseudocor = 4;

       disp('milho');

    end
    
    saida = pseudocor;

end