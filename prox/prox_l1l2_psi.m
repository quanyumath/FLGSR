function E = prox_l1l2_psi(X, lambda, psi)

[D, ~] = size(X);
nm = sqrt(sum(X.^2, 1));
nms = prox_psi(nm, lambda, psi);
sw = repmat(nms./nm, [D, 1]);
E = sw .* X;

end