function [ codeFinal,taux ] = codJPG( img, Quality )

    [n,m,z] = size(img);
    if z ~= 1
        img = rgb2gray(img);
    end
    
    %Etape 1 : enlever 128 à chaque pixel
    img = double(img) - 128;
    
    %Etape 2-1 : Diviser l'image en bloc 8x8
    max_i = n / 8;
    max_j = m / 8;
    
    blocs =  zeros(8,8,max_i*max_j);
    BlocsDCT =  zeros(8,8,max_i*max_j);
    for k = 1: max_i
        for h = 1: max_j
            for i = 1: 8
                for j = 1: 8
                    blocs(i,j,(k-1)*max_i+h) = img(i+(k-1)*8,j+(h-1)*8);
                end
            end
        end
    end
    
    QM=QuantM(Quality); 
   
    zig=getZigZag();
 
    codeFinal = [];
    nz = 0;

    for k = 1: max_i * max_j
        BlocsDCT(:,:,k) = MyDCT(blocs(:,:,k));
        Dq=  floor((BlocsDCT(:,:,k)./double(QM)) + 0.5);
        Vzig=Dq(zig);
        codeFinal = [codeFinal code(Vzig,Vzig(1)-nz,8)];
        nz =Vzig(1)-nz;
    end
    taux = (1 - (length(codeFinal)/length(img(:))))*100;%taux de compression
end

