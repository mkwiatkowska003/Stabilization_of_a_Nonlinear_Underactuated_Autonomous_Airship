function [out] = qd(k, eta, ni, p)
ku = k(1);

ke2 = k(9);

kx = k(11);

e2 = eta(3);

u = ni(1);

x = p(1);
out = -ke2*e2 + kx*x - ku*u;
end

