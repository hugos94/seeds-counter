function testes()

clear; clc;

image = imread('../Imagens/Benchmark5/t3-rotated.jpg');

gray = rgb2gray(image);

figure,imshow(gray),title('Escala de Cinza');

