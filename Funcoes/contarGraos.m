function contarGraos(qtClasses)

    clc
    
    for i = 1:1
        
        imEntrada = imread(['..\Imagens\t' num2str(i) '.jpg']);

        hsv = rgb2hsv(imEntrada);
        
        s = hsv(:,:,2);
        
        R = imEntrada(:,:,1);

    %     imshow(R);

        imSemRuido = filtroMediana(s);

%         figure, imshow(imSemRuido);

    %     imEqualizada = equalizarHistograma(imSemRuido);

    %     figure, imshow(imEqualizada);

        imBordas = deteccaoBordasDilatacao(imSemRuido,20); % parametro tamanho do elemento estruturante

%         figure, imshow(imBordas),title('Bordas');  
        
        imLimiarAutomatico = limiarAutomatico(imBordas);

%         figure, imshow(imLimiarAutomatico),title('Limiar');

%         imAberta = abertura(imLimiarAutomatico,5);

%         figure, imshow(imAberta),title('Abertura');

        imDilatada = dilatacao(imLimiarAutomatico,25);

%         figure, imshow(imDilatada),title('Dilatacao');

        imPreenchida = preencherEspacos(imDilatada,8); % parametro tamanho do elemento estruturante

%         figure, imshow(imPreenchida),title('Preencher buracos');

        [total,~] = contarComponentesConectadas(imPreenchida);

        disp(['Total de grãos = ' num2str(total)]);

        imComMascara = aplicarMascara(R,imPreenchida);

    %     figure, imshow(imComMascara);

        tamanhoDoIncrementoDeIntensidade = uint8(253/qtClasses);

        disp(['Tamanho do incremento =' num2str(tamanhoDoIncrementoDeIntensidade)]);

        limiteInferior = 0;

        limiteSuperior = tamanhoDoIncrementoDeIntensidade;

        for i = 1:qtClasses-1

           imClasse = limiar(imComMascara,limiteInferior,limiteSuperior);

           figure, imshow(imClasse), title('Imagem Contagem Classes');

           imErodida = erosao(imClasse,2);

%            figure, imshow(imErodida), title('Erosao');

           imPreenchida = preencherEspacos(imErodida,8); % parametro tamanho do elemento estruturante

%            figure, imshow(imPreenchida),title('Preenchimento');

           imAberta = abertura(imPreenchida,20);

%            figure, imshow(imAberta), title('Abertura');

           limiteInferior = limiteInferior+tamanhoDoIncrementoDeIntensidade;

           limiteSuperior = limiteSuperior+tamanhoDoIncrementoDeIntensidade;

           [quantidade,imLabel] = contarComponentesConectadas(imAberta);

%            figure, imshow(imLabel);

           disp(['A classe ' num2str(i) ' tem ' num2str(quantidade) ' grãos']);

           imAberta = ~imAberta;

           imComMascara = aplicarMascara(imComMascara,imAberta);

           total = total-quantidade;

%            figure, imshow(imComMascara), title('Nova Imagem de Entrada');
        end

        disp(['A classe ' num2str(qtClasses) ' tem ' num2str(total) ' graos']);

    end
end