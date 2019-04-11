

m = 1;
X_x = 0;
Y_y = 0;
Z_z = 0;

m_11 = m + X_x;
m_22 = m + Y_y;
m_33 = m + Z_z;
mass_v = [m_11 m_22 m_33];

I_11 = 1;
I_22 = 1;
I_33 = 1;
I_13 = 1;
inertia_v = [I_11 I_22 I_33 I_13]

ni = [1 1 1 1 1 1];

M_ni = [m_11 0 0 0 0 0;...
        0 m_22 0 0 0 0;...
        0 0 m_33 0 0 0;...
        0 0 0 I_11 0 I_13;...
        0 0 0 0 I_22 0;...
        0 0 0 I_13 0 I_33];
    
C_ni = C_ni_ni_function(mass_v, inertia_v, ni);    