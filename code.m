function [ A ] = code( Vzig,diff,nb )
        
    %Premier élément
    A = [nb diff];
    
    %Elements suivants
    
    %Trouver les indices des éléments non nuls
    Indices = find(Vzig);
    
    for i=2:length(Indices)%pas reprendre le premier
       
        A = [A (Indices(i) - Indices(i-1)-1) nb Vzig(Indices(i))];
        
    end
    %Zeros restants
    %if length(Indices) == 0 || Indices(end) ~= length(Vzig)
        A = [A 0 0];
    %end

end

