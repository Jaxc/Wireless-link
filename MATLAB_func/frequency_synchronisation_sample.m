function [signal_corrected,phi_updated,theta_updated,theta_updated_2] ...
    = frequency_synchronisation_sample...
    (signal_sample,phi_updated,theta_updated,theta_updated_2)
%S=sprintf('------------------------------------------');
%disp(S)
% Finding the correct phase phi.
phi_updated;
theta_updated;
signal_angle = angle(signal_sample)*180/pi;
phi = floor((angle(signal_sample) + ...
    phi_updated + theta_updated_2).*2./pi).*pi./2 + pi./4;
phi_deg = phi*180/pi;

% Finding the rotation.
rotation = phi - angle(signal_sample) - phi_updated - theta_updated_2;

% Updating the "filter" parameters phi_updated, theta_updated and
% theta_updated_2.

% The exact value is used. The value 3.7 works.
if (abs(signal_sample) > 0.8)
    phi_updated = phi_updated + 0.05.*rotation;
    theta_updated = theta_updated + 0.1.*0.02.*rotation;
end
theta_updated_2 = theta_updated_2 + theta_updated;
% Correcting for the rotation.
signal_corrected = signal_sample.*exp(1i.*(phi_updated + theta_updated_2));

end