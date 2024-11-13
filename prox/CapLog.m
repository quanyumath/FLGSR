function y = CapLog(x, theta, nv)

a = 1 / log(1+nv/theta);
y = min(1, a*log(1+abs(x)./theta));

end
