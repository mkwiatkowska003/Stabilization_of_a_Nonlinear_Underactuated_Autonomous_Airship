function [out] = pd(k, eta, ni, p, t, E)
ku = k(1);
kv = k(2);
kw = k(3);
kp = k(4);
kq = k(5);
kr = k(6);

ke0 = k(7);
ke1 = k(8);
ke2 = k(9);
ke3 = k(10);

kx = k(11);
ky = k(12);
kz = k(13);

e0 = eta(1);
e1 = eta(2);
e2 = eta(3);
e3 = eta(4);

u = ni(1);
v = ni(2);
w = ni(3);
p = ni(4);
q = ni(5);
r = ni(6);

x = p(1);
y = p(2);
z = p(3);

stage1 = (kv*v + ky)/sqrt(abs(v) + abs(y));
out = -kr*r - ke3*e3 - ke1*e1 + stage1*sin(t/E);


end

