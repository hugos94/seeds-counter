function imSaida = filtroDaMedia(imEntrada,tamanhoDaJanela)

    imFrequencia = fft(imEntrada);
    filtroFrequencia = fspecial('average',[tamanhoDaJanela tamanhoDaJanela]);
    imSaidaFrequencia = imFrequencia*filtroFrequencia;
    imSaida = ifft(imSaidaFrequencia);

end