function y = CapL1(x, lambda)
nv = 1;
nx = norm(x(:));
if nx <= nv + lambda / 2 / nv
    y = max(0, 1-lambda/nv/nx) * x;
else
    y = x;
end
end