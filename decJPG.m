function [ img ] = decJPG( codeFinal, size_x, size_y, Quality )

    max_i = size_x / 8;
    max_j = size_y / 8;
    
    QM=QuantM(Quality); 
    blocs =  zeros(8,8,max_i*max_j);
    BlocsDCT =  zeros(8,8,max_i*max_j);
    img = zeros(size_x, size_y);
    
    zig= getZigZag();
 
    nz = 0;
    k = 1;
    Dq = double(zeros(8,8));
    %étape 4
    while length(codeFinal) ~= 0
        
        %Vecteur à decoder
        [Vzig, newCode] = decode(codeFinal, codeFinal(2)+nz);
        nz = codeFinal(2);
        codeFinal = newCode;
        
        for i = 1: length(Vzig)
            Dq(zig(i)) = Vzig(i);
        end
        % potentiel soucis qvec le floor !
        BlocsDCT(:,:,k) = Dq.*(double(QM)); 
        blocs(:,:,k) = myInvDCT(BlocsDCT(:,:,k));
        k = k + 1;
    end
 
    %Etape 2-1 : Diviser l'image en bloc 8x8
    for k = 1: max_i
        for h = 1: max_j
            for i = 1: 8
                for j = 1: 8
                   img(i+(k-1)*8,j+(h-1)*8) = blocs(i,j,(k-1)*max_i+h);
                end
            end
        end
    end
    
    %Etape 1 : add 128 à chaque pixel
    img = uint8(double(img) + 128);
end

