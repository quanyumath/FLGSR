function y = CapMCP(x, alpha, nv)

y = min(1, 2*alpha/nv/(2 * alpha - nv)*MCP(x, alpha));

end
