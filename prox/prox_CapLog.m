function y = prox_CapLog(z, lambda, theta, nv)

u1 = min(max(prox_Log(z, lambda./log(1+nv/theta), theta), 0), nv);
u2 = max(nv, z);
y = u2;
i = find(0.5*(u1 - z).^2+lambda.*CapLog(u1, theta, nv) <= 0.5*(u2 - z).^2+lambda.*CapLog(u2, theta, nv));
y(i) = u1(i);


end
