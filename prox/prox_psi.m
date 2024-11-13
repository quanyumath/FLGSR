function y = prox_psi(x, lambda, psi)

nv = 10; % Cap
p = 0.6; % LP
alpha = 10; % MCP
theta = 1; % Log

if strcmp(psi, 'L1')
    y = prox_Lp(x, lambda, 1);
elseif strcmp(psi, 'Lp')
    y = prox_Lp(x, p, lambda);
elseif strcmp(psi, 'MCP')
    y = prox_MCP(x, lambda, alpha);
elseif strcmp(psi, 'Log')
    y = prox_Log(x, lambda, theta);
elseif strcmp(psi, 'CapL1')
    y = prox_CapLp(x, lambda, 1, nv);
elseif strcmp(psi, 'CapLp')
    y = prox_CapLp(x, lambda, p, nv);
elseif strcmp(psi, 'CapMCP')
    y = prox_CapMCP(x, lambda, alpha, nv);
elseif strcmp(psi, 'CapLog')
    y = prox_CapLog(x, lambda, theta, nv);
end

end
