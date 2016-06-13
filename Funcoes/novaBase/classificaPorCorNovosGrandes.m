function [saida,tipo] = classificaPorCorNovosGrandes(r,g,b)

    tipo = 'nenhum';
    pseudocor = 0;
    
    acumulador = zeros(3,2);
    
    %acumulador: primeira coluna tem as pseudocores, segunda coluna tem o
    %valor acumulado
    
    %posições do acumulador:
    %1 - Uva
    %2 - Uva Dedo
    %3 - Azeitona
    
    %pseudocor
    acumulador(1,1) = 6;
    acumulador(2,1) = 4;
    acumulador(3,1) = 5;
    
    
    
    %% R
    if r >= 171 & r <= 190
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if r >= 1 & r <= 139
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    
    if r >= 161 & r <= 182
        
        acumulador(3,2) = acumulador(3,2) + 1;
        
    end
    
    %% G
    
    if g >= 102 & g <= 111
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if g >= 109 & g <= 139
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    
    if g >= 125 & g <= 151
        
        acumulador(3,2) = acumulador(3,2) + 1;
        
    end
    
    %% B
    
    if b >= 101 & b <= 118
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if  b >= 111 & b <= 150
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    

    if  b >= 76 & b <= 97
        
        acumulador(3,2) = acumulador(3,2) + 1;
        
    end
    
    acumulador = sortrows(acumulador,-2);
    
    maior = acumulador(1,2);
    segundoMaior = acumulador(2,2);
    
    if maior ~= segundoMaior
       
        pseudocor = acumulador(1,1);
        
    end
    
    switch(pseudocor)
        
        case 6
            
            tipo = 'uva';
            
        case 5
            
            tipo = 'azeitona';
            
        case 4
            
            tipo = 'uva dedo';
    end
    
    saida = pseudocor;

end