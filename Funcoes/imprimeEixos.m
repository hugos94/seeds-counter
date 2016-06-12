function imprimeEixos(Propriedades,imMenosRuidosa)

    x = Propriedades.Centroid(1) + Propriedades.MajorAxisLength/2.0 * cosd(-Propriedades.Orientation);
    y = Propriedades.Centroid(2) + Propriedades.MajorAxisLength/2.0 * sind(-Propriedades.Orientation);

    coord1 = [x y];

    x = Propriedades.Centroid(1) - Propriedades.MajorAxisLength/2.0 * cosd(-Propriedades.Orientation);
    y = Propriedades.Centroid(2) - Propriedades.MajorAxisLength/2.0 * sind(-Propriedades.Orientation);

    coord2 = [x y];

    coord = [uint16(coord1) uint16(coord2)];

    pdist([coord1; coord2]);

    teste = mat2gray(imMenosRuidosa);

    teste = insertShape(teste,'Line',coord);

    figure, imshow(teste);

end