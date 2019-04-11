syms x y z e_0 e_1 e_2 e_3 
syms u v w p q r

eta_1 = [x; y; z]
eta_2 = [e_0; e_1; e_2; e_3]

m = 1;
X_x = 0;
Y_y = 0;
Z_z = 0;

m_11 = m + X_x;
m_22 = m + Y_y;
m_33 = m + Z_z;
mass_v = [m_11 m_22 m_33];

K_x = 0;
K_Z = 0;
M_y = 0;
N_x = 0;
N_z = 0;

I = [1 0 1;...
     0 1 0;...
     1 0 1];

I_11 = I(1,1) + K_x;
I_13 = I(1,3) + K_z; 
I_22 = I(2,2) + M_y;
I_33 = I(3,3) + N_z;
I_31 = I(3,1) + N_x;
inertia_v = [I_11 I_13 I_22 I_33 I_31];

P = [P1 P2];

ni = [1 1 1 1 1 1];

M_ni = [m_11 0 0 0 0 0;...
        0 m_22 0 0 0 0;...
        0 0 m_33 0 0 0;...
        0 0 0 I_11 0 I_13;...
        0 0 0 0 I_22 0;...
        0 0 0 I_13 0 I_33];
    
C = C_ni_ni_function(mass_v, inertia_v, ni);   
J = J_eta_2_dependend(eta_2);
B = B_r_dependend(P);