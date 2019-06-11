function [out] = qd(eta, ni, kx, ke2, ku)
eta1 = eta(1:3,1);
eta2 = eta(4:7,1);

x = eta1(1);

e2 = eta2(3);

u = ni(1);

out = -ke2*e2 - kx*x - ku*u;
end

