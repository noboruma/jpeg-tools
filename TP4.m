%%
Bref=[139 144 149 153 155 155 155 155;
     144 151 153 156 159 156 156 156;
     150 155 160 163 158 156 156 156;
     159 161 162 160 160 159 159 159;
     159 160 161 162 162 155 155 155;
     161 161 161 161 160 157 157 157;
     162 162 161 163 162 157 157 157;
     162 162 161 161 163 158 158 158];


%% DCT2

BrefDCT = MyDCT(Bref)

% Resultats 
% BrefDCT =
% 
%   1.0e+003 *
% 
%     1.2596   -0.0010   -0.0121   -0.0052    0.0021   -0.0017   -0.0027    0.0013
%    -0.0226   -0.0175   -0.0062   -0.0032   -0.0029   -0.0001    0.0004   -0.0012
%    -0.0109   -0.0093   -0.0016    0.0015    0.0002   -0.0009   -0.0006   -0.0001
%    -0.0071   -0.0019    0.0002    0.0015    0.0009   -0.0001   -0.0000    0.0003
%    -0.0006   -0.0008    0.0015    0.0016   -0.0001   -0.0007    0.0006    0.0013
%     0.0018   -0.0002    0.0016   -0.0003   -0.0008    0.0015    0.0010   -0.0010
%    -0.0013   -0.0004   -0.0003   -0.0015   -0.0005    0.0017    0.0011   -0.0008
%    -0.0026    0.0016   -0.0038   -0.0018    0.0019    0.0012   -0.0006   -0.0004



%% Table de quantifiquation QM

Quality=20;
QM=QuantM(Quality);  % fonction à compléter

% Resultats
% QM =
% 
%     40    28    25    40    60   100   128   153
%     30    30    35    48    65   145   150   138
%     35    33    40    60   100   143   173   140
%     35    43    55    73   128   218   200   155
%     45    55    93   140   170   255   255   193
%     60    88   138   160   203   255   255   230
%    123   160   195   218   255   255   255   253
%    180   230   238   245   255   250   255   248


%% Quantification 
     
Dq=  floor((BrefDCT./double(QM)) + 0.5);
%% Le parcours en ZigZag
zig=[1 9 2 3 10 17 25 18 ...
     11 4 5 12 19 26 33 41 ...
     34 27 20 13 6 7 14 21 ...
     28 35 42 49 57 50 43 36 ...
     29 22 15 8 16 23 40 37 ...
     44 51 58 59 52 45 38 41 ...
     24 32 38 46 53 60 61 54 ...
     47 40 48 55 62 63 56 64];
 
Vzig=Dq(zig);

%% Le Codage
% Exemple
% Pour le vecteur suivant:

% Vzig =
% 
%   Columns 1 through 20 
% 
%    115     0    -1     0    -1     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
% 
%   Columns 21 through 40 
% 
%      0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
% 
%   Columns 41 through 60 
% 
%      0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
% 
%   Columns 61 through 64 
% 
%      0     0     0     0

% Le code correspondant est 
% 8   115     % 8 bit pour coder la différence entre 115 premier element du
% bloc et  0 (on suppose qu'on a un bloc précédent dont le 1er elemnt vaut
% zéro)
% 1     8    -1     % il y a 1 seul zéro avant le deuxième coef non nul, ce
% coef est codé sur 8 bits et il vaut -1
% 1     8    -1     % il y a 1 seul zéro ........
% 0     0 % Le reste du vecteur est constitué de zéro.

% A = [8 115 1 8 -1 1 8 -1 0 0 1 0 0 ]

% Ecrire ici la fonction

A= code(Vzig,Vzig(1)-0,8);
Vzig2 = decode(A,A(2)+0);





