function contarGraos(qtClasses)

    clc
    
    classes = zeros(qtClasses,1);
    limiarInferior = zeros(qtClasses,1);
    limiarSuperior = zeros(qtClasses,1);
    qtPixelsNaClasse = zeros(qtClasses,1);
    tamanhoDaJanela = 20;
    tamanhoDoElementoEstruturanteDeteccaoDeBordas = 1;
    tamanhoDoElementoEstruturanteDilatacao = 1;
    tamanhoDoElementoEstruturanteErosao = 14;
    tamanhoQuadrado = 20;
    
        
    imEntrada = imread(['../Imagens/Benchmark5/t3.jpg']);

    hsv = rgb2hsv(imEntrada);

    s = hsv(:,:,2);

%     figure,imshow(s),title('Imagem de entrada S');

    R = imEntrada(:,:,1);

    figure,imshow(R),title('Imagem de entrada R');

    imSemRuido = filtroMediana(s);

%     figure, imshow(imSemRuido),title('Imagem sem ruidos');
        
    imBordas = deteccaoBordasDilatacao(imSemRuido,tamanhoDoElementoEstruturanteDeteccaoDeBordas); % parametro tamanho do elemento estruturante
    
%     figure, imshow(imBordas),title(['Bordas']);

    imLimiarAutomatico = limiarAutomatico(imBordas);

    figure, imshow(imLimiarAutomatico),title(['Limiar = ' num2str(tamanhoDoElementoEstruturanteDeteccaoDeBordas)]);
        
    imDilatada = dilatacao(imLimiarAutomatico,tamanhoDoElementoEstruturanteDilatacao);

%     figure, imshow(imDilatada),title('Dilatacao');

    imPreenchida = preencherEspacos(imDilatada,8); % parametro tamanho do elemento estruturante

    figure, imshow(imPreenchida),title(['Preencher buracos, dilatacao = ' num2str(tamanhoDoElementoEstruturanteDilatacao)]);
    
    imErodida = erosao(imPreenchida,tamanhoDoElementoEstruturanteErosao);

    figure, imshow(imErodida),title(['Erosao = ' num2str(tamanhoDoElementoEstruturanteErosao)]);

    [total,imRotulada] = contarComponentesConectadas(imErodida);

    propriedadeCentroide = regionprops(imRotulada,'centroid');

%         R = filtroMediana(R);

    tamanhoDoIncrementoDeIntensidade = uint8((252/qtClasses));

    disp(['Tamanho do incremento =' num2str(tamanhoDoIncrementoDeIntensidade)]);


    limiarInferior(1,1) = 1;

    limiarSuperior(1,1) = tamanhoDoIncrementoDeIntensidade+1;

    for cont = 2:qtClasses

        limiarInferior(cont,1) = limiarInferior(cont-1,1)+tamanhoDoIncrementoDeIntensidade+1;

        limiarSuperior(cont,1) = limiarSuperior(cont-1,1)+tamanhoDoIncrementoDeIntensidade+1;

    end

    imSaidaQuadrados = uint8(zeros(size(R)));

    for cont = 1:total

        xCentroide = uint16(propriedadeCentroide(cont).Centroid(2));
        yCentroide = uint16(propriedadeCentroide(cont).Centroid(1));

        janela = R(xCentroide-tamanhoDaJanela:xCentroide+tamanhoDaJanela,yCentroide-tamanhoDaJanela:yCentroide+tamanhoDaJanela);

        janela = filtroMediana(janela);

        binarioClasse1 = limiar(janela,limiarInferior(1,1),limiarSuperior(1,1));
        binarioClasse2 = limiar(janela,limiarInferior(2,1),limiarSuperior(2,1));
        binarioClasse3 = limiar(janela,limiarInferior(3,1),limiarSuperior(3,1));

        qtPixelsNaClasse(1,1) = sum(binarioClasse1(:));
        qtPixelsNaClasse(2,1) = sum(binarioClasse2(:));
        qtPixelsNaClasse(3,1) = sum(binarioClasse3(:));

        maximoAux = max(qtPixelsNaClasse(1,1),qtPixelsNaClasse(2,1));
        maximo = max(qtPixelsNaClasse(3,1),maximoAux);

        indice = find(qtPixelsNaClasse == maximo);

        classes(indice,1) = classes(indice,1)+1;
        
        imSaidaQuadrados(xCentroide-tamanhoQuadrado:xCentroide+tamanhoQuadrado,yCentroide-tamanhoQuadrado:yCentroide+tamanhoQuadrado) = uint8(indice*(255/3));
        
        imSaidaQuadrados = desenharBordaDoQuadrado(imSaidaQuadrados,xCentroide-tamanhoQuadrado,xCentroide+tamanhoQuadrado,yCentroide-tamanhoQuadrado,yCentroide+tamanhoQuadrado);

    end
    
    disp(['Total de grãos = ' num2str(total)]);
        
    for cont = 1:qtClasses

        disp(['quantidade de graos na classe ' num2str(cont) ' = ' num2str(classes(cont,1))]);

    end
    
    figure,imshow(imSaidaQuadrados),title(['Classes']);
    
end