clc;
clear all;
close all;

% %% Symbol synchronisation (sampling).
% 
% % Finding the error signal due to the wrong sampling point. It has to be
% % found what 0.5 implies in this case with discrete samples.
% error_i = @(t) x_real*(x_real(t - 0.5) - x_real(t + 0.5));
% error_q = @(t) x_imaginary(x_imaginary(t - 0.5) - x_imaginary(t + 0.5));
% 
% error_total = error_i + error_q;
% 
% % Constant used for finding new sampling point. Could possibly be
% % updated (decreased)?
% alpha = 0.1;
% 
% % Updating the sampling point depending on the sign so that it becomes more
% % correct.
% if (sign(error_total > 0))
%     error_i_1 = error_i(t + alpha);
%     error_q_1 = error_q(t + alpha);
%     error_sampling = error_i_1 + error_q_1;
% else if (sign(error_total < 0))
%         error_i_1 = error_i(t - alpha);
%         error_q_1 = error_q(t - alpha);
%         error_sampling = error_i_1 + error_q_1;
%     end
% end

%% Phase synchronisation.
theta =  [-3-3.*j -3-j -3+j -3+3.*j;
    -1-3.*j -1-j -1+j -1+3.*j;
    1-3.*j 1-j 1+j 1+3.*j;
    3-3.*j 3-j 3+j 3+3.*j];

phi = pi./8;

theta_16_1 = theta.^16;
theta_rotated = theta.*exp(j.*phi);

theta_16_2 = theta.^16;
angle(theta_16_2);

% Finding the rotation.
rotation = angle(theta) - angle(theta_rotated);

% Initialising the phase parameter phi.
phi = 0;

% Correcting for the rotation and updating the parameter phi.
theta_corrected = theta.*exp(j.*0.02.*rotation);
phi = phi + 0.02.*rotation;

figure
plot(theta,'b.')

figure
plot(theta_rotated,'b.')

figure
plot(theta_corrected,'b.')

%% Frame synchronisation.

x_start = 2.*[1 1 1 1 1 0 0 1 1 0 1 0 1] - 1;
x = 2.*[1 0 1 0 1 0 1 1 1 0 0 0 1 0 1 1 0 1 0 0 1] - 1;

noise = 2.*[0 1 0 0 0 1 0 1 0] - 1;


y = [noise x_start x];

figure
plot(xcorr(x_start,y))

x1 = x;
x1(1:4) = -1;
x1(5:10) = 1;
x1(15:18) = 1;
x1(21) = -1;

x_start_received = x_start;
x_start_received(1) = -1;
x_start_received(5) = -1;
x_start_received(end - 1) = 1;

y = [noise x_start_received x1];

% Find the index of the first peak of the cross-correlation between the
% known start sequence and the message y. There can be several peaks so
% only the first peak is interesting for detecting the start of the
% message.
[~,index] = max(xcorr(x_start,y))

figure
plot(xcorr(x_start,y))

length_message_sent = length(x_start) + length(x)
% length_start = length(xcorr(x_start,x_start));

start = length(y) - index + length(x_start)
message = y(start + 1:end);

error = sum(x - message)
error_x = sum(abs(x - x1))

%% Test of a function that makes phase synchronisation for each sample.
% function [signal,theta] = phase_synchronisation(signal,theta)
%     % This function performs phase synchronisation. Reference: page 9 in
%     % the presentation of synchronization (the lecture) given by Thomas
%     % Eriksson.
%     
%     % Finding the estimate of the phase (phi) based on the phase/angle of
%     % the signal (possibly the current sample of the signal) and the
%     % parameter theta which is based on previous signals/samples.
%     phi_hat = angle(signal) + theta;
%     
%     % Finding the correct phase.
%     phi = (floor(phi_hat.*2./pi)).*pi./2 + pi./4;
%     phase_error = phi - phi_hat; % Finding the error.
%     
%     theta = theta + 0.02.*phase_error;
%     
%     % Performing the rotation/correction.
%     signal = signal.*exp(j.*theta);
% end