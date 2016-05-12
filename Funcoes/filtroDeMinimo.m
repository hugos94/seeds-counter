function imSaida = filtroDeMinimo(imEntrada,tamanhoDaJanela)

imSaida = double(~zeros(size(imEntrada)));

linhas = size(imEntrada,1);
colunas = size(imEntrada,2);

posicaoInicial = (1+tamanhoDaJanela)/2;
posicalFinalLinha = linhas+1-tamanhoDaJanela;
posicalFinalColuna = colunas+1-tamanhoDaJanela;
deslocamentoAPartirDoCentro = (tamanhoDaJanela-1)/2;

for i = posicaoInicial:posicalFinalLinha
    for j = posicaoInicial:posicalFinalColuna
        xmin = i-deslocamentoAPartirDoCentro;
        xmax = i+deslocamentoAPartirDoCentro;
        ymin = j-deslocamentoAPartirDoCentro;
        ymax = j+deslocamentoAPartirDoCentro;
        
        imSaida(i,j) = min(min(imEntrada(xmin:xmax,ymin:ymax)));
    end
end