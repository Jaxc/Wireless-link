function [ symbol ] = gardner_symbol_recovery( samples, sps )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
error=1;
symbol=zeros(1,floor(numel(samples)/sps-1));
offset=1;
offsetvec=zeros(1,floor(numel(samples)/sps-1));
thesame=0;
for outer=1:floor(numel(samples)/sps-1)
    current_start=(outer-1)*sps+offset;
    symbol(outer)=samples(current_start);
    if thesame>15
        k=0.0001*8*8;
    else
        k=0.02*8*8;
    end
    error=error+k*((samples(current_start+sps/2)-mean([samples(current_start) samples(current_start+sps)]))*(samples(current_start)-samples(current_start+sps)));
    if offset==round(error)
        thesame=thesame+1;
    else
        thesame=0;
        offset=round(error);
    end
    %offset=1;
    offsetvec(outer)=offset;
end
figure()
plot(offsetvec);
end

