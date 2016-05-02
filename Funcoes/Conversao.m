im = imread('D:\Mestrado\1º período\Análise e Processamento de imagens\1º trabalho\Minhas imagens\3DbRCIiL.jpeg');
%figure, imshow(im);

cie = rgb2ciexyz(im);
%figure, imshow(cie)

%cmyk = rgb2cmyk(im);
%figure, imshow(cmyk)
 
hsi = rgb2hsi(im);
%figure, imshow(hsi)

lab = RGB2Lab(im);
%figure, imshow(lab);

luv = rgb2LUV(im);
%figure, imshow(luv);

B = lab( :,:, 3); % foi o melhor
La = lab( :,:, 1); % foi o melhor
Al = lab( :,:, 2); % foi o melhor
%figure, imshow(B)

 L = hsi( :,:, 1); % esse ficou bom
 %figure, imshow(L)
 A = hsi( :,:, 2);% esse ficou bom
 %figure, imshow(A)
imagem = L+B;
imagem3 = A+B;
%figure, imshow(imagem);
%figure, imshow(imagem3);

im4 = B+Al;

figure, imshow(im4);





sobel = edge(B,'sobel');
%figure, imshow(sobel)
 SE = strel('disk', 7);
%fechamento = imclose(im4, SE);
%figure, imshow(fechamento)