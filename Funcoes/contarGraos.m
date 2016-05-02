function contarGraos(qtClasses)

    clc
    
    classes = zeros(qtClasses,1);
    limiarInferior = zeros(qtClasses,1);
    limiarSuperior = zeros(qtClasses,1);
    qtPixelsNaClasse = zeros(qtClasses,1);
    
    for i = 1:1
        
        imEntrada = imread(['..\Imagens\t' num2str(i) '.jpg']);

        hsv = rgb2hsv(imEntrada);
        
        s = hsv(:,:,2);
        
%         figure,imshow(s),title('Imagem de entrada S');
        
        R = imEntrada(:,:,1);

%         figure,imshow(R),title('Imagem de entrada R');

        imSemRuido = filtroMediana(s);

%         figure, imshow(imSemRuido),title('Imagem sem ruidos');

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

        [total,imRotulada] = contarComponentesConectadas(imPreenchida);

        propriedadeCentroide = regionprops(imRotulada,'centroid');
        
        imTeste = zeros(size(R));
        
%         R = filtroMediana(R);
        
        tamanhoDoIncrementoDeIntensidade = uint8((252/qtClasses));

        disp(['Tamanho do incremento =' num2str(tamanhoDoIncrementoDeIntensidade)]);
        
        
        limiarInferior(1,1) = 1;

        limiarSuperior(1,1) = tamanhoDoIncrementoDeIntensidade+1;
        
        for cont = 2:qtClasses
           
            limiarInferior(cont,1) = limiarInferior(cont-1,1)+tamanhoDoIncrementoDeIntensidade+1;

            limiarSuperior(cont,1) = limiarSuperior(cont-1,1)+tamanhoDoIncrementoDeIntensidade+1;
            
        end
        
        imTeste = zeros(size(R));
        
        for cont = 1:total
            
            cont
            
            xCentroide = uint16(propriedadeCentroide(cont).Centroid(2));
            yCentroide = uint16(propriedadeCentroide(cont).Centroid(1));
            
            janela = R(xCentroide-5:xCentroide+5,yCentroide-5:yCentroide+5);
            
            binarioClasse1 = limiar(janela,limiarInferior(1,1),limiarSuperior(1,1));
            binarioClasse2 = limiar(janela,limiarInferior(2,1),limiarSuperior(2,1));
            binarioClasse3 = limiar(janela,limiarInferior(3,1),limiarSuperior(3,1));
            
            qtPixelsNaClasse(1,1) = sum(binarioClasse1(:));
            qtPixelsNaClasse(2,1) = sum(binarioClasse2(:));
            qtPixelsNaClasse(3,1) = sum(binarioClasse3(:))
            
            maximoAux = max(qtPixelsNaClasse(1,1),qtPixelsNaClasse(2,1));
            maximo = max(qtPixelsNaClasse(3,1),maximoAux);
            
            indice = find(qtPixelsNaClasse == maximo);
            
            classes(indice,1) = classes(indice,1)+1
            
            imTeste(xCentroide-5:xCentroide+5,yCentroide-5:yCentroide+5) = uint8(indice*(255/3));
            
            figure,imshow(imTeste),title(['Grao ' num2str(cont)]);
            
            
            
            
%             somaDasIntensidades = sum(sum(janela));
%             intensidade = uint8(somaDasIntensidades/441)
%             imTeste(xCentroide-10:xCentroide+10,yCentroide-10:yCentroide+10) = intensidade;
            
%             if cont>= 29
%             
%                 figure,imshow(imTeste),title(['Grao ' num2str(cont)]);
%                 
%             end
            
        end
        
%         figure,imshow(imTeste),title('Teste');
        
        disp(['Total de grãos = ' num2str(total)]);
        
        for cont = 1:qtClasses
            
            disp(['quantidade de graos na classe ' num2str(cont) ' = ' num2str(classes(cont,1))]);
            
        end

%         imComMascara = aplicarMascara(R,imPreenchida);

%         figure, imshow(imComMascara),title('Imagem aplicada a mascara');

%         for i = 1:qtClasses-1
% 
%            imClasse = limiar(imTeste,limiteInferior,limiteSuperior);
% 
%            figure, imshow(imClasse), title('Imagem Contagem Classes');
% 
%            limiteInferior = limiteInferior+tamanhoDoIncrementoDeIntensidade+1;
% 
%            limiteSuperior = limiteSuperior+tamanhoDoIncrementoDeIntensidade+1;
% 
%            [quantidade,imLabel] = contarComponentesConectadas(imClasse);
% 
% %            figure, imshow(imLabel);
% 
%            disp(['A classe ' num2str(i) ' tem ' num2str(quantidade) ' grãos']);
% 
%            imTeste = imTeste-imClasse;
% 
%            total = total-quantidade;
% 
% %            figure, imshow(imComMascara), title('Nova Imagem de Entrada');
%         end
% 
%         disp(['A classe ' num2str(qtClasses) ' tem ' num2str(total) ' graos']);

    end
end