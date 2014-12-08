function [ LLR ] = QAM16demod( y , d, Gsq)
LLR = zeros(length(y)*4,1);
ry = real(y);
iy = imag(y);
LLR(1:4:end) = ry;
LLR(2:4:end) = -abs(ry)+d;
LLR(3:4:end) = -iy;
LLR(4:4:end) = -abs(iy)+d;
LLR = Gsq.*LLR;
end

