%Barker = [1 1 1 1 1 0 0 1 1 0 1 0 1];

% for i = 1:length(Barker)
%    if Barker(i) == 1
%        barker_sym(4*i-3:4*i) = [1 0 0 0];
%    else
%        barker_sym(4*i-3:4*i) = [0 0 1 0];
%    end
% end

message = randi([0 1],4e5,1);

bits = [message'];

save('testvector.mat','bits');