function [saida,tipo] = classificaPorCorNovosPequenos(r,g,b)

    tipo = 'nenhum';
    pseudocor = 0;
    
    acumulador = zeros(2,2);
    
    %acumulador: primeira coluna tem as pseudocores, segunda coluna tem o
    %valor acumulado
    
    %posições do acumulador:
    %1 - Uva Passa
    %2 - Feijao
    
    %pseudocor
    acumulador(1,1) = 2;
    acumulador(2,1) = 1;
    
    
    
    %% R
    if r >= 204 & r <= 218
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if r >= 100 & r <= 137
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    
    %% G
    
    if g >= 144 & g <= 169
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if g >= 102 & g <= 135
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    
    %% B
    
    if b >= 59 & b <= 101
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if  b >= 105 & b <= 136
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
        
    acumulador = sortrows(acumulador,-2)
    
    maior = acumulador(1,2);
    segundoMaior = acumulador(2,2);
    
    if maior ~= segundoMaior
       
        pseudocor = acumulador(1,1);
        
    end
    
    switch(pseudocor)
        
        case 1
            
            tipo = 'feijao';
            
        case 2
            
            tipo = 'uva passa';
        
    end
    
    saida = pseudocor;

end