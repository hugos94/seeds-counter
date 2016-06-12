function [r,g,b] = pseudoCor(valor)

    switch(valor)
        
        case 0%nao conseguiu classificar
            %branco
            
            r = 255;
            g = 255;
            b = 255;
        
        case 1%castanha %coento Juninho
            %marrom
            
            r = 153;
            g = 51;
            b = 0;
            
        case 2%amendoim %abobora Juninho
            %roseo
            r = 255;
            g = 0;
            b = 255;
            
        case 3%cereja %feijao Juninho
            %vermelho
            r = 255;
            g = 0;
            b = 0;
            
        case 4%azeitona %milho Juninho
            %azul
            r = 0;
            g = 0;
            b = 153;
            
        case 5%ervilha %alho Juninho
            %verde
            r = 0;
            g = 51;
            b = 0;
            
            
        case 6%morango %amendoim Juninho
            %roxo
            r = 102;
            g = 0;
            b = 255;
        
    end

end