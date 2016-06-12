function saida = classificaPorCor(r,g,b)

    tipo = 'nenhum';
    pseudocor = 0;
    
    acumulador = zeros(5,2);
    
    %acumulador: primeira coluna tem as pseudocores, segunda coluna tem o
    %valor acumulado
    
    %posições do acumulador:
    %1 - castanha
    %2 - morango
    %3 - azeitona
    %4 - cereja
    %5 - amendoim
    
    acumulador(1,1) = 1;
    acumulador(2,1) = 6;
    acumulador(3,1) = 4;
    acumulador(4,1) = 3;
    acumulador(5,1) = 2;
    
    
    
    %% R
    if r >= 90 & r <= 112
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if r >= 128 & r <= 149
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    
    if r >= 123 & r <= 134
        
        acumulador(3,2) = acumulador(3,2) + 1;
        
    end
    
    if r >= 117 & r <= 132
        
        acumulador(4,2) = acumulador(4,2) + 1;
        
    end
    
    if r >= 64 & r <= 84
        
        acumulador(5,2) = acumulador(5,2) + 1;
        
    end
    
    %% G
    
    if g >= 71 & g <= 101
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if g >= 14 & g <= 34
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    
    if g >= 91 & g <= 112
        
        acumulador(3,2) = acumulador(3,2) + 1;
        
    end
    
    if g >= 4 & g <= 47
        
        acumulador(4,2) = acumulador(4,2) + 1;
        
    end
    
    if g >= 33 & g <= 52
        
        acumulador(5,2) = acumulador(5,2) + 1;
        
    end
    
    
    
    %% B
    
    if b >= 31 & b <= 62
        
        acumulador(1,2) = acumulador(1,2) + 1;
        
    end
    
    if  b == 0
        
        acumulador(2,2) = acumulador(2,2) + 1;
        
    end
    

    if  b >= 26 & b <= 47
        
        acumulador(3,2) = acumulador(3,2) + 1;
        
    end
    

    if  b >= 4 & b <= 24
        
        acumulador(4,2) = acumulador(4,2) + 1;
        
    end
    
   
    if  b >= 33 & b <= 48
        
        acumulador(5,2) = acumulador(5,2) + 1;
        
    end
    
    acumulador = sortrows(acumulador,-2);
    
    maior = acumulador(1,2);
    segundoMaior = acumulador(2,2);
    
    if maior ~= segundoMaior
       
        pseudocor = acumulador(1,1);
        
    end
    
    saida = pseudocor;

end