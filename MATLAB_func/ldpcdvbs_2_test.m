% ======================================================================= %
% LDPC Decoder (DVBS-2), bpsk (16-QAM)
% ======================================================================= %
clc
close all
%clear all
tstart = tic;
constants
% ======================================================================= %
% Simulation Chain
% ======================================================================= % % pre-allocate a vector for BER results
BERMCsim= zeros(1, length(EbN0));
FERMCsim= zeros(1, length(EbN0));
for i = 1:length(EbN0) % use parfor ('help parfor') to parallelize  
  tloop = tic;
  totErr = 0;  % Number of errors observed for the soft
  num = 0;     % Number of bits processed for the soft receiver
  num_frame = 0;
  frame_Err = 0;
  Eb = 1/(logM*R);
  sig(i) = sqrt((10^(-EbN0(i)/10))*Eb);
  hDemod = comm.RectangularQAMDemodulator('ModulationOrder',M,'BitOutput',true,...
    'SymbolMapping','Custom','CustomSymbolMapping',symbolmapping,...
    'NormalizationMethod','Average power','AveragePower',1,... 
    'DecisionMethod','Approximate log-likelihood ratio','VarianceSource','Property',...
    'Variance', sig(i)^2);
  % simulate
  while((totErr < maxNumErrs) && (num < maxNum))
  % ===================================================================== %
  % Begin processing one block of information
  % ===================================================================== %
    b = randi([0 1],k,1);
    b_coded = step(hEnc, b);
    b_coded_buff = buffer(b_coded,4)';
    m = bi2de(b_coded_buff,'left-msb');
    modded = QAM16(m);
    % [CHA] add Gaussian noise
    y = agnc(modded, sig(i)).'; % BSC
    %scatter(real(y),imag(y))
    LLRs2 = QAM16demod(y,d,Gain');
    LLRs = step(hDemod,y);
    ldpcDecOut = step(hdec,-LLRs2*10);

    
    %toc(tdecode);
   %===================================================================== %
    % End processing one block of information
  % ===================================================================== %
  % count the bit errors and evaluate the bit error rate

    bit_errorsV = bitxor(b,ldpcDecOut);
    berS=sum(bit_errorsV);
  if berS > 0 
      frame_Err = frame_Err+1;
  end 
  totErr = totErr + berS ;
  num = num +k;
  num_frame = num_frame+1;
    
%   disp(['+++ ' num2str(totErr) '/' num2str(maxNumErrs) ' errors. '...
%       num2str(num) '/' num2str(maxNum) ' bits. Projected error rate = '...
%       num2str(totErr/num, '%10.1e') '. +++']);
  end 
  BERMCsim(i) = totErr/num;
  FERMCsim(i) = frame_Err/num_frame;
  toc(tloop)
end
Result_LDPC_soft = [BERMCsim ; FERMCsim ; EbN0]; 
toc(tstart)
save('Result_LDPC_soft', 'Result_LDPC_soft');