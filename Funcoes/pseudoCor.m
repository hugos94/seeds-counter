function [r,g,b] = pseudoCor(valor)

    switch(valor)
        
        case 0%branco
            
            %nao conseguiu classificar
            
            r = 255;
            g = 255;
            b = 255;
        
        case 1%marrom
            
            %castanha 
            %coento Juninho
            %Feijao Novo
            
            r = 153;
            g = 51;
            b = 0;
            
        case 2%roseo
            
            %amendoim 
            %abobora Juninho
            %Uva Passa Novo
            
            r = 255;
            g = 0;
            b = 255;
            
        case 3%vermelho
            
            %cereja 
            %feijao Juninho
            %tomate Novo
            
            r = 255;
            g = 0;
            b = 0;
            
        case 4%azul
            
            %azeitona
            %milho Juninho
            %Uva Dedo Novo
            
            r = 0;
            g = 0;
            b = 153;
            
        case 5%verde
            
            %ervilha
            %alho Juninho
            %Azeitona Novo
            
            r = 0;
            g = 51;
            b = 0;
            
            
        case 6%roxo
            
            %morango
            %amendoim Juninho
            %Uva Novo
            
            r = 102;
            g = 0;
            b = 255;
        
    end

end