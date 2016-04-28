function mostrarBandasDeCores(im)

    figure, imshow(im(:,:,1));title('R');
    figure, imshow(im(:,:,2));title('G');
    figure, imshow(im(:,:,3));title('B');
    
    hsv = rgb2hsv(im);
    
    figure, imshow(hsv(:,:,1));title('H');
    figure, imshow(hsv(:,:,2));title('S');
    figure, imshow(hsv(:,:,3));title('V');
    
    YIQ = rgb2ntsc(im);
    
    figure, imshow(YIQ(:,:,1));title('Y');
    figure, imshow(YIQ(:,:,2));title('I');
    figure, imshow(YIQ(:,:,3));title('Q');
    
    YCbCr = rgb2ycbcr(im);
    
    figure, imshow(YCbCr(:,:,1));title('Y');
    figure, imshow(YCbCr(:,:,2));title('Cb');
    figure, imshow(YCbCr(:,:,3));title('Cr');
    
    
    % YIQ, L*a*b, NTSC, XYZ, YCbCr
end
