addpath('./elements')

baloon = baloon_element();

baloon_mesh = baloon{1}{1};
baloon_verts = baloon{1}{2};
baloon_volume = baloon{1}{3};
inner_baloon_mesh = baloon{2}{1};
inner_baloon_verts = baloon{2}{2};
inner_baloon_volume = baloon{2}{3};
ba_volume = baloon_volume - inner_baloon_volume

body_line = [1,-2;3,-2;5,-1.5];

body = body_element(body_line,0.5);
body_mesh = body{1}{1};
body_verts = body{1}{2};
body_volume = body{1}{3};
inner_body_mesh = body{2}{1};
inner_body_verts = body{2}{2};
inner_body_volume = body{2}{3};
bo_volume = body_volume - inner_body_volume

figure(1)
trisurf(baloon_verts,baloon_mesh(:,1),baloon_mesh(:,2),baloon_mesh(:,3),'Facecolor','red','FaceAlpha',0.1);
hold on
axis equal
trisurf(inner_baloon_verts,inner_baloon_mesh(:,1),inner_baloon_mesh(:,2),inner_baloon_mesh(:,3),'Facecolor','blue','FaceAlpha',0.1);

trisurf(body_verts,body_mesh(:,1),body_mesh(:,2),body_mesh(:,3),'Facecolor','green','FaceAlpha',0.1);
trisurf(inner_body_verts,inner_body_mesh(:,1),inner_body_mesh(:,2),inner_body_mesh(:,3),'Facecolor','cyan','FaceAlpha',0.1);





