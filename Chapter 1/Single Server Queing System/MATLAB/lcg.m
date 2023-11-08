 function rnd = lcg(stream)
    load ('init.mat');
    zi = zrng(stream);
    lowprd = bitand(zi,65535, 'int32') * MULT1;
    hi31   = bitshift(zi,-16) * MULT1 + bitshift(lowprd,-16);
    zi     = (bitand(lowprd,65535, 'int32') - MODLUS) +  bitshift(bitand(hi31, 32767, 'int32'),16) ...
            + bitshift(hi31,-15);
    if  zi < 0
       zi  = zi + MODLUS;
    end
    lowprd = bitand (zi, 65535, 'int32') * MULT2;
    hi31   = bitshift(zi, -16) * MULT2 + bitshift(lowprd, -16);
    zi     = (bitand(lowprd, 65535, 'int32') - MODLUS) + bitshift(bitand(hi31, 32767, 'int32'), 16) ...
        + bitshift(hi31, -15);
    if zi < 0
       zi = zi + MODLUS;
    end
    zrng(stream) = zi;
    save('init.mat', 'MODLUS', 'MULT1', 'MULT2', 'zrng');
    rnd = bitor(bitshift(zi, -7), 1, 'int32') / 16777216.0;
end