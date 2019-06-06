function [out] = B_r(P)

P1 = P(1);
P2 = P(2);

out = [eye(3);...
       0 0 0;...
       P1^3 0 0;...
       0 -P2 0];  
   
end

