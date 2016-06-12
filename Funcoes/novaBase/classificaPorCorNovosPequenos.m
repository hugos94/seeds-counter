function saida = classificaPorCorNovosPequenos(r,g,b)

    tipo = 'nenhum';
    pseudocor = 0;
    
    acumulador = zeros(2,2);
    
    %acumulador: primeira coluna tem as pseudocores, segunda coluna tem o
    %valor acumulado
    
    %posições do acumulador:
    %1 - Uva Passa
    %2 - Feijao
    
    %pseudocor
    acumulador(1,1) = 1;
    acumulador(2,1) = 2;
    
    
    
    %% R
    if r >= 206 & r <= 224
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if r >= 84 & r <= 93
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    
    %% G
    
    if g >= 140 & g <= 155
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if g >= 88 & g <= 99
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    
    %% B
    
    if b >= 51 & b <= 65
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if  b >= 91 & b <= 100
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
        
    acumulador = sortrows(acumulador,-2);
    
    maior = acumulador(1,2);
    segundoMaior = acumulador(2,2);
    
    if maior ~= segundoMaior
       
        pseudocor = acumulador(1,1);
        
    end
    
    saida = pseudocor;

end