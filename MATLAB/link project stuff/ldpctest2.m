% ======================================================================= %
% Options
% ======================================================================= %
close all
clear all
nbyte = 10e4;
nbit = 8*nbyte;
k = 32400;
n_cw = ceil(nbit/32400);
n = 64800;
r = k/n;
R = r;
H = dvbs2ldpc(R);
M = 16; % 16-QAM
logM = log2(M);
nbit_tot = n_cw*n;
nsym = nbit_tot/logM;
hEnc = comm.LDPCEncoder(H);
symbolmapping =  [0 1 3 2 4 5 7 6 12 13 15 14 8 9 11 10];
Es = 1;
Eb = Es/(R*logM);
hdec = comm.LDPCDecoder(H,    'IterationTerminationCondition', 'Parity check satisfied', ...
    'MaximumIterationCount',        20, 'NumIterationsOutputPort',       true);

% ======================================================================= %
% Simulation Options
% ======================================================================= %
N = k;  % simulate N bits each transmission
maxNumErrs = 2000; % get at least 500 bit errors
maxNum = N*300; % OR stop if maxNum bits have been simulated
EbN0 = 0:0.5:7; % power efficiency range
%%  
 close all
 tstart = tic;
%     release(hDemod);
   
%   Coded
    k = 16
    b = randi([0 1],k,1)
    sig = 0.3;
          
     b_coded = step(hEnc, b)
     b_coded_buff = buffer(b_coded,4)'
     m = bi2de(b_coded_buff,'left-msb')+1
     modded = QAM16(m)
     y = agnc(modded, sig).';
tx = toc(tstart);
rx = tic; 
   hDemod = comm.RectangularQAMDemodulator('ModulationOrder',M,'BitOutput',true,...
    'SymbolMapping','Custom','CustomSymbolMapping',symbolmapping,...
    'NormalizationMethod','Average power','AveragePower',1,... 
    'DecisionMethod','Approximate log-likelihood ratio','VarianceSource','Property',...
    'Variance', sig^2);

     h_demod = toc(rx);
     LLRs = step(hDemod,y);
  ldpc = tic;
     ldpc_bits = step(hdec,LLRs);
  ldpc = toc(ldpc)        
 toc(tstart) 
     bit_errorsV = bitxor(b,ldpc_bits);
     berS=sum(bit_errorsV)   
     
     line = linspace(-2,2,500);
     x = 0.9487-0.3162;
      figure;
      scatter(real(y),imag(y))
      hold on
      scatter(real(modded),imag(modded),'k*')
      hold on
      plot(line,-x,'k.',line,0,'k.',line,x,'k.',-x,line,'k.',0,line,'k.',x,line,'k.')
      ylim([-2.5 2.5])
      xlim([-2.5 2.5])

% Uncoded
     
     b_2_buff = buffer(b,4)'
     m2 = bi2de(b_2_buff,'left-msb')+1
     modded2 = QAM16(m2)
     y2 = agnc(modded2, sig).';
     
       hDemod2 = comm.RectangularQAMDemodulator('ModulationOrder',M,'BitOutput',true,...
    'SymbolMapping','Custom','CustomSymbolMapping',symbolmapping,...           
     'NormalizationMethod','Average power','AveragePower',1);
 
      bits2 = step(hDemod2,y2);
      bit_errorsV2 = bitxor(b,bits2);
      berS2=sum(bit_errorsV2)
      
%       figure;
%       scatter(real(y2),imag(y2),'*')
%       hold on
%       scatter(real(modded),imag(modded))     