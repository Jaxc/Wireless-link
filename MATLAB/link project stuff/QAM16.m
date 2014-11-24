function [ modded ] = QAM16(b_buff)
symbols = 1/sqrt(10)*[-3+3*1i -3+1*1i -3-3*1i -3-1*1i -1+3*1i -1+1i -1-3*1i -1-1i 3+3*1i 3+1*1i 3-3*1i 3-1*1i 1+3*1i 1+1*1i 1-3*1i 1-1*1i];
modded = symbols(round(m));
end

