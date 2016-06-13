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
    if r >= 171 & r <= 189
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if r >= 88 & r <= 97
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    
    if r >= 148 & r <= 191
        
        acumulador(3,2) = acumulador(3,2) + 1;
        
    end
    
    %% G
    
    if g >= 89 & g <= 95
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if g >= 93 & g <= 100
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    
    if g >= 113 & g <= 141
        
        acumulador(3,2) = acumulador(3,2) + 1;
        
    end
    
    %% B
    
    if b >= 94 & b <= 100
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if  b >= 97 & b <= 104
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    

    if  b >= 65 & b <= 80
        
        acumulador(3,2) = acumulador(3,2) + 1;
        
    end
    
    acumulador = sortrows(acumulador,-2)
    
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