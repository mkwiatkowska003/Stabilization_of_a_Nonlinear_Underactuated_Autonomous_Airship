function [R] = R_eta_2_dependend(eta_2)
%macierz rotacji
e0 = eta_2(1);
e1 = eta_2(2);
e2 = eta_2(3);
e3 = eta_2(4);

R = [(1 - 2*(e2^2 + e3^2))  2*(e1*e2 - e3*e2)       2*(e1*e3 + e2*e0);...
     2*(e1*e2 + e3*e0)      (1 - 2*(e1^2 + e3^2))   2*(e2*e3 - e1*e0);...
     2*(e1*e3 - e2*e0)      2*(e2*e3 + e1*e0)       (1 - 2*(e1^2 + e2^2))];
end

