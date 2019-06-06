addpath('./matrices')
load('mass_approx')
syms x y z e_0 e_1 e_2 e_3 
syms u v w p q r

g = 9.81;

eta_1 = [x; y; z]
eta_2 = [e_0; e_1; e_2; e_3]

m = mass;
X_x = 0;
Y_y = 0;
Z_z = 0;

m_11 = m + X_x;
m_22 = m + Y_y;
m_33 = m + Z_z;
mass_v = [m_11 m_22 m_33];

K_x = 0;
K_z = 0;
M_y = 0;
N_x = 0;
N_z = 0;

I = I

I_11 = I(1,1) + K_x;
I_13 = I(1,3) + K_z; 
I_22 = I(2,2) + M_y;
I_33 = I(3,3) + N_z;
I_31 = I(3,1) + N_x;
inertia_v = [I_11 I_13 I_22 I_33 I_31];

P1 = 2.5;
P2 = -5;
P = [P1 P2];

ni = [u v w p q r];

M_ni = [m_11 0 0 0 0 0;...
        0 m_22 0 0 0 0;...
        0 0 m_33 0 0 0;...
        0 0 0 I_11 0 I_13;...
        0 0 0 0 I_22 0;...
        0 0 0 I_13 0 I_33];

Xu = 1;
Yv = 2;
Zw = 2;
Lp = 1;
Mq = 1;
Nr = 1;

D_v = diag([-Xu -Yv -Zw -Lp -Mq -Nr]);
param = [Xu Yv Z_z];
    
C_ = matlabFunction(C_ni(mass_v, inertia_v, ni,param));   
J_ = matlabFunction([R(eta_2) zeros(3,3);...
                     zeros(4,3) J(eta_2)]);
B_ = B_r(P);
B = mass*g*0.99;
zb = 0.1;
g_ = matlabFunction(g_ni(eta_2,mass,B,zb,g));

k = [2 0.5 1 0.4 1.6 0.05 0 0.05 1.24 0.2 2 0.5 0.8];
eta = [0.5; -0.4; 0.5; 0; 0.1; 0.1; 0.1]
tau_val = tau(k)

t = 0;
tn = 0.001;
tend = 80;

while(t < tend)
    
end