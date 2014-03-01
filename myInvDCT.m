function [ B ] = myInvDCT( D )
    [n,m,z] = size(D);
    Xm = zeros(n,m);
    Ym = zeros(n,m);
    
    C = [ 1/sqrt(2) 1 1 1 1 1 1 1 ];
    
    for i = 1:8
        for j = 1:8
            Xm(i,j) = (1/2) * C(i) * cos(((2*(j-1)+1)*pi*(i-1))/16);
            Ym(i,j) = (1/2) * C(i) * cos(((2*(j-1)+1)*pi*(i-1))/16);
        end
    end
    B = double(inv(Xm)*D*Ym);
end

