function [ output ] = RX_RRC_filtering( samples, sps, window )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
negt=0:-1/sps:-window/2;
t=[fliplr(negt(2:end)) 0:1/sps:window/2];
pulse=rtrcpulse(0.35,t);
output=conv(samples, pulse);
end

