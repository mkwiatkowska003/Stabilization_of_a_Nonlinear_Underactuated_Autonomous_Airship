function [ C_ni ] = C_ni_ni_function(mass_v,inertia_v, ni, V )

[u, v, w] = ni(1,1:3);
[p, q, r] = ni(1,4:6);

m11 = mass_v(1);
m22 = mass_v(2);
m33 = mass_v(3);

I11 = inertia_v(1);
I13 = inertai_v(2);
I22 = inertia_v(3);
I33 = inertia_v(4);
I31 = inertia_v(5);

C_ni = [0 -m22*r m33*q 0 0 0;...
        m11*r 0 -m33*p 0 0 0;...
        -m11*q m22*p 0 0 0 0;...
        0 (Yv-Zz)*w 0 I13*q -I22*r I33*q;...
        0 0 (Zz-Xu)*u -I13*p-I11*r 0 I33*p+I13*r;...
        (Xu-Yv)*v 0 0 -I11*q I22*p -I13*q];
    
end

