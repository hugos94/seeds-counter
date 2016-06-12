function imSaida = detectarBordasBanda(imEntrada,tamanhoDoElementoEstruturanteDeteccaoDeBordas,flagFronteira,flagRoberts,flagPrewitt)
    
    imSomaBordas = zeros(size(imEntrada));
    
    if flagFronteira == 1
        
        imBordas = fronteira(imEntrada,tamanhoDoElementoEstruturanteDeteccaoDeBordas); % parametro tamanho do elemento estruturante

    %     figure, imshow(imBordas),title(['Bordas']);


        imLimiarAutomatico = limiarAutomatico(imBordas);

%         figure, imshow(imLimiarAutomatico),title(['Limiar = ' num2str(tamanhoDoElementoEstruturanteDeteccaoDeBordas)]);
%         set(gcf,'name','Fronteira','numbertitle','off');
        
        imSomaBordas = imLimiarAutomatico;
        
    end
    
    if flagRoberts == 1

        imBordas1 = metodosDeDeteccaoDeBorda('Roberts',imEntrada);

%         figure, imshow(imBordas1),title(['Bordas']);
%         set(gcf,'name','Roberts','numbertitle','off');
        
        imSomaBordas = imSomaBordas + imBordas1;
        
    end
    
    if flagPrewitt == 1
    
        imBordas2 = metodosDeDeteccaoDeBorda('Prewitt',imEntrada);

%         figure, imshow(imBordas2),title(['Bordas']);
%         set(gcf,'name','Prewitt','numbertitle','off');
        
        imSomaBordas = imSomaBordas + imBordas2;
        
    end
    
    imSaida = imSomaBordas;

end