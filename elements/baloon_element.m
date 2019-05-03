function [out,outputArg2] = ballon_element()
% profil sterowca jako cykloida
x = @(t,r) r*(t-sin(t));
y = @(t,r) r*(1-cos(t));

density = 10;
l=linspace(0,2*pi,density);
xv = squize(x(l,2),1.5);
yv = y(l,2);
% generowanie bryły balonu
xp = [];
yp = [];
zp = [];
for i = 1:(density -2)
    index = i + 1
    for jj = 1:density-1
        xp = [xp xv(index)];
        yp = [yp yv(index) * sin(l(jj))];
        zp = [zp yv(index) * cos(l(jj))];
    end
end

%  bryła większa
baloon_b = [xp' yp' zp']*.45
length = baloon_b(end,1) - baloon_b(1,1);
thickens = 0.00625;

%  bryła mniejsza
baloon_s = baloon_b * (1-thickens*2);
baloon_s(:,1) = baloon_s(:,1) + length * thickens;

[a,v1] = boundary(baloon_b,0);
[b,v2] = boundary(baloon_s,0);
out = {{baloon_b,a,v1},{baloon_s,b,v2}};
end

