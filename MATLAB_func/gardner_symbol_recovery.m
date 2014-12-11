function [ symbol,offsetvec ] = gardner_symbol_recovery( samples, sps )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
error=1;
symbol=zeros(1,floor(numel(samples)/sps-1));
offset=1;
offsetvec=zeros(1,floor(numel(samples)/sps-1));
thesame=0;
k = 0.0005*8*8;

num_sample = numel(samples);

for outer=1:floor(num_sample/sps-1)
    current_start=(outer-1)*sps+offset;
    
%     if thesame>10
%         %k=0.0001*8*8;
%         k = 0.00001*8*8;
%     else
%         %k=0.02*8*8;
%         k = 0.05*8*8;
%     end
    if current_start+sps<=num_sample
        symbol(outer)=samples(current_start);
        error=error+k*(imag(samples(current_start+sps/2)-mean([samples(current_start) samples(current_start+sps)]))*imag(samples(current_start)-samples(current_start+sps)))/2;
        error=error+k*(real(samples(current_start+sps/2)-mean([samples(current_start) samples(current_start+sps)]))*real(samples(current_start)-samples(current_start+sps)))/2;
    end
        offset=round(error);

    %offset=1;
    offsetvec(outer)=offset;
end
% figure(15)
% plot(offsetvec)
% title('gardner offset')
end

