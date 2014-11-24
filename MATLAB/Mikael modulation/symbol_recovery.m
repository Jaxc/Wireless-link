function [ symbol ] = symbol_recovery( samples, sps )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
avg=5;
error=zeros(1,avg);
symbol=zeros(1,numel(samples)/sps-1);
inner=1;
offset=0;
for outer=1:numel(samples)/sps-1
    %max_index(max_index==0)=[];
%     if min(size(max_index))==0
%        max_index=sps/2; 
%     end
    error
    mean(error)
    if inner==avg
        %offset=offset+round(mean(error))
    end
    sample_batch=samples((outer-1)*sps+offset+1:outer*sps+offset);
    noSample_batch=numel(sample_batch)
    [symbol(outer) error(inner)]=sample_symbol(sample_batch);
    inner=mod(inner,avg)+1;
end
end

