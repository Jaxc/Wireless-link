function [ vhat ] = LDPCdecoder(H,Hnan, n_ite,y,sig,n,b)
    m = 2/(sig.^2)*y;
    M = diag(m);
    %VN initialization
    M_update = (H*M)+Hnan;
    
    for i = 1:2*n_ite
        if bitand(i,1) == 1
           %CN-update, step 2
           B = abs(M_update);
           phiB = phi(B);
           
           testnansum = nansum(phiB,2); 
           phitest = repmat( testnansum,1,n); 
           phisum  = phitest-phiB;
           phiinvtest= phi(phisum);
           M_update(isnan(M_update)) = 1;
           signupd = sign(M_update);
           Msign = repmat(sign(prod(M_update,2)),1,n).*signupd;
           M_update = Msign.*phiinvtest;
           
           %test  = repmat(sum(phi(abs(A)),2),1,3)-phi(abs(A))
        else
            L_total = m+nansum(M_update); % LLR total calculation,step 4
            vhat = -(sign(L_total)-1)/2;
            if sum(isnan(L_total)) > 0
            disp('Number of nans is:')%+num2str(sum(isnan(vhat))))
            end
            bittest = sum(mod(vhat*H',2));
            if sum(mod(vhat*H',2)) == 0;
                return
            end
            M_updatetest = H*diag(L_total) - M_update;%VN-update, step 3
            M_update = M_updatetest;
        end
        
    end

end
