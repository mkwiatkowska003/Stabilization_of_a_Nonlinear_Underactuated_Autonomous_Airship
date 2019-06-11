function [out] = pd(t, ep, eta, ni, ky, ke1, ke3, kv, kr)
eta1 = eta(1:3,1);
eta2 = eta(4:7,1);

e1 = eta2(2);
e3 = eta2(4);


y = eta1(2);

v = ni(2);
r = ni(6);


stage1 = (kv*v + ky*y)/sqrt(abs(v) + abs(y));
out = -kr*r - ke3*e3 - ke1*e1 + stage1*sin(t/ep);
end

