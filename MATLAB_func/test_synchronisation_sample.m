clc;
clear all;
close all;

theta = [-3-3.*j -3-j -3+j -3+3.*j;
    -1-3.*j -1-j -1+j -1+3.*j;
    1-3.*j 1-j 1+j 1+3.*j;
    3-3.*j 3-j 3+j 3+3.*j];
N = 4000; % Number of symbols.

% Generating integer numbers in the interval [1,16].
numbers = randi([1 16],1,N);

% Generating the signal and the start of the signal.
signal = theta(numbers);
signal(1) = 3 + j.*3;
signal(2) = 3 + j.*3;
signal(3) = 3 + j.*3;
signal(4) = 3 + j.*3;

phi = 0.12*pi; % The phase rotation.
%phi=0;
signal_before_rotation = signal;

% The signal gets a constant phase rotation.
signal = signal.*exp(j.*phi);

% Rotating the signal by a complex number in order to generate noise
% that rotates the signal.
for i = 1:N
    phi_2 = 0.0.*randn(1,1) + 0.00*i^1;
    signal(i) = signal(i).*exp(j.*phi_2);
end
signal=signal+randn(1,numel(signal))*0.05+1i*randn(1,numel(signal))*0.05;
figure()
plot(signal,'.')

% Initialising constants, variables and vectors.
exact_value = (abs(3 + 1i.*3) + abs(3 + 1i.*1))./2;
first_start = 1;
phi_updated = 0;
theta_updated = 0;
theta_updated_2 = 0;
theta_updated_2_vec = zeros(1,N);
phi_updated_vec = zeros(1,N);
signal_corrected = zeros(1,N);

% Performing the phase synchronisation. The 4 first symbols are known (the
% absolute value is used) so that much rotation is used for these symbols
% and after that the rotation is possibly updated little in each
% iteration of the loop.
for i = 4:N
    if (abs(signal(i)) > exact_value && abs(signal(i - 1)) > exact_value && ...
            abs(signal(i - 2)) > exact_value && ...
            abs(signal(i - 3)) > exact_value && first_start == 1)
        start = 1;
        [signal_corrected(i - 3),phi_updated] = ...
            phase_synchronisation_sample(signal(i - 3),phi_updated,start);
        first_start = 0;
    else
        start = 0;
        [signal_corrected(i - 3),phi_updated,theta_updated,...
            theta_updated_2] = frequency_synchronisation_sample(...
            signal(i-3),phi_updated,theta_updated,theta_updated_2,exact_value);
    end
    if (i == N)
        for j = 1:3
            [signal_corrected(N - 3 + j),phi_updated,theta_updated,theta_updated_2] = ...
                frequency_synchronisation_sample(signal(N - 3 + j),...
                phi_updated,theta_updated,theta_updated_2,exact_value);
        end
    end
    theta_updated_2_vec(i) = theta_updated_2;
    phi_updated_vec(i) = phi_updated;
end

% % % Performing frequency synchronisation.
% for i = 1:N
%     [signal_corrected_2(i),phi_updated,theta_updated,theta_updated_2] ...
%         = frequency_synchronisation_sample(...
%         signal_corrected(i),phi_updated,theta_updated,theta_updated_2);
% end


% This loop is used in order to find the position of the symbol in the 
% theta matrix.
for i = 1:N
    for j = 1:4
        for k = 1:4
            distance(j,k) = abs(signal_corrected(i) - theta(j,k));
        end
    end
    [~,index_1] = min(min(distance,[],1));
    [~,index_2] = min(min(distance,[],2));
    
    signal_test(i) = theta(index_2,index_1);
end

errors = signal_test - signal_before_rotation;
errors_norm = norm(errors)

figure
plot(signal,'.')
hold on
%plot(signal_corrected,'r.')
hold on
plot(signal_corrected(1000:end), 'r.');
grid on
%plot(signal_corrected_2,'m.')
axis([-4 4 -4 4])
axis equal
figure
plot(theta_updated_2_vec)
title('Accumulated frequency phase correction');
figure
plot(phi_updated_vec)
hold on
plot(-phi.*ones(1,N),'r')
title('Phase offset per symbol');
grid on