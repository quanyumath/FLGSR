function y = Psi(x, psi)

nv = 0.1; % Cap
p = 2 / 3; % LP    2/3
alpha = 1; % MCP 1
theta = 0.1; % Log

if strcmp(psi, 'L1')
    y = Lp(x, 1);
elseif strcmp(psi, 'Lp')
    y = Lp(x, p);
elseif strcmp(psi, 'MCP')
    y = MCP(x, alpha);
elseif strcmp(psi, 'Log')
    y = Log(x, theta);
elseif strcmp(psi, 'CapL1')
    y = CapLp(x, 1, nv);
elseif strcmp(psi, 'CapLp')
    y = CapLp(x, p, nv);
elseif strcmp(psi, 'CapMCP')
    y = CapMCP(x, alpha, nv);
elseif strcmp(psi, 'CapLog')
    y = CapLog(x, theta, nv);
end

end
