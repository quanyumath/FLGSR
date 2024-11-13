function y = prox_CapLp(z, lambda, p, nv)

if p == 1
    if z <= nv + lambda ./ nv
        y = max(z-lambda./nv, 0);
    else
        y = z;
    end
elseif 0 < p && p < 1
    u1 = min(max(prox_Lp(z, lambda./nv^p, p), 0), nv);
    u2 = max(nv, z);
    if 0.5 * (u1 - z).^2 + lambda .* CapLp(u1, p, nv) <= 0.5 * (u2 - z).^2 + lambda .* CapLp(u2, p, nv)
        y = u1;
    else
        y = u2;
    end
end

end
