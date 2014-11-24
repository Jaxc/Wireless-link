close all 
clear all

a = 0.5;
F = 100;
Fs = F*8;
Ts = 1/Fs;
T = 1/F;
k = 4096;
M = 16;
ks = k/log2(M);
L = Fs/F;
b = randi([0 1],k,1);
%b = ones(k,1);
b_2_buff = buffer(b,4)';
b_int = bi2de(b_2_buff,'left-msb')+1;
m_syms = QAM16(b_int);
m_zeros = zeros(1,round(length(m_syms)*rand(1)/100));
m = [m_zeros m_syms];
xt = ptraintest(m,Ts,T)';

t = -3:Ts/T:3;
rtrc = rtrcpuls(a,t,1);

st = conv(xt,rtrc);

A_vec = zeros(length(st),1);
n = 0.0005;
n0 = 0.6;
A_vec(1) = (rand(1)+0.2)*n0;
for i = 2:length(A_vec-1)
    A_vec(i) = A_vec(i-1)+randn(1)*n;
end
A_vec = abs(A_vec);
r = 1;
sigma = 0.01;
st_gain = (A_vec.*st).';
st_gauss = agnc(st_gain,sigma);

rt = conv(st,rtrc);
rt_noise = conv(st_gauss,rtrc).';

t_rt = [0:1:(length(rt)-1)]*Ts;

mu = 0.008;

P_mean = zeros(length(rt)+1,1);
rt_norm = zeros(length(rt),1);
P_mean(1) = mean(abs(rt_noise).^2);

for i = 1:length(rt_norm)-1
    sample = rt_noise(i);
    P_mean(i+1) = (1-mu)*P_mean(i)+mu*abs(sample).^2;
    rt_norm(i) = sample/sqrt(P_mean(i+1));
end

% for i = T:T/2:(2*length(rt_noise)*Ts)
%     sample = rt_noise(round(i/Ts/2));
%     i_samp = round(2*i/T);
%     P_mean(i_samp) = (1-mu)*P_mean(round(i_samp)-1)+mu*abs(sample).^2;
%     rt_norm(i_samp) = sample/sqrt(P_mean(i_samp));
% end

e = zeros(length(rt),1);
for i = 1:length(e)
e(i) = norm(rt(i)-rt_norm(i));
end


%% Kalman filter implementation (for funsies)

sigu = 0.001*n;
C = sigma.^2*10;

A = [1 Ts ; 0 1];
B = [0 1]';
Q = sigu;
U = [0  sigu]';
H = [1 0];

s = zeros(2,length(rt)+1);
s(:,1) = [mean(abs(rt_noise).^2) 0];
M = [0.001 0 ; 0 0.01];
I = eye(2);

for i = 1:length(rt_norm)-1
    x = abs(rt_noise(i)).^2;
    sn = A*s(:,i);
    M = A*M*A'+B*Q*B';
    K = M*H'/(C+H*M*H');
    s(:,i+1) = sn+K*(x-H*sn);
    M = (I-K*H)*M;
end
Phat_k = s(1,:)';
rt_k =  rt_noise./sqrt((Phat_k(2:end)));
e_k = zeros(length(rt),1);
for i = 1:length(e_k)
e_k(i) = norm(rt(i)-rt_k(i));
end

figure(1)
subplot(2,1,1), plot(real(rt_norm))
title('Comparison between synchronized data and sent data')
hold on
grid on
subplot(2,1,1), plot(real(rt),'k')
subplot(2,1,2), plot(real(rt),'k')
title('Comparison between received data and sent data')
hold on
grid on
subplot(2,1,2), plot(real(rt_noise),'r')
ylim([-2 2])

figure(2)
plot(e)
hold on
plot(e_k)
title('error, euclidian distance between sent and synchronized data')

figure(3)
plot(P_mean)
hold on
plot(A_vec.^2)
hold on
plot(Phat_k)
title('A^2 compared to Phat')
legend('P_h_a_t','A^2','P_h_a_t Kalman')

figure(4)
subplot(2,1,1), plot(abs(real(rt_noise)-real(rt)),'r')
hold on
subplot(2,1,1), plot(abs(real(rt_norm)-real(rt)))
title('Comparison between synchronized data and received data (I)')
grid on
subplot(2,1,2), plot(abs(imag(rt_noise)-imag(rt)),'r')
hold on
subplot(2,1,2), plot(abs(imag(rt_norm)-imag(rt)))
title('Comparison between synchronized data and received data (Q)')
grid on
sum(e_k(1:end-1))
sum(e(1:end-1))
