% eta_1 - kartezjan„ska reprezentacja polozenia
% eta_2 - kwaternionowa reprezentacja orientacji odpowiednio przeksztalcona
% tj. z odpowienia waga osi obrotu od kata obrotu

syms x y z e_0 e_1 e_2 e_3 
syms u v w p q r

eta_1 = [x; y; z]
eta_2 = [e_0; e_1; e_2; e_3]


J = J_eta_2_dependend(eta_2);
R = R_eta_2_dependend(eta_2);

ni = [u; v; w; p; q; r]

stage_matrix = [R             zeros(3,3);...
                zeros(4,3)    J];


state = [eta_1; eta_2]
state_prim = stage_matrix * ni