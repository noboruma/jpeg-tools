function [ MSE,NMSE, SNR ] = distorsion( X,Xr )
%Si l'image est en couleur, on la convertit en niveaux de gris
    [T,M,Z] = size(X);
    if(Z > 1)
        X = rgb2gray(X);
    end
    %Mettre X sous forme de vecteur
    X = reshape (X,1,length(X)*length(X));
    Xr = reshape (Xr,1,length(Xr)*length(Xr));
    %Distorsion
    MSE = mean((X- Xr).^2);
    %Variance de l'image d'origine
    Var = mean (double(X).^2) -((mean(X))^2);
    %Distorsion normalisée
    NMSE = MSE/Var;
    %Rapport signal à bruit
    SNR = - 10 * log10(NMSE);
end

