function xyz = rgb2ciexyz(rgb)

C = makecform('srgb2xyz');
xyz = applycform(rgb,C);