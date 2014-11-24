function [ output ] = TX_RRC_filtering( symbols, samples_between, window )
%RRC_filtering Returns a root-raised cosine filtered vector of the symbols
%provided.
%   samples_between corresponds to the number of sample periods between
%   consecutive pulses in the output waveform. window specifies the length
%   of the filter and is given as a multiple of the symbol time. The output
%   vector is of length (symbols+window)*samples_between.
negt=0:-1/samples_between:-window/2;
t=[fliplr(negt(2:end)) 0:1/samples_between:window/2]
pulse=rtrcpulse(0.35,t);
sum(abs(pulse).^2)
symbol_train= [symbols; zeros(samples_between-1,length(symbols))];
symbol_train=symbol_train(:);

output=conv(symbol_train, pulse);
numel(output)

end

