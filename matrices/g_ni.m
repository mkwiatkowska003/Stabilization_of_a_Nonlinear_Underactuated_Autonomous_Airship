function [out] = g_ni(eta_2,m,B,zb,g)
e0 = eta_2(1);
e1 = eta_2(2);
e2 = eta_2(3);
e3 = eta_2(4);


out = [2*(B - m*g)*(e1*e3 - e0*e2);...
       2*(B - m*g)*(e2*e3 + e0*e1);...
       (B - m*g)*(1 - 2*(e1^2 + e2^2));...
       -2 * B * zb * (e0 * e1 + e2 * e3);...
        2 * B * zb * (e0 * e2 - e1 * e3);...
       0];

end

