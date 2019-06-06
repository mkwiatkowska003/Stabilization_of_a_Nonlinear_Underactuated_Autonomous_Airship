function [tau] = tau(k, eta, ni, pv, Iv, P, Mq, Lp, Zw, B, zb, t, E, m33, m)
g = 9.81;

I11 = Iv(1);
I13 = Iv(2);
I22 = Iv(3);
I33 = Iv(4);

ku = k(1);
kv = k(2);
kw = k(3);
kp = k(4);
kq = k(5);
kr = k(6);

u = ni(1);
v = ni(2);
w = ni(3);
p = ni(4);
q = ni(5);
r = ni(6);

e0 = eta(1);
e1 = eta(2);
e2 = eta(3);
e3 = eta(4);

P1 = P(1);
P2 = P(2);

delta = I13^2 - I11*I33;

qd_val = qd(k,eta,ni,pv);
pd_val = pd(k,eta,ni,pv,t,E);
wd_val = wd(k, ni, p, t, E);

tau1 = 1/P2^3 * (-(I22*kq + Mq)*q + I22*kq*qd_val + 2*B*zb*e2);
tau2 = 1/(P2*I13) * ((delta*kp + Lp*I33)*p - delta*kp*pd_val - 2*B*zb*e1*I33);
tau3 = -(m33*kw + Zw)*w + m33*kw*wd_val + (B + m*g);

tau = [tau1; tau2; tau3]
end0

