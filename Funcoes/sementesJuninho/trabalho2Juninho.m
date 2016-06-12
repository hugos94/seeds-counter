function trabalho2Juninho()

    clc
    
    tamanhoDoElementoEstruturanteDeteccaoDeBordas = 1;
%     tamanhoDoElementoEstruturanteAbertura = 10;
%     tamanhoDoElementoEstruturanteFechamento = 15;
    removerElementosDeTamanho = 1000;
    
    imEntrada = imread(['..\..\Imagens\SementesJuninho\alho1.jpg']);
    
    CMYK = rgb2cmyk(imEntrada);

    K = CMYK(:,:,4);
    
    hsv = rgb2hsv(imEntrada);

    s = hsv(:,:,2);
    
    imSuavizadaK = filtroMediana(K);
    
    imSuavizadaS = filtroMediana(s);
    
    imBordasK = detectarBordasBanda(imSuavizadaK,tamanhoDoElementoEstruturanteDeteccaoDeBordas);
    
    figure, imshow(imBordasK);
    set(gcf,'name','BordasK','numbertitle','off');
    
%     imBordasS = detectarBordasBanda(imSuavizadaS,tamanhoDoElementoEstruturanteDeteccaoDeBordas);
    
%     figure, imshow(imBordasS);
%     set(gcf,'name','BordasS','numbertitle','off');
    
%     imSomaBordas = imBordasK+imBordasS;

    figure, imshow(imBordasK);
    set(gcf,'name','Bordas','numbertitle','off');
    
%     imFechamento = fechamento(imSomaBordas,tamanhoDoElementoEstruturanteFechamento);

%     figure, imshow(imFechamento);
%     set(gcf,'name','Fechamento','numbertitle','off');
    
    imSemRuidos2 = bwareaopen(imBordasK,removerElementosDeTamanho);
    
    figure, imshow(imSemRuidos2);
    set(gcf,'name',['Removendo componentes menores = ' num2str(removerElementosDeTamanho)],'numbertitle','off');

    imPreenchida = preencherEspacos(imSemRuidos2,8); % parametro tamanho do elemento estruturante

    figure, imshow(imPreenchida);
    set(gcf,'name','Preencher buracos','numbertitle','off');
    
%     imAbertura = abertura(imPreenchida,tamanhoDoElementoEstruturanteAbertura);
    
%     figure, imshow(imAbertura);
%     set(gcf,'name',['Abertura = ' num2str(tamanhoDoElementoEstruturanteAbertura)],'numbertitle','off');
    
    imRotulada = classificacaoJuninho(imPreenchida,imEntrada);
    figure, imshow(imRotulada);
    set(gcf,'name','Rotulos','numbertitle','off');
    
    
end