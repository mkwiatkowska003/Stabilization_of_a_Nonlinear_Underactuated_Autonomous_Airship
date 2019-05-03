function [out] = body_element(line,r)

length = size(line,1);
density = 6;
okro = linspace(0,2*pi,density);
x = [];
y = [];
z = [];
for i = 1:length
    for jj = 1:density-1
        x = [x; line(i,1)];
        y = [y; sin(okro(jj)) * r];
        z = [z; line(i,2)+cos(okro(jj))*r];
    end
end

body = [x y z];
thickness = 0.025;
inner_body = (body +[0.15 0 -0.1])* (1-2 * thickness);

[body_vert,body_volume] = boundary(body,0);
[inner_body_vert,inner_body_volume] = boundary(inner_body,0);

out = {{body,body_vert,body_volume},{inner_body,inner_body_vert,inner_body_volume}};
end

