function imprimirDadosDeInteresseEmArquivo(arquivoMaiorEixo,arquivoArea,arquivoCorR,arquivoCorG,arquivoCorB,minMaiorEixo,maxMaiorEixo,minArea,maxArea,maxR,minR,maxG,minG,maxB,minB)

    fprintf(arquivoMaiorEixo,'%f %f\n',minMaiorEixo,maxMaiorEixo);
    
    fprintf(arquivoArea,'%f %f\n',minArea,maxArea);
    
    fprintf(arquivoCorR,'%d %d\n',maxR,minR);
    
    fprintf(arquivoCorG,'%d %d\n',maxG,minG);
    
    fprintf(arquivoCorB,'%d %d\n',maxB,minB);

end