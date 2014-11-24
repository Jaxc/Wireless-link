function [ vhat ] = ldpcminsum_dec(H,Hnan, n_ite,y,~,n)
    m = y;
    M = diag(m);
    %VN initialization
    M_update = (H*M)+Hnan;
    
    
    for i = 1:2*n_ite
        if bitand(i,1) == 1
           %CN-update, step 2
           B = abs(M_update);
           minB = B;
           tempB = B;
           M_update(isnan(M_update)) = 1;
           signupd = sign(M_update);
           Msign = repmat(sign(prod(M_update,2)),1,n).*signupd;
           
           for j = 1:size(H,1)
               for l = 1:size(H,2)
                   tempB(j,l) = max(max(tempB))+1;
                   minB(j,l) = min(tempB(j,:));
                   tempB(j,l) = B(j,l);
                       
               end
           end
           minB = minB+Hnan;
           M_update = Msign.*0.5.*minB;
           
           %test  = repmat(sum(phi(abs(A)),2),1,3)-phi(abs(A))
        else
            L_total = m+nansum(M_update); % LLR total calculation,step 4
            L_total = L_total+randn(size(L_total)).*0.000001;
            vhat = -(sign(L_total)-1)/2;
            bittest = sum(mod(vhat*H',2));
            if sum(mod(vhat*H',2)) == 0;
                return
            end
            M_updatetest = H*diag(L_total) - M_update;%VN-update, step 3
            M_update = M_updatetest;
        end
        
    end

end

