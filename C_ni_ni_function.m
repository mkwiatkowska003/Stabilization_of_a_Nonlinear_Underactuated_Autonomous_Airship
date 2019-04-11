function [ C_ni ] = C_ni_ni_function(mass_v,inertia_v, ni, V )

[u, v, w] = ni(1,1:3);
[p, q, r] = ni(1,4:6);

m11 = mass_v(1);
m22 = mass_v(2);
m33 = mass_v(3);

C_ni = [0 -m22*r m33*q 0 0 0;...
        m11*r 0 -m33*p 0 0 0;...
        -m11*q m22*p 0 0 0 0;...
        0 (Yv-Zz)*w 0 inertia_v(4)*q -inertia_v(2)*r inertia_v(3)*q;...
        0 0 (Zz-Xu)*u -inertia_v(4)*p-inertia_v(1)*r 0 inertia_v(3)*p+inertia_v(4)*r;...
        (Xu-Yv)*v 0 0 -inertia_v(1)*q inertia_v(2)*p -inertia_v(4)*q];
    
end

