function [J] = J_eta_2_dependend(eta_2)
e0 = eta_2(1);
e1 = eta_2(2);
e2 = eta_2(3);
e3 = eta_2(4);

J = (1/2)* [-e1 -e2 -e3;...
            e0 -e3  e2;...
            e3  e0 -e1;...
            -e2  e1  e0];
end

