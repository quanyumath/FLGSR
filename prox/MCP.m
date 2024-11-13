function y = MCP(x, alpha)

if abs(x) <= alpha
    y = abs(x) - x.^2 / 2 / alpha;
else
    y = alpha / 2;
end

end
