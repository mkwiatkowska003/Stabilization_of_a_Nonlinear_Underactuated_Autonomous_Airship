function [tau] = tau(k, eta, ni, Iv, P, Mq, Lp, Zw, B, zb, t, ep, m33, m)
g = 9.81;

I11 = Iv(1);
I13 = Iv(2);
I22 = Iv(3);
I33 = Iv(4);

kx = k(1);
ky = k(2);
kz = k(3);
ke1 = k(4);
ke2 = k(5);
ke3 = k(6);

ku = k(7);
kv = k(8);
kw = k(9);
kp = k(10);
kq = k(11);
kr = k(12);

u = ni(1);
v = ni(2);
w = ni(3);
p = ni(4);
q = ni(5);
r = ni(6);

eta1 = eta(1:3,1);
eta2 = eta(4:7,1);

e0 = eta2(1);
e1 = eta2(2);
e2 = eta2(3);
e3 = eta2(4);

P1 = P(1);
P2 = P(2);

delta = I13^2 - I11*I33;

qd_val = qd(eta,ni,kx,ke2,ku);
pd_val = pd(t,ep,eta,ni,ky,ke1,ke3,kv,kr);
wd_val = wd(t,ep,eta,ni,kz);

tau1 = 1/P2^3 * (-(I22*kq + Mq)*q + I22*kq*qd_val + 2*B*zb*e2);
tau2 = 1/(P2*I13) * ((delta*kp + Lp*I33)*p - delta*kp*pd_val - 2*B*zb*e1*I33);
tau3 = -(m33*kw + Zw)*w + m33*kw*wd_val + (B - m*g);

tau = [tau1; tau2; tau3];
end

