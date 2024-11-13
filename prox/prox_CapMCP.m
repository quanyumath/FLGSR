function y = prox_CapMCP(z, lambda, alpha, nv)

u1 = min(max(prox_MCP(z, lambda*2*alpha/nv/(2 * alpha - nv), alpha), 0), nv);
u2 = max(nv, z); y = u2;
i = find(0.5*(u1 - z).^2+lambda*CapMCP(u1, alpha, nv) <= 0.5*(u2 - z).^2+lambda*CapMCP(u2, alpha, nv));
y(i) = u1(i);
%     if CapMCP(u1)<=CapMCP(u2)
%         y = u1;
%     else
%         y = u2;
%     end

end
