function [rt_norm] = gain_synch(rt_noise,mu)
P_mean = zeros(length(rt_noise)+1,1);
rt_norm = zeros(length(rt_noise),1);
P_mean(1) = mean(abs(rt_noise).^2);

for i = 1:length(rt_norm)-1
    sample = rt_noise(i);
    P_mean(i+1) = (1-mu)*P_mean(i)+mu*abs(sample).^2;
    rt_norm(i) = sample/sqrt(P_mean(i+1))*0.9;
end

e = zeros(length(rt_noise),1);
for i = 1:length(e)
e(i) = norm(rt_noise(i)-rt_norm(i));
end
end