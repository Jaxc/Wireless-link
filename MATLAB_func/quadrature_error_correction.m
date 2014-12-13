function [signal_corrected] = quadrature_error_correction(...
    signal,signal_reference)

% signal is all the symbols.
% signal_reference is the 4 largest symbols.

signal = [real(signal) imag(signal)];
signal_reference = [real(signal_reference) imag(signal_reference)];

[V,D,U] = svd(signal_reference);
S = [D(1,1) 0;0 D(2,2)];

S_inverse = inv(S);

correction_matrix = U*S_inverse*U';

signal_corrected = signal*correction_matrix;

reference_corrected=signal_reference*correction_matrix;

signal_corrected = signal_corrected(:,1) + 1i.*signal_corrected(:,2);

reference_corrected = reference_corrected(:,1) + 1i.*reference_corrected(:,2);

signal_corrected = signal_corrected.*1.3416./mean(abs(reference_corrected));

end