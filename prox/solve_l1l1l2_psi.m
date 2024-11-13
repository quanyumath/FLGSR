function E = solve_l1l1l2_psi(X, lambda, psi)

[~, ~, D] = size(X);
nm = sqrt(sum(X.^2, 3));
nms = prox_psi(nm, lambda, psi);
sw = repmat(nms./nm, [1, 1, D]);
E = sw .* X;

end