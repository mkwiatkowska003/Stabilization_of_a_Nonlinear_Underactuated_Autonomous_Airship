function [out] = wd( t, ep, eta, ni, kz)
eta1 = eta(1:3,1);
eta2 = eta(4:7,1);

v = ni(2);

y = eta1(2);
z = eta2(3);

stage1 = 2*(sqrt(abs(v) + abs(y)));
out = -kz*z + stage1*sin(t/ep);
end

