function luv = rgb2LUV(rgb)

CXYZ = makecform('srgb2xyz');
xyz = applycform(rgb,CXYZ);
CLUV = makecform('xyz2uvl');
luv = applycform(xyz,CLUV);
