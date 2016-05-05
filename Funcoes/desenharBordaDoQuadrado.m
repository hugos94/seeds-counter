function imSaida = desenharBordaDoQuadrado(imEntrada,xmin,xmax,ymin,ymax)

    imEntrada(xmin-1,ymin:ymax) = 0;
    imEntrada(xmin-2,ymin:ymax) = 0;
    imEntrada(xmax+1,ymin:ymax) = 0;
    imEntrada(xmax+2,ymin:ymax) = 0;
    imEntrada(xmin:xmax,ymin-1) = 0;
    imEntrada(xmin:xmax,ymin-2) = 0;
    imEntrada(xmin:xmax,ymax+1) = 0;
    imEntrada(xmin:xmax,ymax+2  ) = 0;
    
    imSaida = imEntrada;

end