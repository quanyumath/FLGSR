function y = CapLp(x, p, nv)

y = min(1, (abs(x) / nv).^p);

end
