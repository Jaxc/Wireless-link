function [ y ] = rtrcpulse( a, t )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
tau=1;
t=t+0.000001;
tpi=pi/tau; amtpi=tpi*(1-a); aptpi=tpi*(1+a);
ac=4*a/tau; at=16*a^2/tau^2;
y=(sin(amtpi*t)+(ac*t).*cos(aptpi*t))./(tpi*t.*(1-at*t.^2));
y=y./norm(y);

end

