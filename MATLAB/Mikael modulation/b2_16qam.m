function [ sym ] = b2_16qam( bits )
%b2_16qam Returns a complex vector containing the 16QAM symbols
%corresponding to the bits in the input vector bits.
%   Detailed explanation goes here

amplitude=1/sqrt(2);
sym=[];
symindex=1;
for index=1:4:numel(bits)
    if bits(index) =='0'
        sign=-1;
    else
        sign=1;
    end
    if bits(index+1) =='0'
        re=sign*amplitude;
    else
        re=sign*amplitude/3;
    end
    if bits(index+2) =='0'
        sign=1;
    else
        sign=-1;
    end
    if bits(index+3) =='0'
        im=sign*amplitude;
    else
        im=sign*amplitude/3;
    end
    sym(symindex)=re+im*i;
    symindex=symindex+1;
end


end

