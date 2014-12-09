% ======================================================================= %
% Options
% ======================================================================= %
nbyte = 10e6;
nbit = 8*nbyte;
k = 32400; %21600; %32400
n_cw = ceil(nbit/k);
n = 64800;
r = k/n;
R = r;
H = dvbs2ldpc(R);
M = 16; % 16-QAM
logM = log2(M);
nbit_tot = n_cw*k;
nsym = nbit_tot/logM;
hEnc = comm.LDPCEncoder(H);
symbolmapping =  [0 1 3 2 4 5 7 6 12 13 15 14 8 9 11 10];
hdec = comm.LDPCDecoder(H,    'IterationTerminationCondition', 'Parity check satisfied', ...
    'MaximumIterationCount',         40, 'NumIterationsOutputPort',       true);

% ======================================================================= %
% Simulation Options
% ======================================================================= %
N = k;  % simulate N bits each transmission
maxNumErrs = 2000; % get at least 500 bit errors
maxNum = N*100; % OR stop if maxNum bits have been simulated
EbN0 = 7:0.5:14; % power efficiency range
Gain = ones(1,n);
d = 2/sqrt(10);
