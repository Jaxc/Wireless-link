function [signal_corrected] = phase_frequency_synchronisation(signal)
% This file should include the functions that are required in order to
% use this function in LabVIEW (where "signal" is an input vector and
% "signal" is the vector after sampling?). Because the output from
% the decoding is bits the synchronisation can not be done after decoding.

% A for loop will be used outside this function?

% Initialising variables and vectors.
first_start = 1;
phi_updated = 0;
theta_updated = 0;
theta_updated_2 = 0;
theta_updated_2_vec = zeros(1,N);
phi_updated_vec = zeros(1,N);
signal_corrected = zeros(1,N);

% This loop requires several samples or the knowledge about the index i and
% the samples at index i, i - 1, i - 2 and i - 3?

% Performing the phase synchronisation. The 4 first symbols are known (the
% absolute value is used) so that much rotation is used for these symbols
% and after that the rotation is possibly updated little in each
% iteration of the loop.

% This for loop is the loop that will be outside this function? But the if
% conditions can be inside the function?
for i = 4:N
    if (abs(signal(i)) > 4 && abs(signal(i - 1)) > 4 && ...
            abs(signal(i - 2)) < 1.5 && ...
            abs(signal(i - 3)) < 1.5 && first_start == 1)
        start = 1;
        [signal_corrected(i - 3),phi_updated] = ...
            phase_synchronisation_sample(signal(i - 3),phi_updated,start);
        first_start = 0;
    else
        start = 0;
        [signal_corrected(i - 3),phi_updated,theta_updated,...
            theta_updated_2] = frequency_synchronisation_sample(...
            signal(i-3),phi_updated,theta_updated,theta_updated_2);
    end
    if (i == N)
        for j = 1:3
            [signal_corrected(N - 3 + j),phi_updated,theta_updated,theta_updated_2] = ...
                frequency_synchronisation_sample(signal(N - 3 + j),...
                phi_updated,theta_updated,theta_updated_2);
        end
    end
    theta_updated_2_vec(i) = theta_updated_2;
    phi_updated_vec(i) = phi_updated;
end

end