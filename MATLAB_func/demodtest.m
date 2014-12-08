close all 
clear all

k = 8;
G = ones(1,k);
d = 2/sqrt(10);
b = randi([0 1],1,k);
mb = buffer(b,4)';
m = bi2de(mb,'left-msb');
s = QAM16(m);
r = awgn(s,100,'measured');
LLR = QAM16demod(r,d,G');

figure
plot(real(r),imag(r),'*')
grid on
ylim([-1 1])
xlim([-1 1])