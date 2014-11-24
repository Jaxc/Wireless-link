phi_out = 0;
theta_out = 0;
theta2_out = 0;
exact_value = 0.8%(abs(3 + 1i.*3) + abs(3 + 1i.*1))./2;
rad = linspace(0,2*pi,1000);
circle = exact_value*(cos(rad)+1i*sin(rad));
signal = signal/max(abs(signal));
figure(17)
plot(signal,'.')
hold on
plot(circle,'r')
%path(path, pa);

N=numel(signal);
signal_corrected=zeros(1,N);
theta_updated_2_vec = zeros(1,N);
theta_updated_vec = zeros(1,N);
phi_updated_vec = zeros(1,N);
if(first_start==1)
    running=0;
end
for ind= 4:N
  if (abs(signal(ind)) > exact_value && abs(signal(ind - 1)) > exact_value && ...
           abs(signal(ind - 2)) > exact_value && ...
           abs(signal(ind - 3)) > exact_value && first_start == 1 && running==0)
       [signal_corrected(ind - 3),phi_updated] = ...
           phase_synchronisation_sample(signal(ind - 3),phi_updated,1);
      running=1;
    else
        [signal_corrected(ind - 3),phi_updated,theta_updated,...
            theta_updated_2] = frequency_synchronisation_sample(...
            signal(ind-3),phi_updated,theta_updated,theta_updated_2);
            if(first_start==0)
                 running=1;
            end
    end
    theta_updated_2_vec(ind-3) = theta_updated_2;
    theta_updated_vec(ind-3) = theta_updated;
    phi_updated_vec(ind-3) = phi_updated;
    if (ind == N)
        for a = 1:3
            [signal_corrected(N - 3 + a),phi_updated,theta_updated,theta_updated_2] = ...
                frequency_synchronisation_sample(signal(N - 3 + a),...
                phi_updated,theta_updated,theta_updated_2);
        end
    end

end
figure(28)
plot(signal_corrected(1:end),'.')
symbols=signal_corrected;
phi_out=phi_updated_vec(N-4);
theta_out=theta_updated_vec(N-5);
theta2_out=theta_updated_2_vec(N-4);
figure(8888)
plot(theta_updated_2_vec)
title('Accumulated frequency phase correction');
figure(479)
plot(phi_updated_vec)
title('Phase offset per symbol');
hold off
figure(1337)
plot(symbols(100:end-20),'.')
clear all
% clearvars -except symbols running phi_out theta_out theta2_out