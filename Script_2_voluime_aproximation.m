ba_vol_approx = approximate_volume(baloon_mesh,inner_baloon_mesh,baloon_volume,inner_baloon_volume,50000)
bo_vol_approx = approximate_volume(body_mesh,inner_body_mesh,body_volume,inner_body_volume,50000)

figure(2)
scatter3(ba_vol_approx(:,1),ba_vol_approx(:,2),ba_vol_approx(:,3))
hold on
axis equal
scatter3(bo_vol_approx(:,1),bo_vol_approx(:,2),bo_vol_approx(:,3))


function [volume_approximation_points] = approximate_volume(mesh_a,mesh_b,volume_a,volume_b,volume_point_count)
lim_min = min(mesh_a) - 0.01;
lim_max = max(mesh_a) + 0.01;

actual_volume_point_count = 0;
volume_approximation_points = zeros(volume_point_count,3);

while actual_volume_point_count < volume_point_count
    factor = rand(1,3);
    random_point = lim_min .* factor + lim_max .* (1 - factor);
    
    if is_inside(random_point,mesh_a,mesh_b,volume_a,volume_b)
        actual_volume_point_count = actual_volume_point_count + 1;
        volume_approximation_points(actual_volume_point_count,:) = random_point;
        disp([num2str(actual_volume_point_count*100/volume_point_count) '%'])
    end
end

end



function b = cond1(x,p1,v1)
[~,v] = boundary([p1;x],0);
b = v > v1+0.0001;
end

function b = cond2(x,p2,v2)
[~,v] = boundary([p2;x],0);
b = v > v2 + 0.0001;
end

function b = is_inside(p,p1,p2,v1,v2)
b = ~cond1(p,p1,v1) && cond2(p,p2,v2);
end