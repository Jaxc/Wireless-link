Barker = [1 1 1 1 1 0 0 1 1 0 1 0 1];

for i = 1:length(Barker)
   if Barker(i) == 1
       barker_sym(4*i-3:4*i) = [1 0 0 0];
   else
       barker_sym(4*i-3:4*i) = [0 0 1 0];
   end
end

message = randi([0 1],1e4,1);

bits = [barker_sym message'];

save('testvector.mat','bits');