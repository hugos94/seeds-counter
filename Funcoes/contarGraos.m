function contarGraos(qtClasses)

    clc
    
    for i = 1:3
        
        imEntrada = imread(['..\Imagens\t' num2str(i) '.jpg']);

        hsv = rgb2hsv(imEntrada);
        
        h = hsv(:,:,1);
        s = hsv(:,:,2);
        v = hsv(:,:,3);
        
        R = imEntrada(:,:,1);
        G = imEntrada(:,:,2);
        B = imEntrada(:,:,3);

    %     imshow(R);

        imSemRuido = filtroMediana(s);

        figure, imshow(imSemRuido);

    %     imEqualizada = equalizarHistograma(imSemRuido);

    %     figure, imshow(imEqualizada);

        imBordas = deteccaoBordasDilatacao(imSemRuido,20); % parametro tamanho do elemento estruturante

        figure, imshow(imBordas);   
        
%         imLimiarAutomatico = limiarAutomatico(imBordas);
% 
%     %     figure, imshow(imLimiarAutomatico);
% 
%         imAberta = abertura(imLimiarAutomatico,5);
% 
%     %     figure, imshow(imAberta);
% 
%         imDilatada = dilatacao(imAberta,5);
% 
%     %     figure, imshow(imDilatada);
% 
%         imPreenchida = preencherEspacos(imDilatada,8); % parametro tamanho do elemento estruturante
% 
%     %     figure, imshow(imPreenchida);
% 
%         [total,~] = contarComponentesConectadas(imPreenchida);
% 
%         disp(['Total de grãos = ' num2str(total)]);
% 
%         imComMascara = aplicarMascara(R,imPreenchida);
% 
%     %     figure, imshow(imComMascara);
% 
%         tamanhoDoIncrementoDeIntensidade = uint8(253/qtClasses);
% 
%         disp(['Tamanho do incremento =' num2str(tamanhoDoIncrementoDeIntensidade)]);
% 
%         limiteInferior = 0;
% 
%         limiteSuperior = tamanhoDoIncrementoDeIntensidade;
% 
%         for i = 1:qtClasses-1
% 
%            imClasse = limiar(imComMascara,limiteInferior,limiteSuperior);
% 
%     %        figure, imshow(imClasse);
% 
%            imErodida = erosao(imClasse,2);
% 
%     %        figure, imshow(imErodida);
% 
%            imPreenchida = preencherEspacos(imErodida,8); % parametro tamanho do elemento estruturante
% 
%     %        figure, imshow(imPreenchida);
% 
%            imAberta = abertura(imPreenchida,20);
% 
%     %        figure, imshow(imAberta);
% 
%            limiteInferior = limiteInferior+tamanhoDoIncrementoDeIntensidade;
% 
%            limiteSuperior = limiteSuperior+tamanhoDoIncrementoDeIntensidade;
% 
%            [quantidade,imLabel] = contarComponentesConectadas(imAberta);
% 
%     %     figure, imshow(imLabel);
% 
%            disp(['A classe ' num2str(i) ' tem ' num2str(quantidade) ' grãos']);
% 
%            imAberta = ~imAberta;
% 
%            imComMascara = aplicarMascara(imComMascara,imAberta);
% 
%            total = total-quantidade;
% 
%     %        figure, imshow(imComMascara);
%         end
% 
%         disp(['A classe ' num2str(qtClasses) ' tem ' num2str(total) ' graos']);

    end
end