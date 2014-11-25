close all
diffs=pi*ones(1,13);
diffs=randn(1,13)*0.02+diffs;
medel=mean(diffs);
medel_abs=mean(abs(diffs));
diffs=[3.14 -3.13 3.12 3.11 -3.1];
if(medel_abs>pi/2 && abs(medel)<pi/2)
   medel2=medel-sign(medel)*pi; 
end
diffs
plot(diffs)
figure()
plot(unwrap(diffs))
unwrap(diffs)