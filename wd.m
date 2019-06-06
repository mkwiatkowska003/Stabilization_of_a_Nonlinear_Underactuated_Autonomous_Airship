function [out] = wd(k, ni, p, t, E)

kz = k(13);

v = ni(2);

y = p(2);
z = p(3);

stage1 = 2*(sqrt(abs(v) + abs(y)));
out = -kz*z + stage1*sin(t/E);
end

