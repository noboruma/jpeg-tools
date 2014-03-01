function [ Vzig, Aprendre ] = decode( A, diff )
    Vzig = diff;
    i = 3;
    k = 2;
    while i <= length(A) && length(Vzig) < 64 && (~(k ~=2 && A(i) == 0 && A(k)==0)) % On suppose qu'il y'a toujours 0 0 
        if(mod(i,3) == 0 && A(i) ~= 0) % Si c'est le nombre de 0 qui précède.
            for j = 1: A(i)
                Vzig = [Vzig 0];
                if length(Vzig) > 64
                    toto = 2;
                end
            end
        else if (mod(i,3) == 2) % le coef
            Vzig = [Vzig  A(i)];  
            end
        end
        i = i+1;
        k = k+1;
    end
 
    if(i > length(A))% si on qrrive q lq fin de lq liste principale A
        Aprendre = [];
    else if (A(i) == 0 && A(k)==0)
        Aprendre = A(i+1:end);
    else
        Aprendre = A(i:end);
    end
    
    while length(Vzig) < 64 % Car on a des blocs de 8x8
        Vzig = [Vzig 0];
    end
end

