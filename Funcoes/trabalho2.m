function trabalho2()

    clc
    
    tamanhoDoElementoEstruturanteDeteccaoDeBordas = 1;
%     tamanhoDoElementoEstruturanteErosao = 10;
    tamanhoDoElementoEstruturanteFechamento = 1;
    removerElementosDeTamanho = 1000;
    removerElementosDeTamanho2 = 2150;
    
    for i = 1:9
        disp(i);
        imEntrada = imread(['..\Imagens\Segundo Trabalho\HDR Fonte Unica\' num2str(i) '.jpg']);
    
        CMYK = rgb2cmyk(imEntrada);

        K = CMYK(:,:,4);

        hsv = rgb2hsv(imEntrada);

        s = hsv(:,:,2);

        imSuavizadaK = filtroMediana(K);

        imSuavizadaS = filtroMediana(s);

        imBordasK = detectarBordasBanda(imSuavizadaK,tamanhoDoElementoEstruturanteDeteccaoDeBordas,1,1,1);

        imBordasS = detectarBordasBanda(imSuavizadaS,tamanhoDoElementoEstruturanteDeteccaoDeBordas,0,1,1);

        imSomaBordas = imBordasK+imBordasS;

    %     figure, imshow(imSomaBordas);
    %     set(gcf,'name','Bordas','numbertitle','off');

        imFechamento = fechamento(imSomaBordas,tamanhoDoElementoEstruturanteFechamento);

    %     figure, imshow(imFechamento);
    %     set(gcf,'name','Fechamento','numbertitle','off');

        imSemRuidos1 = bwareaopen(imFechamento,removerElementosDeTamanho);

    %     figure, imshow(imSemRuidos2);
    %     set(gcf,'name',['Removendo componentes menores = ' num2str(removerElementosDeTamanho)],'numbertitle','off');

        imPreenchida = preencherEspacos(imSemRuidos1,8); % parametro tamanho do elemento estruturante

        
        imSemRuidos2 = bwareaopen(imPreenchida,removerElementosDeTamanho2);
        
        %     figure, imshow(imSemRuidos2);
    %     set(gcf,'name',['Removendo componentes menores = ' num2str(removerElementosDeTamanho)],'numbertitle','off');

    %     figure, imshow(imPreenchida);
    %     set(gcf,'name','Preencher buracos','numbertitle','off');

    %     imErodida = erosao(imPreenchida,tamanhoDoElementoEstruturanteErosao);

    %     figure, imshow(imErodida);
    %     set(gcf,'name',['Erosao = ' num2str(tamanhoDoElementoEstruturanteErosao)],'numbertitle','off');

        imRotulada = classificacaoNovos(imSemRuidos2,imEntrada);
        figure, imshow(imRotulada);
        set(gcf,'name','Rotulos','numbertitle','off');
    
    end
    
end