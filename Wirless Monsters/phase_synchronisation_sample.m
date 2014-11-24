function [signal_corrected,phi_updated] = phase_synchronisation_sample(...
    signal_sample,phi_updated,start)

% Finding the correct phase phi.
phi = floor((angle(signal_sample) + phi_updated).*2./pi).*pi./2 + pi./4;

% Finding the rotation.
rotation = phi - angle(signal_sample) - phi_updated;

% Updating the "filter" parameter phi_updated. If it is the start of the
% message, much rotation is used. But if it is not the start of the
% message, the rotation is possibly updated little.
if (start == 1)
    phi_updated = rotation;
end

if (start == 0 && abs(rotation) < 1e-3)
    phi_updated = phi_updated + 0.02.*rotation;
end

% Correcting for the rotation.
signal_corrected = signal_sample.*exp(j.*phi_updated);

end