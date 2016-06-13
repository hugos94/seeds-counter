function salvarFaixaDeCores(destino,modaR,modaG,modaB,arquivoCorR,arquivoCorG,arquivoCorB)

    maxR = max(modaR(:,1,1));
    minR = min(modaR(:,1,1));
    
    maxG = max(modaG(:,1,1));
    minG = min(modaG(:,1,1));
    
    maxB = max(modaB(:,1,1));
    minB = min(modaB(:,1,1));
    
    fprintf(arquivoCorR,'%d - %d\n',minR,maxR);
    
    fprintf(arquivoCorG,'%d - %d\n',minG,maxG);
    
    fprintf(arquivoCorB,'%d - %d\n',minB,maxB);
    
%     criarPaletaDeCores(destino,minR,maxR,minG,maxG,minB,maxB);

end