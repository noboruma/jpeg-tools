function [ Fq ] = Fquality( quality )

    if quality <= 50
        Fq = 50 / quality;
    else
        Fq = 2 - quality/50;
    end

end

