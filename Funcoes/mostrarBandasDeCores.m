function mostrarBandasDeCores(im,destinoSaida,salvarImagem)

    if salvarImagem == 0
        figure, imshow(im(:,:,1)),title('R');
        set(gcf,'name','R','numbertitle','off');
        figure, imshow(im(:,:,2)),title('G');
        set(gcf,'name','G','numbertitle','off');
        figure, imshow(im(:,:,3)),title('B');
        set(gcf,'name','B','numbertitle','off');
    end
    
    if salvarImagem == 1
        imwrite(im(:,:,1),[destinoSaida '/R.tif']);
        imwrite(im(:,:,2),[destinoSaida '/G.tif']);
        imwrite(im(:,:,3),[destinoSaida '/B.tif']);
    end
    
    hsv = rgb2hsv(im);
    
    if salvarImagem == 0
        figure, imshow(hsv(:,:,1)),title('H');
        set(gcf,'name','H','numbertitle','off');
        figure, imshow(hsv(:,:,2)),title('S');
        set(gcf,'name','S','numbertitle','off');
        figure, imshow(hsv(:,:,3)),title('V');
        set(gcf,'name','V','numbertitle','off');
    end
    
    if salvarImagem == 1
        imwrite(hsv(:,:,1),[destinoSaida '/H.tif']);
        imwrite(hsv(:,:,2),[destinoSaida '/S.tif']);
        imwrite(hsv(:,:,3),[destinoSaida '/V.tif']);
    end

    
    YIQ = rgb2ntsc(im);
    
    if salvarImagem == 0
        figure, imshow(YIQ(:,:,1));title('Y');
        set(gcf,'name','Y','numbertitle','off');
        figure, imshow(YIQ(:,:,2));title('I');
        set(gcf,'name','I','numbertitle','off');
        figure, imshow(YIQ(:,:,3));title('Q');
        set(gcf,'name','Q','numbertitle','off');
    end
    
    if salvarImagem == 1
        imwrite(YIQ(:,:,1),[destinoSaida '/Y.tif']);
        imwrite(YIQ(:,:,2),[destinoSaida '/I.tif']);
        imwrite(YIQ(:,:,3),[destinoSaida '/Q.tif']);
    end
    
    YCbCr = rgb2ycbcr(im);
    
    if salvarImagem == 0
        figure, imshow(YCbCr(:,:,1));title('Y');
        set(gcf,'name','Y','numbertitle','off');
        figure, imshow(YCbCr(:,:,2));title('Cb');
        set(gcf,'name','Cb','numbertitle','off');
        figure, imshow(YCbCr(:,:,3));title('Cr');
        set(gcf,'name','Cr','numbertitle','off');
    end
    
    if salvarImagem == 1
        imwrite(YCbCr(:,:,1),[destinoSaida '/Y.tif']);
        imwrite(YCbCr(:,:,2),[destinoSaida '/Cb.tif']);
        imwrite(YCbCr(:,:,3),[destinoSaida '/Cr.tif']);
    end
    
    
    Lab = RGB2Lab(im);
    
    if salvarImagem == 0
        figure, imshow(Lab(:,:,1));title('L');
        set(gcf,'name','L','numbertitle','off');
        figure, imshow(Lab(:,:,2));title('a');
        set(gcf,'name','a','numbertitle','off');
        figure, imshow(Lab(:,:,3));title('b');
        set(gcf,'name','b','numbertitle','off');
    end
    
    if salvarImagem == 1
        imwrite(Lab(:,:,1),[destinoSaida '/L.tif']);
        imwrite(Lab(:,:,2),[destinoSaida '/a.tif']);
        imwrite(Lab(:,:,3),[destinoSaida '/b.tif']);
    end
    
    luv = rgb2LUV(im);
    
    if salvarImagem == 0
        figure, imshow(luv(:,:,1));title('l');
        set(gcf,'name','l','numbertitle','off');
        figure, imshow(luv(:,:,2));title('u');
        set(gcf,'name','u','numbertitle','off');
        figure, imshow(luv(:,:,3));title('v');
        set(gcf,'name','v','numbertitle','off');
    end
    
    if salvarImagem == 1
        imwrite(luv(:,:,1),[destinoSaida '/l.tif']);
        imwrite(luv(:,:,2),[destinoSaida '/u.tif']);
        imwrite(luv(:,:,3),[destinoSaida '/v.tif']);
    end
    
    CMYK = rgb2cmyk(im);
    
    if salvarImagem == 0
        figure, imshow(CMYK(:,:,1));title('C');
        set(gcf,'name','C','numbertitle','off');
        figure, imshow(CMYK(:,:,2));title('M');
        set(gcf,'name','M','numbertitle','off');
        figure, imshow(CMYK(:,:,3));title('Y');
        set(gcf,'name','Y','numbertitle','off');
        figure, imshow(CMYK(:,:,4));title('K');
        set(gcf,'name','K','numbertitle','off');
    end
    
    if salvarImagem == 1
        imwrite(CMYK(:,:,1),[destinoSaida '/C.tif']);
        imwrite(CMYK(:,:,2),[destinoSaida '/M.tif']);
        imwrite(CMYK(:,:,3),[destinoSaida '/Y.tif']);
        imwrite(CMYK(:,:,4),[destinoSaida '/K.tif']);
    end
    
    % YIQ, L*a*b, NTSC, XYZ, YCbCr, Luv
end
