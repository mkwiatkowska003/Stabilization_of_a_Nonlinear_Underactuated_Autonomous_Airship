function [ out ] = C_ni(mass_v,inertia_v, ni,param)

u = ni(1);
v = ni(2);
w = ni(3);
p = ni(4);
q = ni(5);
r = ni(6);

m11 = mass_v(1);
m22 = mass_v(2);
m33 = mass_v(3);

I11 = inertia_v(1);
I13 = inertia_v(2);
I22 = inertia_v(3);
I33 = inertia_v(4);
I31 = inertia_v(5);

Xu = param(1);
Yv = param(2);
Zz = param(3);

out = [0 -m22*r m33*q 0 0 0;...
        m11*r 0 -m33*p 0 0 0;...
        -m11*q m22*p 0 0 0 0;...
        0 (Yv-Zz)*w 0 I13*q -I22*r I33*q;...
        0 0 (Zz-Xu)*u -I13*p-I11*r 0 I33*p+I13*r;...
        (Xu-Yv)*v 0 0 -I11*q I22*p -I13*q];
    
end

