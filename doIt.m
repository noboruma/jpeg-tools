function [res] = doIt( str )
    toto = [1 20 50 100];
    for i = 1 : length(toto)
        I = imread(str);
        [n,m,z]=size(I);
        if(z == 3)
            I = rgb2gray(I);
        end
        I = reshape(I,n,m);
        [C,t] = codJPG(I,toto(i));
        D = decJPG(C,n,m,toto(i));
        [ MSE,NMSE, SNR ] = distorsion( I,D );
        toto(i)
        res = [ t, SNR ]
    end
end

