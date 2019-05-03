function [out] = squize(y,factor)

maxv = max(y)
for i = 1:size(y)
    y = (y/maxv).^factor * maxv
end
out = y
end

