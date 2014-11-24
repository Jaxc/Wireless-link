function[out]=agnc(in,sigma)
k = length(in);
n = sigma.*(randn(1, k) + 1i*randn(1,k));
out = n + in;

end