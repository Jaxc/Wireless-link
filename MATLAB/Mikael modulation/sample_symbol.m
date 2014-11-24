function [ symbol error ] = sample_symbol( samples )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% if samples(1)>=0
%    zero_index=find(samples<0,1);
% else
%    zero_index=find(samples>=0,1); 
% end
% if min(size(zero_index))==0
%     zero_index=0;
% end
sample_index=round(numel(samples)/2);
[~, max_index]=max(abs(samples));
error=max_index-sample_index
symbol=samples(sample_index);

end

