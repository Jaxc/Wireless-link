function [ ptmatrix ] = ptraintest(m, Ts,T,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

ptmatrix = zeros(1,round((length(m(1,:))+1)*n*Ts/T));
    for i = 1:length(m(1,:))
            ptmatrix(1,round((i)*n*Ts/T)+1) = m(1,i);
            ptmatrix(2,round((i)*n*Ts/T)+1) = m(2,i);


    end

