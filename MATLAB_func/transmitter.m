clc
close all
clear all
bits='01010101000011110101110000110110000110100101101000011100010101010000000100100011010001010110011110001001101010111100110111101111';
bits=[bits bits bits bits bits];
bits2='11110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000';
bits=[bits2 bits bits2];
numel(bits)
sym=b2_16qam(bits);
plot(sym, '.')
title('Symbols to send')
figure()
sym=sym*exp(0.2*1i);
plot(sym, '.')
title('Rotated symbols');
figure()
sps=8;
span=10;
wave=TX_RRC_filtering(sym,sps,span);
wave=[0; 0.3; 0.9; 1; 0; wave]
wave=awgn(wave, 10, 'measured');
plot(real(wave), 'color', 'red');
hold on
plot(imag(wave), 'color', 'blue');
figure()

RX_wave=RX_RRC_filtering(wave, sps,span);
plot(real(RX_wave), 'color', 'red');
hold on
plot(imag(RX_wave), 'color', 'blue');
figure()
RX_wave=[[1 0 1 1]'; RX_wave];
re=gardner_symbol_recovery(real(RX_wave), sps);
im=gardner_symbol_recovery(imag(RX_wave), sps);
plot(re(40:end-20)+im(40:end-20)*1i, '.')
grid on
figure()
plot(re, 'color', 'red');
hold on
plot(im, 'color', 'blue');