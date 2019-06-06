load('vol_approx');

lead_ro = 11340;
rubber_ro = 1522;

ba_mass = ba_volume * rubber_ro;
bo_mass = bo_volume * lead_ro;

ba_vol_points = size(ba_vol_approx,1);
bo_vol_points = size(bo_vol_approx,1);

ba_unit_mass = ba_mass/ba_vol_points;
bo_unit_mass = bo_mass/bo_vol_points;

gravity_center = zeros(1,3);
for i = 1:ba_vol_points
    gravity_center = gravity_center + ba_unit_mass*ba_vol_approx(i,:);
end
for i = 1:bo_vol_points
    gravity_center = gravity_center + bo_unit_mass*bo_vol_approx(i,:);
end
mass = ba_mass + bo_mass
gravity_center1 = gravity_center / mass;


ba_vol_approx = ba_vol_approx - gravity_center1;
bo_vol_approx = bo_vol_approx - gravity_center1;

gravity_center = zeros(1,3);
for i = 1:ba_vol_points
    gravity_center = gravity_center + ba_unit_mass*ba_vol_approx(i,:);
end
for i = 1:bo_vol_points
    gravity_center = gravity_center + bo_unit_mass*bo_vol_approx(i,:);
end
gravity_center = gravity_center / (ba_mass + bo_mass);

figure(2)
scatter3(ba_vol_approx(:,1),ba_vol_approx(:,2),ba_vol_approx(:,3))
hold on
axis equal
scatter3(bo_vol_approx(:,1),bo_vol_approx(:,2),bo_vol_approx(:,3))
scatter3(gravity_center(:,1),gravity_center(:,2),gravity_center(:,3))

I_xx = 0;
I_xy = 0;
I_xz = 0;
I_yy = 0;
I_yz = 0;
I_zz = 0;


for i = 1:ba_vol_points
    point = ba_vol_approx(i,:);
    I_xx = I_xx + ba_unit_mass*(point(2)^2 + point(3)^2);
    I_xy = I_xy - ba_unit_mass*(point(1) * point(2));
    I_xz = I_xz - ba_unit_mass*(point(1) * point(3));
    I_yy = I_yy + ba_unit_mass*(point(1)^2 + point(3)^2);
    I_yz = I_yz - ba_unit_mass*(point(2) * point(3));
    I_zz = I_zz + ba_unit_mass*(point(1)^2 + point(2)^2);
end

for i = 1:bo_vol_points
    point = bo_vol_approx(i,:);
    I_xx = I_xx + bo_unit_mass*(point(2)^2 + point(3)^2);
    I_xy = I_xy - bo_unit_mass*(point(1) * point(2));
    I_xz = I_xz - bo_unit_mass*(point(1) * point(3));
    I_yy = I_yy + bo_unit_mass*(point(1)^2 + point(3)^2);
    I_yz = I_yz - bo_unit_mass*(point(2) * point(3));
    I_zz = I_zz + bo_unit_mass*(point(1)^2 + point(2)^2);
end

I = [I_xx I_xy I_xz;...
     I_xy I_yy I_yz;...
     I_xz I_yz I_zz]
 
