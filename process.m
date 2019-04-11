function dn = process(x, ni)

%
% Równanie dynamiki procesu
%

% KINEMATICS

eta = [eta1; eta2]';
J= 1/2 * [-e1 -e2 -e3; e0 -e3 e2; e3 e0 -e1; -e2 e1 e0];

dn = J(eta(2))* ni;

end

function d = process(ni, tau)

% DYNAMICS


Cv = [0 -m22r m33q 0 0 0; m11r 0 -m33p 0 0 0; -m11q m22p 0 0 0 0; -m11*q m22*p 0 0 0 0 ; 0 (Yv-Zz)*w 0 I13*q -I22*r I33*q; 0 0 (Zz-Xu)*u -I13*p-I11*r 0 I33*p+I13*r; (Xu-Yv)*v 0 0 -I11*q I22*p -I13*q];

qv = [2*(B-m*g)*(e1*e3-e0*e2); 2*(B-m*g)*(e2*e3+e0*e1); (B-m*g)*(1 - 2*(e1*e1+e2*e2)); (-2)*(Bzb*(e0*e1+e2*e3)); 2*Bzb*(e0*e2-e1*e3); 0];
Br = [1 0 0; 0 1 0; 0 0 1; 0 0 0; P13 0 0; 0 -P12 0];
Dv = diag([-Xu -Yv -Zw -Lp -Mq -Nr]);
end
