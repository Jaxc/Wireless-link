function y = rcpuls(a,t)
tau = 1; %Set symbol time
t = t+.0000001; %Insert offset to prevent NANs
tpi = pi/tau; atpi = tpi*a; at = 4*a^2/tau^2;
y = sin(tpi*t).*cos(atpi*t)./(tpi*t.*(1-at*t.^2));